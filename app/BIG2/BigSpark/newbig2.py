#import libreria pm4py
import os
import sys
from random import random

import pm4py
import pandas as pd

from pm4py.algo.discovery.footprints import algorithm as footprints_discovery
from pm4py.visualization.petri_net import visualizer as pn_visualizer
from pyspark import SparkConf, SparkContext
from pyspark.sql import SparkSession
from pm4py.objects.conversion.log import converter as log_converter
from pm4py.algo.conformance.alignments.petri_net import algorithm as alignments
from pm4py.objects.petri_net.importer import importer as pnml_importer


#altre librerie
from IPython import display
from graphviz import Digraph
import time

#netfile = "/home/andrea/Desktop/BIG2/BIG^2/BigSpark/BIGDatasets/testBank2000NoRandomNoise/testBank2000NoRandomNoise_petriNet.pnml"
#logfile = "/home/andrea/Desktop/BIG2/BIG^2/BigSpark/BIG Datasets/Hospital_dcc/Hospital_dcc.xes"

def stampa_record(x):
  print(x)

def findCausalRelationships(net, im, fm):
  fp_net = footprints_discovery.apply(net, im, fm)
  return list(fp_net.get('sequence'))

def pick_aligned_trace(trace, net, initial_marking, final_marking):

  aligned_traces = alignments.apply_trace(trace, net, initial_marking, final_marking)

  temp = []
  id = 0
  al = []
  temp1=[]
  id1=0
  fin = []

  for edge in aligned_traces['alignment']:
    id+=1
    temp.append((id,edge[1]))
  al.append(temp)
  for edge in aligned_traces['alignment']:
    id1+=1
    temp1.append((id1,edge[0]))
  fin.append(temp1)

  return al, fin

def traccia_effettiva(tracce):
  t = []
  L = []
  i = 0
  for event in tracce:
    i +=1
    nome = event.get('concept:name')
    t.append((i,nome))
  L.append(t)
  return L

def checkTraceConformance(trace, net, initial_marking, final_marking):
  
  aligned_traces = alignments.apply_trace(trace, net, initial_marking, final_marking)
  D = []
  I = []
  id = 0
  temp_d = []
  temp_i = []
  prev_d = False
  curr_d = False
  prev_i = False
  curr_i = False
  del_count = 1
  for edge in aligned_traces['alignment']:
    id+=1
    if edge[1] is None:
      id-=1
      continue
    if edge[0] == '>>':
      temp_d.append((id, edge[1]))
      curr_d = True
      id-=1
    if edge[1] == '>>':
      temp_i.append((id, edge[0]))
      curr_i = True
    
    if (prev_i and not curr_i):
      if len(temp_i) > 0:
        I.append(temp_i)
      temp_i = []
    prev_i = curr_i
    curr_i = False
    if (prev_d and not curr_d):
      if len(temp_d) > 0:
        D.append(temp_d)
      temp_d = []
      
    prev_d = curr_d
    curr_d = False
  if len(temp_i) > 0:
      I.append(temp_i)
  if len(temp_d) > 0:
      D.append(temp_d)
  return D, I

def mapping(L1,L2): # crea il mapping, ritorna il map e la lista ins (lista degli inserimenti)
  map = [0]*len(L1)
  id1 = 0
  id2 = 0
  ins = []
  for i in range(len(L1)):
    e1=L1[i]
    e2=L2[i]
    if e1[1]==e2[1]:
      id1+=1
      id2+=1
      map[i] = (e1[1],id1, id2 )
    elif e1[1]=='>>': #insertion
      id1+=1
      map[i]= (e2[1],id1, 0)
    elif e2[1]=='>>': #deletion
      id2+=1
      map[i]=(e1[1],0,id2)
    

  for j in range(len(L1)):
    e1 = L1[j]
    #e2 = L2[j]
    e3 = map[j]
    if e1[1]=='>>':
      id2+=1
      map[j] = (e3[0], e3[1], id2)
      ins.append((e3[0], e3[1], id2))
        
 
  return map, ins

