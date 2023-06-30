#!/usr/bin/python
# -*- coding: utf-8 -*-

import tkinter as tk
from tkinter import *
from tkinter import messagebox
from tkinter import scrolledtext
from tkinter import ttk, filedialog
from PIL import Image, ImageTk
from pyspark.context import SparkContext
from os import listdir
from newbig2 import BIG as bg
import sys, subprocess
import os
import _thread
import cv2
import shutil

#AM
sc = SparkContext.getOrCreate()
spark = SparkSession(sc)
#AM END

docker_path = '/home/jovyan/work/BIG2/BigSpark/'
#docker_path = ''

projects_path = docker_path + 'projects'

''' Retrieve the list of active projects, sorted by creation date (DESC) '''
def get_projects_list(directory_path):
     # Get a list of directories inside the specified directory
    directories = [entry for entry in os.scandir(directory_path) if entry.is_dir()]

    # Sort the directories by creation date
    sorted_directories = sorted(directories, key=lambda entry: entry.stat().st_ctime, reverse=True)

    # Extract the directory names from the sorted list
    directory_names = [entry.name for entry in sorted_directories]

    return directory_names


def browse(filetypes, var, extension_selector=None):
    file_path = filedialog.askopenfilename(filetypes=filetypes)
    if file_path:
        var.set(file_path)
        if file_path[-3:] == 'csv':
            extension_selector.set('CSV')

def close_import_wizard(import_window):
    import_window.destroy()
    create_main_window()

# Read form fields, create a project folder and run BIG
def start_analysis(import_window, project_title_input, log_file_input, petri_net_input):
    project_title = project_title_input.get()
    log_file = log_file_input.get()
    petri_net = petri_net_input.get()

    os.mkdir(os.path.join(projects_path, project_title))
    os.mkdir(os.path.join(projects_path, project_title, 'file'))
    os.mkdir(os.path.join(projects_path, project_title, 'grafi'))

    #if project_title[-3:] == 'csv':
    #    pass

    run_big(petri_net, log_file, project_title, import_window)


def open_project(projects_listbox):
    selected_project = projects_listbox.get(tk.ACTIVE)
    if selected_project:
        # Do something with the selected project
        print(f"Opening project: {selected_project}")
    else:
        messagebox.showerror("Error", "Please select a project")

def restore_black(event, project_title_input):
    project_title_input.config(fg='black')

def check_project_title(event, project_title_input, proceed_button, project_title_error_label):
    proceed_button['state'] = 'normal'
    project_title_error_label.config(text='')

    filename = project_title_input.get()
    invalid_chars = ['"', '*', ':', '<', '>', '?', '/', '\\', '|', '.']
    for char in invalid_chars:
        if char in filename:
            project_title_input.config(fg='red')
            project_title_error_label.config(text='The project title cannot contain the following characters: "*<>?/\\|.')
            proceed_button['state'] = 'disabled'

    # Check if there are other projects with the same name
    projects = get_projects_list(projects_path)
    for project in projects:
        if project == filename:
            project_title_input.config(fg='red')
            project_title_error_label.config(
                text='The project name cannot be equal to an existing project')
            proceed_button['state'] = 'disabled'


