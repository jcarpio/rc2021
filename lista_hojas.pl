
/* lista_hojas(+Arbol_binario, ?Lista_hojas)
   es cierto cuando Lista_hojas unifica con 
   una lista que contiene las etiquetas 
   de las hojas del árbol Arbol_binario

    1
   / \
  2   3
       \
	    4
		
  a(1,a(2,nil,nil),a(3,nil,a(4,nil,nil))).
  
  lista_hojas(a(..), L).
  L = [2,4]
  
*/

arbol1(a(1,a(2,nil,nil),a(3,nil,a(4,nil,nil)))).
  

hoja(a(_,nil,nil)).

lista_hojas(nil, []).
lista_hojas(a(E,nil,nil), [E]).
lista_hojas(a(_, Hi, Hd), L):-
  \+ hoja(a(_, Hi, Hd)), 
  lista_hojas(Hi, Li),
  lista_hojas(Hd, Ld),
  append(Li,Ld, L).