def ExtractInstanceGraph(trace, cr):
    V = []
    W = []
    id = 1
    for event in trace:
      #V.append((id, event.get("concept:name")))
      V.append(event)
      id += 1
    # print("IG")
    for i in range(len(V)):
      for k in range(i+1,len(V)):
        e1 = V[i]
        e2 = V[k]
        '''if e1[0]==e2[0]:
          continue;'''
        if (e1[1],e2[1]) in cr:
          flag_e1=True
          for s in range(i+1, k):
            e3 = V[s]
            if (e1[1],e3[1]) in cr:
              flag_e1 = False
              break
          flag_e2=True
          for s in range(i+1, k):
            e3 = V[s]
            if (e3[1],e2[1]) in cr:
              flag_e2 = False
              break
          
          if flag_e1 or flag_e2:
            W.append((e1,e2))
    return V, W

def viewInstanceGraph(V, W, view=True, title="Instance Graph"):
  # Conversion to string indexes
  V2 = []
  W2 = []
  for node in V:
    V2.append((str(node[0]), "{0} = {1}".format(node[0],node[1])))
  for edge in W:
    W2.append(((str(edge[0][0]), "{0} = {1}".format(edge[0][0],edge[0][1])),(str(edge[1][0]), "{0} = {1}".format(edge[1][0],edge[1][1]))))

  print('V2: ', V2)
  print('W2: ', W2)

  dot = Digraph(comment=title, node_attr={'shape': 'circle'})
  for e in V2:
    dot.node(e[0], e[1])
  for w in W2:
    dot.edge(w[0][0], w[1][0])
  if view:
    display.display(dot)
  return dot

def compliant_trace(trace):
  t = []
  id = 0
  for event in trace:
    if event[1] == '>>':
      continue
    else:
      id +=1
      t.append((id,event[1]))
  
  return t

#funzione vecchia, usare del_repair


def repair_deletion(V,W,map): #funzione per gestire la deletion repair
  Eremp = []
  Erems = []
  Pred = []
  Succ = []
  W1 = []
  V1 = []
  d = []
  W2 = []

  for element in map:     #crea le liste Eremp e Erems
    if element[1]== 0: #da cancellare 
      to_del = (element[2],element[0])
      d.append((element[2],element[0]))
      for i in range(len(W)):
        e1 = W[i]
        e2 = e1[1]
        e3 = e1[0]
        if e2 == to_del:
          Eremp.append((e3,to_del))
        if e3 ==to_del:
          Erems.append((to_del,e2))
  
  for a in Eremp:   #crea liste Pred e Succ
    Pred.append(a[0])
  for b in Erems:
    Succ.append(b[1])


  for c in range(len(W)):   #aggiorna archi
    arc = W[c]
    a0 = arc[0]
    a1 = arc[1]
    if a0 not in d and a1 not in d:  #se l'arco non entra o esce in nodi da cancellare, lo inserisco in W1
         W1.append(arc)
    elif a1 in d and a0 in d:
      continue
    elif a1 in d: #altrimenti se l'arco è in Eremp (quindi entra in un nodo da cancellare) aggiorno i nodi
       for h in range(len(Erems)):
        g1 = Erems[h]
        n0 = g1[0]
        n1 = g1[1]
        if a1 == n0 and n1 not in d: #se ho archi: (a,b) (b,c) e il nodo c non è da cancellare, prendo l'arco (a,c)
          W1.append((a0,n1))
        elif a1 == n0 and n1 in d: #se ho archi: (a,b) (b,c) e il nodo c è da cancellare, cerco nella lista Succ se c'è un arco del tipo (c,d), se d non è da cancellare
                                    #inserisco (a,d) nel grafo 
          for elem in Succ:
            if (n1,elem) in W and elem not in d:
              W1.append((a0,elem))



