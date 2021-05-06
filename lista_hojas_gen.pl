/*
 lista_hojas_gen(+Arbol, -Lista)
  es cierto si Lista unifica con una lista 
  que contiene las etiquetas de las hojas
  del árbol genérico Arbol.
*/

lista_hojas_gen(a(_, ListaHijos), R):-
  ListaHijos \= [],
  lista_hojas_gen(ListaHijos, R).
  
lista_hojas_gen(a(E, []), [E]).
  
lista_hojas_gen([], []).
lista_hojas_gen([Cab|Resto], R):-
  lista_hojas_gen(Cab, Rca),
  lista_hojas_gen(Resto, RResto),
  append(Rca, RResto, R).  
