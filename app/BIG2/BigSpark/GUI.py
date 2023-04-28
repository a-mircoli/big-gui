#!/usr/bin/python
# -*- coding: utf-8 -*-

import tkinter as tk
from tkinter import *
from tkinter import messagebox
from tkinter import scrolledtext
from PIL import Image, ImageTk
from pyspark.context import SparkContext
from tkinter import filedialog as fd
from os import listdir
from newbig2 import BIG as bg
import sys, subprocess
import os
import _thread
import cv2

sc = SparkContext.getOrCreate()
spark = SparkSession(sc)

# Root window
root = tk.Tk()
root.wm_maxsize(1000, 750)
width_value = root.winfo_screenwidth()
height_value = root.winfo_screenheight()
root.geometry("%dx%d+0+0" % (width_value, height_value))
canvas = tk.Canvas(root, width=width_value, height=height_value, highlightthickness=0)
canvas.place(relx=0.5, rely=0.5, anchor=tk.CENTER)
root.resizable(False, False)
root.title("Display a Graph")


def define_window():
    # home screen
    img = Image.open("/home/jovyan/work/BIG2/BigSpark/images/logo.png")
    resized_image = img.resize((500, 500), Image.ANTIALIAS)
    new_image = ImageTk.PhotoImage(resized_image)
    logo_label = tk.Label(canvas, image=new_image)
    logo_label.image = new_image
    logo_label.grid(column=2, row=1)
    label_welcome = tk.Label(canvas, text="Welcome!", font=("Roboto", 50), fg="#2C5BA9")
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


def run_big(file_net, label_load, file_xes, label_welcome, browse_btn):
    # create file parquet
    # folderPath = path of the folder you want to run mvn clean install on
    os.system("cd")
    folderPath = "/home/jovyan/work/BIG2/XMLParser"
    os.chdir(folderPath)
    os.system("mvn clean install -Dmaven.clean.failOnError=false")
    folderPath = "/home/jovyan/work/BIG2/XMLParser/target"
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
    dir = "/home/jovyan/work/BIG2/BigSpark/results/file"
    for i in os.listdir(dir):
        os.remove(os.path.join(dir, i))
    dir2 = "/home/jovyan/work/BIG2/BigSpark/results/grafi"
    for i in os.listdir(dir2):
        os.remove(os.path.join(dir2, i))
    bg(file_net, file_parquet)
    label_load.destroy()
    gif_label.destroy()
    show_trace(label_welcome, browse_btn)


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


def show_trace(label_welcome, browse_btn):
    # show list of trace
    ic = Image.open("/home/jovyan/work/BIG2/BigSpark/images/arrow-back-11-48.png")
    icon_back = ImageTk.PhotoImage(ic)
    back_btn = tk.Button(
        root,
        image=icon_back,
        command=lambda: come_back(back_btn, vertscroll, listbox, label),
    )
    back_btn.image = icon_back
    back_btn.grid(column=0, row=0, padx=25, pady=10)
    listbox = tk.Listbox(canvas, font=("Times", 20))
    list = []
    for n in os.listdir("/home/jovyan/work/BIG2/BigSpark/results/file"):
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
    label_welcome.destroy() 
    browse_btn.destroy()


def come_back(back_btn, vertscroll, listbox, label):
    # back button
    try:
        back_btn.destroy()
        vertscroll.destroy()
        listbox.destroy()
        label.destroy()
        expand_btn.destroy()
        textContainer.destroy()
        define_window()
    except:
        back_btn.destroy()
        vertscroll.destroy()
        listbox.destroy()
        label.destroy()
        define_window()  
        
            
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
    # Converte l'immagine in RGB
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    # Converte l'immagine in un formato compatibile con Tkinter utilizzando PIL
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
    define_window()


if __name__ == "__main__":
    main()

root.mainloop()