#aggiorna nodi
  for i in range(len(V)):
    e1 = V[i]
    if e1 not in d:
      V1.append(e1)
  

  print("W1: ", W1)
  print("V1:" , V1)
  print("d: ", d)

  print("Pred: ", Pred)
  print("Succ: ", Succ)
  print("Eremp: ", Eremp)
  print("Erems: ", Erems)

  
        



  return V1,W1

#funzione per la deletion repair

def del_repair(V,W,map,deletion):
  Eremp = []
  Erems = []
  Pred = []
  Succ = []
  W1 = []
  V1 = []
  d = []
  W2 = []

  
  to_del = (deletion[2],deletion[0])
  print('Da cancellare = ', to_del)
  for i in range(len(W)):
    e1 = W[i]
    e2 = e1[1]
    e3 = e1[0]
    if e2 == to_del:
      Eremp.append((e3,to_del))
    if e3 ==to_del:
      Erems.append((to_del,e2))

  for a in Eremp:   #crea liste Pred e Succ
    Pred.append(a[0])
  for b in Erems:
    Succ.append(b[1])

  for ep in Eremp:
    W.remove(ep)
  for es in Erems: 
    W.remove(es)

  V.remove(to_del)

  for p in Pred:
    for s in Succ:
      W.append((p,s))


  return V,W

#crea una lista dove gli archi sono riportati solo come coppia di numeri

def edge_number(W):
  
  W_number = []

  for i in range(len(W)):
    arc = W[i]
    a0 = arc[0]
    a1 = arc[1]
    W_number.append((a0[0],a1[0]))

  return W_number

#funzione che, data in input una lista di coppie (numero, label) corrispendenti ad ogni nodo del grafo,
# restituisce una lista con solo i numeri di ogni nodo

def node_number(V):

  V_number = []
  for i in range(len(V)):
    nod = V[i]
    V_number.append(nod[0])
  
  return V_number

def ins_list_num(ins_list):

  list =  []
  for i in range(len(ins_list)):
    p1 = ins_list[i]
    list.append(p1[1])

  return list

def consecutive_insertion(lista,p, pos_t,insertion):
  p -= 1
  q = p-1
  print('p: ',p,'q: ',q)
  if p in lista and q not in lista:
    pos_t.remove(insertion[1])
    pos_t.append(p)
  elif p in lista and q in lista:
    print('Qua ci sono arrivato')
    post_t = consecutive_insertion(lista,p, pos_t, insertion)

  return pos_t, p