''' Create a new project '''
def open_import_wizard(window):
    # Create a new window for the import wizard
    window.destroy()
    import_window = tk.Tk()

    MAX_WIDTH = 550
    MAX_HEIGHT = 320
    import_window.wm_maxsize(MAX_WIDTH, MAX_HEIGHT)
    width_value = import_window.winfo_screenwidth()
    height_value = import_window.winfo_screenheight()
    x_position = (width_value - MAX_WIDTH) / 2
    y_position = (height_value - MAX_HEIGHT) / 2

    import_window.geometry("%dx%d+%d+%d" % (width_value, height_value, x_position, y_position))

    ico = Image.open(os.path.join(docker_path, 'icon.png'))
    photo = ImageTk.PhotoImage(ico)
    import_window.wm_iconphoto(False, photo)

    import_window.title("Import Wizard")

    title = tk.Label(import_window, text='Create a new project', width=15, font=('Roboto 13 bold'))
    title.grid(row=0, column=0, columnspan=40, pady=(10, 5), sticky= 'ew')

    px = (40, 2)
    py = (8,0)

    project_title_error_label = tk.Label(import_window, text='', fg='red')
    project_title_error_label.grid(row=5, column=0, columnspan=30, sticky='w', padx=px)
    project_title_label = tk.Label(import_window, text='Project title', font=('Roboto 10 bold')).grid(row=10, column=0, sticky='w', padx=px)
    project_title_var = StringVar()
    project_title_input = tk.Entry(import_window, textvariable=project_title_var, width=65)
    project_title_input.grid(row=20, column=0, sticky='w', padx=px, columnspan= 30)

    log_file_label = tk.Label(import_window, text='Log file', font=('Roboto 10 bold')).grid(row=25, column=0, sticky='w', padx=px, pady=py)
    log_file_var = StringVar()
    log_format = StringVar()
    log_format.set('XES')
    log_file_input = tk.Entry(import_window, textvariable=log_file_var, width=50)
    log_file_input.grid(row=27, column=0, sticky='w', padx=px, columnspan=20)
    log_file_browse = tk.Button(import_window, text='Browse', font=('Roboto 10'), width=10, command=lambda: browse((('eXtensible Event Stream', '*.xes'), ('Comma-Separated Values', '*.csv')), log_file_var, log_format)).grid(row=27, column=20, sticky='e')

    log_format_label = tk.Label(import_window, text='Log format', font=('Roboto 10 bold')).grid(row=30, column=0, sticky='w', padx= px, pady=py)
    log_format_input1 = tk.Radiobutton(import_window, text='XES', variable=log_format, value='XES')
    log_format_input1.grid(row=40, column=0, sticky='w', padx = px)
    log_format_input2 = tk.Radiobutton(import_window, text='CSV', variable=log_format, value='CSV')
    log_format_input2.grid(row=40, column=1, sticky='w')
    log_format_input1.config(state=DISABLED)
    log_format_input2.config(state=DISABLED)

    petri_net_label = tk.Label(import_window, text='Petri Net (.pnml)', font=('Roboto 10 bold')).grid(row=50, column=0, sticky='w', padx=px, pady=py)
    petri_net_var = StringVar()
    petri_net_input = tk.Entry(import_window, textvariable=petri_net_var, width=50)
    petri_net_input.grid(row=60, column=0, sticky='w', padx=px, columnspan=20)
    petri_net_browse = tk.Button(import_window, text='Browse', font=('Roboto 10'), width=10, command=lambda: browse((('Petri Net Markup Language', '*.pnml'), ('All Files', '*.*')), petri_net_var)).grid(row=60, column=20, sticky='e')

    lb = tk.Label(import_window, text='').grid(row=65, column=0)

    cancel_button = tk.Button(import_window, text="Cancel", font=('Roboto 10'), width=10, command=lambda: close_import_wizard(import_window))
    cancel_button.grid(row=70, column=19, sticky='e')

    proceed_button = tk.Button(import_window, text="Analyze", font=('Roboto 10'), width=10, command=lambda: start_analysis(import_window, project_title_input, log_file_input, petri_net_input))
    proceed_button.grid(row=70, column=20, padx=(10, 0), sticky='e')

    # Validate form
    project_title_input.bind("<FocusOut>", lambda event: check_project_title(None, project_title_input, proceed_button, project_title_error_label))

    project_title_input.bind("<FocusIn>", lambda event: restore_black(None, project_title_input))

    import_window.protocol("WM_DELETE_WINDOW", lambda: close_window(import_window))
    import_window.mainloop()


''' Deletes the selected project from disk '''
def delete_project(listbox):
    project = listbox.get(listbox.curselection()[0])
    if messagebox.askokcancel("Delete", "Do you want to delete the project \""+project+"\"?"):
        project_dir = projects_path+'/'+project
        # remove the project dir
        shutil.rmtree(project_dir)
        # find the project index and remove it from the listbox
        idx = listbox.get(0, tk.END).index(project)
        listbox.delete(idx)


def quit_process(window):
    if messagebox.askokcancel("Quit", "Do you want to quit the application?"):
        window.destroy()
        quit()

def close_window(window):
    window.destroy()


