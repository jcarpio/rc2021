/*
 pertenece(+E, +Arbol)
 es cierto si la etiqueta E pertenece
 a Arbol.
*/

pertenece(Elem, a(Elem, _,_)).

pertenece(Elem, a(Et, Ai, _)):-
  Elem \= Et,
  pertenece(Elem, Ai).
  
pertenece(Elem, a(Et, _, Ad)):-
  Elem \= Et,
  pertenece(Elem, Ad).  