#funzione di insertion repair
def ins_repair(V,W,map,insertion,V_n, ins_list, Vpos):
   Eremp = []
   Pred = []
   Succ = []
   pos_t = []
   W_num = []
   V1 = []
   ins_num = []
   
   
   

   V.insert(insertion[1]-1,(insertion[2],insertion[0]))
   Vpos.insert(insertion[1]-1, (insertion[2], insertion[0]))
   pos_t.append(insertion[1])

   W_num = edge_number(W)
   V_num = node_number(V)
   ins_num = ins_list_num(ins_list)

   print('ins num: ',ins_num)

   #for p in pos_t:
       #if (p-1) in ins_num:
        # print('CONSECUTIVA')
         #pos_t, p = consecutive_insertion(ins_num, p,pos_t, insertion)
         #print('pos t: ', pos_t)
 
   print('Vpos agg: ', Vpos)
  
 #  print(' new pos_t: ', pos_t)

  
   for p in pos_t: # numero dell'insertion
       print('P=',p) 
       print('Len Vpos: ', len(Vpos))
      # print('posizione V[p]: ', V[p])
       if p < len(Vpos):
        # print('posizione Vpos[p]: ', Vpos[p])
         position = Vpos[p]
         print('Position = ', position)
         pos = position[0]
       else: #inserimento a ultimo posto
         #position = Vpos[-2]
         position = V[-1]
         pos = position[0]
         print('ULtimo elemento ', Vpos[-1])
         print(pos)
       #linee 6-12 pseudocodice
       print('pos: ', pos)
       p_pred = Vpos[p-2]
       pos_pred = p_pred[0]
       print('P pred: ', p_pred)
       if is_path(pos_pred,pos,W_num,V):  # se c'è un cammino tra p-1 e p
         print(is_path(pos_pred,pos,W_num,V))
         for i in range(len(W)):
           arc = W[i]
           a0 = arc[0]
           a1 = arc[1]
          #for j in pos_t:
           # if j == a1[0] and (a0,a1) not in Eremp:
            #  Eremp.append((a0,a1))
             # Pred.append(a0)
           if pos == a1[0] and (a0,a1) not in Eremp: # se esiste un arco nel grafo che entra in posizione p e non è considerato in Eremp
             Eremp.append((a0,a1))
             Pred.append(a0)
         for n in Pred:      
           for k in range(len(W)):
             e = W[k]
             e0 = e[0]
             e1 = e[1] 
             if e0 == n and (e0,e1) not in Eremp:
               Eremp.append((e0,e1))
       else: #linee 14-15
         print('Condizione verificata')
         for m in range(len(W)): #pred.append(pos_t-1)
           edge = W[m]
           edge0 = edge[0]
           edge1 = edge[1]
          #for o in pos_t:
           # if (o-1) == edge0[0] and (edge0,edge1) not in Eremp: 
            #  print ('ELSE')
              #Eremp.append((edge0,edge1))
              #Pred.append(edge0)
           if (pos_pred) == edge0[0] and (edge0,edge1) not in Eremp:
             print('ELSE')
             Eremp.append((edge0,edge1))
             Pred.append(edge0)
           elif (pos_pred) == edge1[0] and (pos_pred) == V_n[-1]: #insertion all'ultimo nodo del grafo
             print('ECCO IL CASO')
             Pred.append(edge1)
           elif isolato(pos_pred,W_num):
             print('NODO ISOLATO')
            
           
             
  
  
  # for p in pos_t:
   #  for element in ins_list:
    #   p1 = element[1]
     #  if p1 == p+1: 

   
   


   for erem in range(len(Eremp)):
     suc = Eremp[erem] 
     suc1 = suc[1]
     if suc1 not in Succ:
       Succ.append(suc1)
   
   print('Pred = ', Pred)
   print('Succ = ', Succ)
   print('Eremp = ', Eremp)
   
   for el in Eremp:
     if el in W:
       W.remove(el)


   for i in Pred:
     if (i,(insertion[2],insertion[0])) not in W:
       W.append((i,(insertion[2],insertion[0])))

   for s in Succ:
     if ((insertion[2],insertion[0]),s) not in W:
       W.append(((insertion[2],insertion[0]),s))

   
   W_num = edge_number(W)
   V_num = node_number(V)

   print('V: ', V)
   print('VPOS Finale: ', Vpos)

   print('++++++++++++++')


   return V,W

#funzione booleana per verificare se tra due nodi dati in input esiste un cammino che li collega

def is_path(a,b,W,V):
  flag = False
  if (a,b) in W:
    flag = True
    return flag
  else:
    for c in range(len(V)):
      e = V[c]
      if (a,e[0]) in W:
        flag = is_path(e[0],b,W,V)
      else:
        continue
  
  return flag

def riordina(W, minimo, W1):

  for i in range(len(W)):
    arc = W[i]
    e0 = arc[0]
    e1 = arc[1]
    if e0[0] == minimo and arc not in W1:
      W1.append(arc)
  
  for j in range(len(W)):
    arco = W[j]
    a0 = arco[0]
    a1 = arco[1]
    if a0[0] == minimo:
      W1 = riordina(W, a1[0], W1)

 
  return W1

#aggiorna le label dei nodi in base al mapping