def create_main_window():
    # home screen
    # Create the main window
    window = tk.Tk()

    # Set the window attributes
    window.title("BIG GUI")
    MAX_WIDTH = 730
    MAX_HEIGHT = 430
    window.wm_maxsize(MAX_WIDTH, MAX_HEIGHT)
    width_value = window.winfo_screenwidth()
    height_value = window.winfo_screenheight()
    x_position = (width_value - MAX_WIDTH) / 2
    y_position = (height_value - MAX_HEIGHT) / 2
    window.geometry("%dx%d+%d+%d" % (width_value, height_value, x_position, y_position))

    ico = Image.open(os.path.join(docker_path, 'icon.png'))
    photo = ImageTk.PhotoImage(ico)
    window.wm_iconphoto(False, photo)

    window.option_add("*font", "Roboto 10")
    window.resizable(False, False)

    # Create the top frame
    top_frame = tk.Frame(window, width=300)

    label1 = tk.Label(top_frame, text="Welcome to BIG GUI!", width=20, font=('Roboto 14 bold'))
    label1.grid(row=0, column=0, sticky='ew', columnspan=20, pady=10)

    label2 = tk.Label(top_frame, text="BIG GUI supports the generation and analysis of instance graphs from event logs and process models.", font =('Roboto 11'))
    label2.grid(row=1, column=0, sticky='w', columnspan= 20, pady=(5,20))

    # Create the "Recent projects" label
    recent_projects_frame = tk.Frame(top_frame, width=500, height=40)
    projects_label = tk.Label(recent_projects_frame, text="Recent projects", width=60, justify="left", anchor="w", font=('Roboto 11'))
    projects_label.grid(row=0, column=0, sticky=tk.W)
    recent_projects_frame.grid(row=10, column=0, sticky='w')


    # Create the "+ Add new project" button
    add_button = tk.Button(top_frame, text="+ Add new project", font=('Roboto 10'), width=14, command=lambda: open_import_wizard(window))
    add_button.grid(row=10, column=15, sticky='e', pady=(0,5))

    listbox_frame = tk.Frame(top_frame, width=270)
    # Create the scrollbar for the listbox
    scrollbar = tk.Scrollbar(listbox_frame, orient=VERTICAL)
    # Create the listbox for projects
    projects_listbox = tk.Listbox(listbox_frame, width=80, height=12, font=('Roboto 11'), yscrollcommand=scrollbar.set)
    scrollbar.config(command=projects_listbox.yview)
    scrollbar.pack(side=RIGHT, fill=tk.Y)

    projects_listbox.pack(fill=tk.X, expand=True, side=tk.LEFT)
    listbox_frame.grid(row=15, column=0, columnspan=20, sticky='w')

    # Populate the projects list
    projects = get_projects_list(projects_path)
    for project in projects:
        projects_listbox.insert(tk.END, project)

    #Select the first item by default
    projects_listbox.select_set(0)

    delete_button = tk.Button(top_frame, text="Delete project", font=('Roboto 10'), command=lambda: delete_project(projects_listbox))
    delete_button.grid(row=20, column=0, sticky="w", pady=(5, 0))

    # Create the "Open project" button
    open_button = tk.Button(top_frame, text="Open project", font=('Roboto 10'), command=lambda: open_project(projects_listbox))
    open_button.grid(row=20, column=15, sticky="e", pady=(5, 0))

    top_frame.pack(padx=10, pady=10)

    window.protocol("WM_DELETE_WINDOW", lambda: quit_process(window))

    # Run the event loop
    window.mainloop()



def open_xes_file(label_welcome, browse_btn):
    # show the open file dialog
    label_load = tk.Label(canvas, text="Loading...", font=("Roboto", 50), fg="#2C5BA9")
    label_load.grid(column=2, row=2)
    label_welcome.destroy()
    browse_btn.destroy()
    _thread.start_new_thread(show_gif, ())
    file_xes = fd.askopenfilename(filetypes=[("xes Files", "*.xes")])
    if file_xes:
        messagebox.showinfo("Choose a file", "Choose the net file")
        file_net = fd.askopenfilename(filetypes=[("net Files", "*.pnml")])
        if file_net:
            _thread.start_new_thread(
                run_big,
                (
                    file_net,
                    label_load,
                    file_xes,
                    label_welcome,
                    browse_btn
                ),
            )
        else:
            label_load.destroy()
            gif_label.destroy()
            label_welcome = tk.Label(
                canvas, text="Welcome!", font=("Roboto", 50), fg="#2C5BA9"
            )
            label_welcome.grid(column=2, row=2)
            browse_btn = tk.Button(
                canvas,
                text="Choose a file",
                command=lambda: open_xes_file(label_welcome, browse_btn),
                font=("Noto Mono", 15),
                bg="#20bebe",
                fg="white",
                height=3,
                width=16,
            )
            browse_btn.grid(column=2, row=3, padx=10, pady=10)
            return
    else:
        label_load.destroy()
        gif_label.destroy()
        label_welcome = tk.Label(
            canvas, text="Welcome!", font=("Roboto", 50), fg="#2C5BA9"
        )
        label_welcome.grid(column=2, row=2)
        browse_btn = tk.Button(
            canvas,
            text="Choose a file",
            command=lambda: open_xes_file(label_welcome, browse_btn),
            font=("Noto Mono", 15),
            bg="#20bebe",
            fg="white",
            height=3,
            width=16,
        )
        browse_btn.grid(column=2, row=3, padx=10, pady=10)
        return


