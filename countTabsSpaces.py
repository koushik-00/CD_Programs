file = open("dummyFile.txt","r")
data = file.read()

text=file.read()
count_tab=0
count_space=0
count_newline=0
count_chars=0
for char in data:
    if char=='\t':
        count_tab+=1
    elif char==' ':
        count_space+=1
    elif char=='\n':
        count_newline+=1
    else:
        count_chars+=1
print("Tabs: ", count_tab)
print("Spaces: ", count_space)
print("Newlines: ", count_newline)
print("Characters: ", count_chars)