def aggiorna_label(W,map,V):

  W1 = []
  V1 = []


  for i in range(len(W)):
    arc = W[i]
    a0 = arc[0]
    a1 = arc[1]
    for j in range(len(map)):
      e = map[j]
      if a0 == (e[2],e[0]):
        for k in range(len(map)):
          f = map[k]
          if a1 == (f[2],f[0]):
            W1.append(((e[1],e[0]),(f[1],f[0])))


  for i1 in range(len(V)):
    node = V[i1]
    for j1 in range(len(map)):
      e = map[j1]
      if node == (e[2],e[0]):
        V1.append((e[1],e[0]))


  

  return W1, V1

#effettua il sorting di W in base al numero

def sorting(W,V):

  n = 0
  W_sorted = []
  
  while n < len(V):
    n += 1
    for i in range(len(W)):
      arc = W[i]
      a0 = arc[0]
      if a0[0] == n:
        W_sorted.append(arc)
  
  return W_sorted

"""##SAVE FILE

"""

def saveGFile(V, W, path,time, sort_labels):
  with open(path, 'w') as f:
    f.write("# Execution Time: {0:.3f} s\n".format(time))
    #f.write("# Deleted Activities: {0}\n".format(D))
    #f.write("# Inserted Activities: {0}\n".format(I))
    for n in V:
      f.write("v {0} {1}\n".format(n[0], n[1]))
    f.write("\n")
    if (sort_labels):
      W.sort()
    for e in W:
      f.write("e {0} {1} {2}__{3}\n".format(e[0][0], e[1][0], e[0][1], e[1][1]))

  print(V)
  print(W)

def saveGfinal(V, W, path, sort_labels):
  with open(path, 'a') as f:
    f.write("XP \n")
    for n in V:
      f.write("v {0} {1}\n".format(n[0], n[1]))
    if (sort_labels):
      W.sort()
    for e in W:
      f.write("e {0} {1} {2}__{3}\n".format(e[0][0], e[1][0], e[0][1], e[1][1]))
    f.write("\n")
    f.close()

def isolato(node,W):
   flag = True
   for i in range(len(W)):
     arc = W[i]
     if arc[0] == node or arc[1] == node:
       flag = False

   
   return flag

