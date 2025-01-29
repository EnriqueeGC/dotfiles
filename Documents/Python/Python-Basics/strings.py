message1 = 'hello World!'
message2 = "Hello World 2!"
mesaage3 =  """
            Hello World, this is also a string
            """
message4 = '''
            this is a string too
            '''

print(message1.title())
print(message2)
print(mesaage3)
print(message4.title())
# Whitespaces tab and New Line
print('\tHello') 
print('\nHello\nWorld')

# Stripping WHitespaces
# 'python' and 'python ' isn't the same.
message1 = 'python '
print(message1, len(message1))
print(message1.rstrip(), len(message1.rstrip()))
