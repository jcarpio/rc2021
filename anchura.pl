/*
 anchura(+Ag, -Lista)
 es cierto si Lista unifica con la lista
 que contiene a todas las etiquetas de Ag
 resultado de recorrer el árbol en anchura.
 
 Recorrido en Anchura
de un árbol genérico

       1
	 / | \ 
	2  3  4
   / \ |   \
  5  6 7    8
  
  1,2,3,4,5,6,7,8
 
 */
 
 anchura(a(Et, ListaHijos), [Et|R]):-
   anchura(ListaHijos, R).
   
 anchura([], []).
 anchura([a(Et, ListaHijos)|Resto], [Et|R2]):-
   append(Resto,ListaHijos, R),
   anchura(R, R2).
   
 
 