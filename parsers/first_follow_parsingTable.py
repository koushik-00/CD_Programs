from collections import defaultdict
d = defaultdict(list)
f = defaultdict(list)
fo = defaultdict(list)
p = defaultdict(dict)
d = {'E':['TG'],'G':['+TG','e'],'T':['FW'],'W':['*FW','e'],'F':['(E)','c']}
# First Functions
for i,j in d.items():
    z = i
    k = 0
    while k<len(d[z]):
        if 'a'<=d[z][k][0]<='z' or d[z][k][0] in '(+)*' or d[z][k][0]=='e':
            f[i].append(d[z][k][0])
            k+=1
        else:
          
            z=d[z][k][0]
            k = 0
# Follow Functions
for z in d.keys():
  for i,j in d.items():
    for k in d[i]:
      if z in k:
        if z=='E':
          fo['E'].extend('$')
        n = k.index(z)+1
        if n<len(k):
          if k[n] in '()+*' or ('a'<=k[n]<='z' and k[n]!='e'):
            fo[z].extend(k[n])
          if k[n]=='e':
            fo[z].extend(fo[i])
          elif 'A'<=k[n]<='Z':
            fo[z].extend([i for i in f[k[n]] if i!='e'])
            fo[z].extend(fo[k[n]])
        else:
          if z!=i:
            fo[z].extend(fo[i])
print("First Functions of all Non-Terminals")
for i,j in f.items():
    print(i,'==>',set(j))


print("\nFollow Functions of all Non-Terminals")
for i,j in fo.items():
    print(i,'==>',set(j))
# Parsing Table
# Parsing Table
print("\nParsing Table")
for i in d.keys():
  k = f[i]
  if 'c' in k:
    p[i].update({'c':d[i]})
  else:
    p[i].update({'c':"Error"})
  if '+' in k:
    p[i].update({'+':d[i]})
  else:
    p[i].update({'+':"Error"})
  if '*' in k:
    p[i].update({'*':d[i]})
  else:
    p[i].update({'*':"Error"})
  if '(' in k:
    p[i].update({'(':d[i]})
  else:
    p[i].update({'(':"Error"})


  if ')' in k:
    p[i].update({')':d[i]})
  else:
    p[i].update({')':"Error"})
  if '$' in k:
    for m in fo[k]:
      p[i].update({'m':d[i]})
  else:
    p[i].update({'$':"Error"})
for i,j in p.items():
  print(i,'-->',j)