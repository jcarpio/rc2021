/*
crea_abb(+Lista, -Abb)
 es cierto si Abb unifica con un árbol binario
 de búsqueda que contiene las etiquetas
 de Lista.
 
 Un ábol binario de búsqueda es aquel que
 para todo nodo el sub-arbol de la izquierda
 contiene etiqutas menores y el sub-arbol de 
 la derecha mayores o iguales que la etiqueta
 del nodo.
 
                   10
				  /   \
				 5     12
				/ \   /  \
			   3   7 11   15
 
 

crea_abb([1,2,3,5,6,7,8,9,10], A).
A = a() 
*/

crea_abb([], nil).

crea_abb(Lista, a(Et,Ai,Ad)):-
  length(Lista, L),
  N is L div 2,
  length(L1, N),
  append(L1, [Et|L2], Lista),
  crea_abb(L1, Ai),
  crea_abb(L2, Ad).

