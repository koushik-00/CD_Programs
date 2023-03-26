# Define the LL(1) grammar rules and parse table
grammar_rules = {
    'S': [('a', 'A'), ('b', 'B')],
    'A': [('c',), ('d',)],
  
  'B': [('c',), ('e',)],
}
parse_table = {
    ('S', 'a'): ('a', 'A'),
    ('S', 'b'): ('b', 'B'),
    ('A', 'c'): ('c',),
    ('A', 'd'): ('d',),
    ('B', 'c'): ('c',),
    ('B', 'e'): ('e',),
}

def ll1_parser(input_string):
    stack=['S']
    idx=0
    while stack:
        top=stack.pop()

        if top in grammar_rules:
            try:
                prod=parse_table[top,input_string[idx]]
            except KeyError:
                return False
            stack.extend(reversed(prod))
        elif top==input_string[idx]:
            idx+=1
        else:
            return False
    return idx==len(input_string)
input_str = 'acb'
if ll1_parser(input_str):
    print(f'Input string "{input_str}" was accepted.')
else:
    print(f'Input string "{input_str}" was not accepted.')

