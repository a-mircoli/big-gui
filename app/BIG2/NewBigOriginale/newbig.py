from pm4py.streaming.importer.xes import importer as xes_importer
import time
from pm4py.objects.petri_net.importer import importer as pnml_importer
import graphviz
import csv
from pm4py.visualization.petri_net import visualizer as pn_visualizer
from pm4py.algo.discovery.footprints import algorithm as footprints_discovery
from IPython import display
from graphviz import Digraph
from pm4py.algo.conformance.alignments.petri_net import algorithm as alignments


def findCausalRelationships(net, im, fm):
  fp_net = footprints_discovery.apply(net, im, fm)
  return list(fp_net.get('sequence'))

def pick_aligned_trace(trace, net, initial_marking, final_marking):
  aligned_traces = alignments.apply_trace(trace, net, initial_marking, final_marking)
  temp = []
  id = 0
  al = []
  temp1 = []
  id1 = 0
  fin = []

  for edge in aligned_traces['alignment']:
    id += 1
    temp.append((id, edge[1]))
  al.append(temp)
  for edge in aligned_traces['alignment']:
    id1 += 1
    temp1.append((id1, edge[0]))
  fin.append(temp1)

  return al, fin
def traccia_effettiva(tracce):
  t = []
  L = []
  i = 0
  for event in tracce:
    i += 1
    nome = event.get('concept:name')
    t.append((i, nome))
  L.append(t)
  return L


#
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
    id += 1
    if edge[1] is None:
      id -= 1
      continue
    if edge[0] == '>>':
      temp_d.append((id, edge[1]))
      curr_d = True
      id -= 1
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

#TODO MAPPING
def mapping(L1, L2):  # crea il mapping, ritorna il map e la lista ins (lista degli inserimenti)

  map = [0] * len(L1)
  id1 = 0
  id2 = 0
  ins = []
  for i in range(len(L1)):
    e1 = L1[i]
    e2 = L2[i]
    if e1[1] == e2[1]:
      id1 += 1
      id2 += 1
      map[i] = (e1[1], id1, id2)
    elif e1[1] == '>>':  # insertion
      id1 += 1
      map[i] = (e2[1], id1, 0)
    elif e2[1] == '>>':  # deletion
      id2 += 1
      map[i] = (e1[1], 0, id2)

  for j in range(len(L1)):
    e1 = L1[j]
    # e2 = L2[j]
    e3 = map[j]
    if e1[1] == '>>':
      id2 += 1
      map[j] = (e3[0], e3[1], id2)
      ins.append((e3[0], e3[1], id2))

  return map, ins

def ExtractInstanceGraph(trace, cr):
  V = []
  W = []
  id = 1
  for event in trace:
    V.append(event)
    id += 1
  for i in range(len(V)):
    for k in range(i + 1, len(V)):
      e1 = V[i]
      e2 = V[k]
      if (e1[1], e2[1]) in cr:
        flag_e1 = True
        for s in range(i + 1, k):
          e3 = V[s]
          if (e1[1], e3[1]) in cr:
            flag_e1 = False
            break
        flag_e2 = True
        for s in range(i + 1, k):
          e3 = V[s]
          if (e3[1], e2[1]) in cr:
            flag_e2 = False
            break
        if flag_e1 or flag_e2:
          W.append((e1, e2))
  return V, W

#serve per printare il grafico
def viewInstanceGraph(V, W, view=True, title="Instance Graph"):
  # Conversion to string indexes
  V2 = []
  W2 = []
  for node in V:
    V2.append((str(node[0]), "{0} = {1}".format(node[0], node[1])))
  for edge in W:
    W2.append(((str(edge[0][0]), "{0} = {1}".format(edge[0][0], edge[0][1])),
               (str(edge[1][0]), "{0} = {1}".format(edge[1][0], edge[1][1]))))

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
      id += 1
      t.append((id, event[1]))

  return t

# funzione per la deletion repair

def del_repair(V, W, map, deletion):
  Eremp = []
  Erems = []
  Pred = []
  Succ = []
  W1 = []
  V1 = []
  d = []
  W2 = []

  to_del = (deletion[2], deletion[0])
  print('Da cancellare = ', to_del)
  for i in range(len(W)):
    e1 = W[i]
    e2 = e1[1]
    e3 = e1[0]
    if e2 == to_del:
      Eremp.append((e3, to_del))
    if e3 == to_del:
      Erems.append((to_del, e2))

  for a in Eremp:  # crea liste Pred e Succ
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
      W.append((p, s))

  return V, W


# crea una lista dove gli archi sono riportati solo come coppia di numeri

def edge_number(W):
  W_number = []

  for i in range(len(W)):
    arc = W[i]
    a0 = arc[0]
    a1 = arc[1]
    W_number.append((a0[0], a1[0]))

  return W_number