#def run_big(file_net, label_load, file_xes, label_welcome, browse_btn):
def run_big(file_net, file_xes, project_title, import_window):
    # create file parquet
    # folderPath = path of the folder you want to run mvn clean install on
    os.system("cd")
    folderPath = "/home/jovyan/work/BIG2/XMLParser"
    os.chdir(folderPath)
    os.system("mvn clean install -Dmaven.clean.failOnError=false")
    folderPath = "/home/jovyan/work/BIG2/XMLParser/target/"+project_title

    if os.path.exists(folderPath):
        shutil.rmtree(folderPath)
    os.mkdir(folderPath)
    os.chmod(folderPath, 0o777)
    os.chdir(folderPath)
    nome_file_parquet = "file_parquet"
    cmd = (
        "spark-submit --packages com.databricks:spark-xml_2.12:0.12.0 --class XMLParser --master local[*] XMLParser-1.0-SNAPSHOT.jar "
        + nome_file_parquet
        + " "
        + file_xes
        + ""
    )
    os.system(cmd)
    file_parquet = folderPath + "/" + nome_file_parquet + ".parquet"
    # run BIG
    dir = "/home/jovyan/work/BIG2/BigSpark/projects/"+project_title+"/file"
    for i in os.listdir(dir):
        os.remove(os.path.join(dir, i))
    dir2 = "/home/jovyan/work/BIG2/BigSpark/projects/"+project_title+"/grafi"
    for i in os.listdir(dir2):
        os.remove(os.path.join(dir2, i))

    bg(file_net, file_parquet, project_title)
    import_window.destroy()

    # TODO MODIFICA DA QUI
    show_trace(project_title)


def show_gif():
    # show loading gif
    try:
        gifImage = "/home/jovyan/work/BIG2/BigSpark/images/Spinner-1s-77px.gif"
        frames = Image.open(gifImage).n_frames
        imageObject = [
            PhotoImage(file=gifImage, format=f"gif -index {i}") for i in range(frames)
        ]
        count = 0
        showAnimation = None

        def animation(count):
            try:
                global showAnimation
                newImage = imageObject[count]
                gif_label.configure(image=newImage)
                count += 1
                if count == frames:
                    count = 0
                showAnimation = root.after(50, lambda: animation(count))
            except:
                pass

        global gif_label
        gif_label = Label(canvas, image="")
        gif_label.grid(column=2, row=3)
        animation(count)
    except:
        pass


def show_trace(project_title):
    # show list of trace
    '''
    ic = Image.open("/home/jovyan/work/BIG2/BigSpark/images/arrow-back-11-48.png")
    icon_back = ImageTk.PhotoImage(ic)
    back_btn = tk.Button(
        root,
        image=icon_back,
        command=lambda: come_back(back_btn, vertscroll, listbox, label),
    )
    back_btn.image = icon_back
    back_btn.grid(column=0, row=0, padx=25, pady=10)
    '''
    # Create the main window
    window = tk.Tk()

    # Set the window attributes
    window.title("BIG GUI")
    MAX_WIDTH = 730
    MAX_HEIGHT = 430
    window.wm_maxsize(MAX_WIDTH, MAX_HEIGHT)
    width_value = window.winfo_screenwidth()
    height_value = window.winfo_screenheight()
    x_position = (width_value - MAX_WIDTH) / 2
    y_position = (height_value - MAX_HEIGHT) / 2

    canvas = tk.Canvas(window, width=width_value, height=height_value, highlightthickness=0)
    canvas.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

    listbox = tk.Listbox(canvas, font=("Times", 20))
    list = []
    for n in os.listdir("/home/jovyan/work/BIG2/BigSpark/projects/"+project_title+"/file"):
        list.append(n)
    list.sort(reverse=True, key=lambda x: int(x.split("_")[-1]))
    for i in list:
        listbox.insert(0, i)
    vertscroll = tk.Scrollbar(canvas)
    vertscroll.config(command=listbox.yview)
    listbox.config(yscrollcommand=vertscroll.set)
    listbox.grid(column=0, row=1, sticky="NSEW", rowspan=3, columnspan=1)
    vertscroll.grid(column=0, row=1, sticky="NES", rowspan=3, columnspan=1)
    listbox.bind(
        "<<ListboxSelect>>",
        lambda event, listbox=listbox: items_selected(event, listbox),
    )
    label = tk.Label(
        canvas,
        text="Choose a trace:",
        font=("Noto Mono bold", 18, "bold"),
        fg="#2C5BA9",
    )
    label.grid(column=0, row=0, sticky="NS", pady=10)


