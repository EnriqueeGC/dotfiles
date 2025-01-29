""" 

__*__
_***_
*****
__#__
__#__

"""
def imprimir_patron_con_altura(altura):
    guiones = altura * 2 + 1 

    for i in range(altura + 1):
        num_asteriscos = 2 * i + 1
        num_guiones = (guiones - num_asteriscos) // 2
        print("_" * num_guiones + "*" * num_asteriscos + "_" * num_guiones, end='\n')
    base =  guiones // 2
    print('_'*base+ '#'+ '_'*base)
        
# Solicitar altura al usuario
altura = int(input("Ingresa la altura del patrón: "))
imprimir_patron_con_altura(altura)