# funzione che, data in input una lista di coppie (numero, label) corrispendenti ad ogni nodo del grafo,
# restituisce una lista con solo i numeri di ogni nodo

def node_number(V):
  V_number = []
  for i in range(len(V)):
    nod = V[i]
    V_number.append(nod[0])

  return V_number
def ins_list_num(ins_list):
  list = []
  for i in range(len(ins_list)):
    p1 = ins_list[i]
    list.append(p1[1])

  return list
def consecutive_insertion(lista, p, pos_t, insertion):
  p -= 1
  q = p - 1
  print('p: ', p, 'q: ', q)
  if p in lista and q not in lista:
    pos_t.remove(insertion[1])
    pos_t.append(p)
  elif p in lista and q in lista:
    print('Qua ci sono arrivato')
    post_t = consecutive_insertion(lista, p, pos_t, insertion)

  return pos_t, p

# funzione di f

def ins_repair(V, W, map, insertion, V_n, ins_list, Vpos):
  Eremp = []
  Pred = []
  Succ = []
  pos_t = []
  W_num = []
  V1 = []
  ins_num = []

  V.insert(insertion[1] - 1, (insertion[2], insertion[0]))
  Vpos.insert(insertion[1] - 1, (insertion[2], insertion[0]))
  pos_t.append(insertion[1])

  W_num = edge_number(W)
  V_num = node_number(V)
  ins_num = ins_list_num(ins_list)

  print('ins num: ', ins_num)

  print('Vpos agg: ', Vpos)


  for p in pos_t:  # numero dell'insertion
    print('P=', p)
    print('Len Vpos: ', len(Vpos))
    # print('posizione V[p]: ', V[p])
    if p < len(Vpos):
      position = Vpos[p]
      print('Position = ', position)
      pos = position[0]
    else:  # inserimento a ultimo posto
      position = V[-1]
      pos = position[0]
      print('ULtimo elemento ', Vpos[-2])
      print(pos)
    # linee 6-12 pseudocodice
    print('pos: ', pos)
    p_pred = Vpos[p - 2]
    pos_pred = p_pred[0]
    print('P pred: ', p_pred)
    if is_path(pos_pred, pos, W_num, V):  # se c'è un cammino tra p-1 e p
      print(is_path(pos_pred, pos, W_num, V))
      for i in range(len(W)):
        arc = W[i]
        a0 = arc[0]
        a1 = arc[1]
        if pos == a1[0] and (
        a0, a1) not in Eremp:  # se esiste un arco nel grafo che entra in posizione p e non è considerato in Eremp
          Eremp.append((a0, a1))
          Pred.append(a0)
      for n in Pred:
        for k in range(len(W)):
          e = W[k]
          e0 = e[0]
          e1 = e[1]
          if e0 == n and (e0, e1) not in Eremp:
            Eremp.append((e0, e1))
    else:  # linee 14-15
      print('Condizione verificata')
      for m in range(len(W)):  # pred.append(pos_t-1)
        edge = W[m]
        edge0 = edge[0]
        edge1 = edge[1]
        if (pos_pred) == edge0[0] and (edge0, edge1) not in Eremp:
          print('ELSE')
          Eremp.append((edge0, edge1))
          Pred.append(edge0)
        elif (pos_pred) == edge1[0] and (pos_pred) == V_n[-1]:  # insertion all'ultimo nodo del grafo
          print('ECCO IL CASO')
          Pred.append(edge1)
        elif isolato(pos_pred, W_num):
          print('NODO ISOLATO')

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
    if (i, (insertion[2], insertion[0])) not in W:
      W.append((i, (insertion[2], insertion[0])))

  for s in Succ:
    if ((insertion[2], insertion[0]), s) not in W:
      W.append(((insertion[2], insertion[0]), s))

  W_num = edge_number(W)
  V_num = node_number(V)

  print('V: ', V)
  print('VPOS Finale: ', Vpos)

  print('++++++++++++++')

  return V, W

# funzione booleana per verificare se tra due nodi dati in input esiste un cammino che li collega

def is_path(a, b, W, V):
  flag = False
  if (a, b) in W:
    flag = True
    return flag
  else:
    for c in range(len(V)):
      e = V[c]
      if (a, e[0]) in W:
        flag = is_path(e[0], b, W, V)
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


# aggiorna le label dei nodi in base al mapping