def come_back(back_btn, vertscroll, listbox, label):
    # back button
    try:
        back_btn.destroy()
        vertscroll.destroy()
        listbox.destroy()
        label.destroy()
        expand_btn.destroy()
        textContainer.destroy()
        create_main_window()
    except:
        back_btn.destroy()
        vertscroll.destroy()
        listbox.destroy()
        label.destroy()
        create_main_window()
        
            
def items_selected(event, listbox):
    # get selected indices
    selected_indices = listbox.curselection()
    # get selected items
    selected_langs = ",".join([listbox.get(i) for i in selected_indices])
    # show graph of selected trace
    path_photo = (
        "/home/jovyan/work/BIG2/BigSpark/results/grafi/" + selected_langs + ".png"
    )
    if not os.path.exists(path_photo):
        return
    else:
        global expand_btn
        try:
            if textContainer.winfo_exists() == True:
                textContainer.destroy()
                create_frame(path_photo)
            else:
                create_frame(path_photo)
        except:
            create_frame(path_photo)
        
        ic = Image.open("/home/jovyan/work/BIG2/BigSpark/images/full_screen_icon.png")
        icon = ImageTk.PhotoImage(ic)
        try:
            if expand_btn.winfo_exists() == True:
                expand_btn.destroy()
                expand_btn = Button(
                    canvas,
                    image=icon,
                    command=lambda: _thread.start_new_thread(show_image, (path_photo,)),
                )
                expand_btn.image = icon
                expand_btn.grid(column=3, row=1, padx=5, pady=5, sticky="N")
            else:
                expand_btn = Button(
                    canvas,
                    image=icon,
                    command=lambda: _thread.start_new_thread(show_image, (path_photo,)),
                )
                expand_btn.image = icon
                expand_btn.grid(column=3, row=1, padx=5, pady=5, sticky="N")
        except:
            expand_btn = Button(
                canvas,
                image=icon,
                command=lambda: _thread.start_new_thread(show_image, (path_photo,)),
            )
            expand_btn.image = icon
            expand_btn.grid(column=3, row=1, padx=5, pady=5, sticky="N")

            
def create_frame(path_photo):
    global textContainer, expand_btn, img_tk
    img = cv2.imread(path_photo)
    # convert the image to RGB
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    # convert the image to a Tkinter compatible format using PIL
    img_pil = Image.fromarray(img)
    img_tk = ImageTk.PhotoImage(img_pil)
    textContainer = tk.Frame(canvas, borderwidth=1, relief="sunken")
    text = tk.Text(textContainer, wrap="none", borderwidth=0)
    textVsb = tk.Scrollbar(textContainer, orient="vertical", command=text.yview)
    textHsb = tk.Scrollbar(textContainer, orient="horizontal", command=text.xview)
    text.configure(yscrollcommand=textVsb.set, xscrollcommand=textHsb.set, state="disabled")
    text.image_create(tk.END, image = img_tk)
    text.grid(row=0, column=0, sticky="nsew")
    textVsb.grid(row=0, column=1, sticky="ns")
    textHsb.grid(row=1, column=0, sticky="ew")
    textContainer.grid_rowconfigure(0, weight=1)
    textContainer.grid_columnconfigure(0, weight=1)
    textContainer.grid(column=1, row=1, rowspan=3, columnspan=2, sticky="NSW", padx=10)


def show_image(path_photo):
    # open image with eom
    os.system("eom " + path_photo)


def main():
    create_main_window()


if __name__ == "__main__":
    main()