def big_partitioned(f, net_path):

  print(f)

  view = False

  #netfile ="/home/andrea/Desktop/BIG2/BIG^2/BigSpark/BIGDatasets/testBank2000NoRandomNoise/testBank2000NoRandomNoise_petriNet.pnml"
  splits = net_path.split('/')
  name = splits[-1].split("_petriNet.pnml")[0]
  sort_labels = False

  net, initial_marking, final_marking = pnml_importer.apply(net_path)

  cr = findCausalRelationships(net, initial_marking, final_marking)
  if view:
    print(cr)

  file_xes_by_trace_id = pd.DataFrame(f, columns=['concept:name', 'trace_id'])
  parameters = {log_converter.Variants.TO_EVENT_LOG.value.Parameters.CASE_ID_KEY: 'trace_id'}
  event_log = log_converter.apply(file_xes_by_trace_id, parameters=parameters, variant=log_converter.Variants.TO_EVENT_LOG)

  for trace in event_log:
      Aligned, A = pick_aligned_trace(trace, net, initial_marking, final_marking)
      Align = Aligned[0]
      A1 = A[0]
      print('Aligned to model')
      print(Align)
      # print(L1)
      print('with invisible moves')
      print(A1)
      map, ins = mapping(Align, A1)

      # compliant mi serve per generare l'ig in base al modello (rimuove dalla traccia allineata i move)

      compliant = compliant_trace(Align)
      effettiva = compliant_trace(A1)

      print(compliant)
      print('Effettiva: ', effettiva)

      print("map: ", map)
      print("ins: ", ins)

      d = []

      trace_start_time = time.time()
      num = trace.attributes.get('concept:name')
      # estrazione dell' IG su cui poi devo fare riparazione
      V, W = ExtractInstanceGraph(compliant, cr)

      print('V')
      print(V)
      print('W')
      print(W)
      if view:
        print("\n\n------------------------------------\nUnrepaired Instance Graph")

      V_n = node_number(V)
      # print('V_n = ', V_n )
      W_n = edge_number(W)
      # print('W_n = ', W_n)

      for element in map:  # crea le liste Eremp e Erems
        if element[1] == 0:  # da cancellare
          d.append(element)

      graph = viewInstanceGraph(V, W)

      Vpos = []
      for node in V:
        Vpos.append(node)

      print('Vpos1: ', Vpos)

      for el in map:
        if el[1] == 0:
          Vpos.remove((el[2], el[0]))

      print('Vpos = ', Vpos)

      print('INSERTION')

      for insertion in ins:
        V, W = ins_repair(V, W, map, insertion, V_n, ins, Vpos)

      print('W repaired: ', W)

      graph = viewInstanceGraph(V, W)

      print('DELETION')
      print(d)

      for deletion in d:
        V, W = del_repair(V, W, map, deletion)

      if len(ins) > len(d) + 3:
        print('TANTEEEEEEEE')

      # V,W = repair_insertion(V,W,map,ins)
      print('W aggiornata: ', W)
      print("V aggiornata: ", V)

      minimo = min(V_n)

      W1 = []

      W1 = riordina(W, minimo, W1)

      # print('W sorted: ', W1)

      W1, V1 = aggiorna_label(W, map, V)

      print('W1 label: ', W1)

      # W_sorted = sorting(W1,V)

      print('W ordinata: ', W)

      graph = viewInstanceGraph(V1, W1)

      V1.sort()
      W1.sort()

      nome_file=str(trace[0]['trace_id'])

     # dir = "/home/jovyan/work/BIG2/BigSpark/results/file"
     # for i in os.listdir(dir):
      #  os.remove(os.path.join(dir, i))
      #dir2 = "/home/jovyan/work/BIG2/BigSpark/results/grafi"      
      #for i in os.listdir(dir2):
       # os.remove(os.path.join(dir2, i))
        
      saveGFile(V1, W1, "/home/jovyan/work/BIG2/BigSpark/results/file/"+nome_file, time.time() - trace_start_time, sort_labels)
      saveGfinal(V1, W1, "/home/jovyan/work/BIG2/BigSpark/results/{0}_instance_graphs.g".format(name), sort_labels)
      #salva i grafi
      graph.format = 'png'
      graph.render(directory="/home/jovyan/work/BIG2/BigSpark/results/grafi", filename=nome_file)

def BIG(net_path, file_parquet):

  start_time_total = time.time()

  spark = SparkSession.builder.appName("BigSpark").config("spark.driver.bindAddress", "172.17.0.2").master("local[4]").getOrCreate()

  intermediate_temp = time.time()

  net, initial_marking, final_marking = pnml_importer.apply(net_path)
  trace_event_activity = spark.read.parquet(file_parquet)
  trace_event_activity.printSchema()


  gviz = pn_visualizer.apply(net, initial_marking, final_marking)
  gviz.render(filename="petri")

  #passo come parametro anche il file della rete scelto dall'utente
  trace_event_activity.foreachPartition(lambda f, net_path=net_path: big_partitioned(f, net_path))
  #trace_event_activity.foreachPartition(big_partitioned)
  end_time=time.time()
  esecution_time= end_time-start_time_total
  avvioSparkSession= intermediate_temp-start_time_total
  print("il tempo di esecuzione totale è "+str(esecution_time))
  print("Il tempo di avvio della SparkSession è "+str(avvioSparkSession))



"""##MAIN"""

def main(netfile, fileparquet):
  #netfile ="/home/andrea/Desktop/BIG2/BIG^2/BigSpark/BIGDatasets/testBank2000NoRandomNoise/testBank2000NoRandomNoise_petriNet.pnml"
  BIG(netfile,fileparquet)


if __name__ == '__main__':
  netfile = sys.argv.__getitem__(0)
  fileparquet = sys.argv.__getitem__(1)
  main(netfile, fileparquet)