def aggiorna_label(W, map, V):
  W1 = []
  V1 = []

  for i in range(len(W)):
    arc = W[i]
    a0 = arc[0]
    a1 = arc[1]
    for j in range(len(map)):
      e = map[j]
      if a0 == (e[2], e[0]):
        for k in range(len(map)):
          f = map[k]
          if a1 == (f[2], f[0]):
            W1.append(((e[1], e[0]), (f[1], f[0])))

  for i1 in range(len(V)):
    node = V[i1]
    for j1 in range(len(map)):
      e = map[j1]
      if node == (e[2], e[0]):
        V1.append((e[1], e[0]))

  return W1, V1


# effettua il sorting di W in base al numero non usato

def sorting(W, V):
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


def saveGFile(V, W, path, time, sort_labels):
  with open(path, 'w') as f:
    f.write("# Execution Time: {0:.3f} s\n".format(time))
    # f.write("# Deleted Activities: {0}\n".format(D))
    # f.write("# Inserted Activities: {0}\n".format(I))
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


def isolato(node, W):
  flag = True
  for i in range(len(W)):
    arc = W[i]
    if arc[0] == node or arc[1] == node:
      flag = False

  return flag


def saveCSV(path, aligned, model_moves, num):
  with open(path, 'a') as f:
    writer = csv.writer(f, delimiter=";")
    writer.writerow([num, aligned, model_moves])
    f.close()


"""##MAIN"""


def BIG(net_path, log_path, tr_start=0, tr_end=None, view=False, sort_labels=False):

  start_time= time.time()

  splits = log_path.split('/')
  name = splits[-1].split(".")[0]

  streaming_ev_object = xes_importer.apply(log_path, variant=xes_importer.Variants.XES_TRACE_STREAM)  # file xes
  net, initial_marking, final_marking = pnml_importer.apply(net_path)

  gviz = pn_visualizer.apply(net, initial_marking, final_marking)
  gviz.render(filename="petri")

  cr = findCausalRelationships(net, initial_marking, final_marking)
  if view:
    print(cr)

  n = 0

  start_time_total = time.time()

  with open("{0}_instance_graphs.csv".format(name), 'w') as f:
    writer = csv.writer(f, delimiter=";")
    writer.writerow(['n', 'aligned to model', 'with invisible moves'])
    f.close()

  for trace in streaming_ev_object:
    n += 1
    print(n)
    Aligned, A = pick_aligned_trace(trace, net, initial_marking, final_marking)
    Align = Aligned[0]
    # L1 = L[0]
    A1 = A[0]
    print('Aligned to model')
    print(Align)
    print('with invisible moves')
    print(A1)
    map, ins = mapping(Align, A1)

    saveCSV("{0}_instance_graphs.csv".format(name), Align, A1, n)


    compliant = compliant_trace(Align)
    effettiva = compliant_trace(A1)

    print(compliant)
    print('Effettiva: ', effettiva)

    print("map: ", map)
    print("ins: ", ins)

    d = []

    trace_start_time = time.time()
    num = trace.attributes.get('concept:name')
    id = trace.attributes.get('variant-index')

    V, W = ExtractInstanceGraph(compliant, cr)
    print('V')
    print(V)
    print('W')
    print(W)
    if view:
      print("\n\n------------------------------------\nUnrepaired Instance Graph")

    V_n = node_number(V)
    W_n = edge_number(W)

    for element in map:  # crea le liste Eremp e Erems
      if element[1] == 0:
        d.append(element)

    if n == 991:
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

    if n == 991:
      graph = viewInstanceGraph(V, W)

    print('DELETION')
    print(d)

    for deletion in d:
      V, W = del_repair(V, W, map, deletion)


    print('W aggiornata: ', W)
    print("V aggiornata: ", V)

    minimo = min(V_n)

    W1 = []

    W1 = riordina(W, minimo, W1)

    W1, V1 = aggiorna_label(W, map, V)

    print('W1 label: ', W1)

    print('W ordinata: ', W)

    if n == 991:
      graph = viewInstanceGraph(V1, W1)

    elapsed = time.time() - start_time_total

    V1.sort()
    W1.sort()

    print(trace)
    saveGFile(V1, W1, "/Users/jozie/Desktop/NewBigOriginale/results/"+str(n), time.time() - trace_start_time, sort_labels)
    saveGfinal(V1, W1, "{0}_instance_graphs.g".format(name), sort_labels)

    print('------------------------------------------------------------------')

  end_time=time.time()
  tempo_di_esecuzione= end_time-start_time
  print("Il tempo di esecuzione è  "+str(tempo_di_esecuzione))

def main():
  net_file = "/Users/jozie/Desktop/NewBigOriginale/BIG Datasets/bpi2012decompositionExpr/bpi2012decompositionExpr_petriNet.pnml"
  log_file = "/Users/jozie/Desktop/testing/decomposition/decompX20_2.xes"
  BIG(net_file, log_file)


if __name__ == '__main__':
  main()

