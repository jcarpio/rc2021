/*
 suma_nodos(+Arbol, -N)
 es cierto si N unifica con la suma
 de todas las etiquetas de Arbol.
 
*/

suma_nodos(nil, 0).

suma_nodos(a(Et, Ai, Ad), R):-
  number(E),
  suma_nodos(Ai, Ri),
  suma_nodos(Ad, Rd),
  R is Et + Ri + Rd.