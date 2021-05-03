/*
crea_ag(+Lista, -Ag)
 es cierto si Ag unifica con un árbol
 genérico que contiene todas las 
 etiquetas que aparecen en Lista.
 
*/

crea_ag([E], a(E,[])).
crea_ag([E1,E2], a(E1, [a(E2,[])])).
crea_ag([Cab|Lista], a(Cab, [Ag1, Ag2]) ):-
  length(Lista, Length), 
  Length2 is Length div 2, Length >= 2,
  length(L1, Length2),
  append(L1, L2, Lista),
  crea_ag(L1, Ag1),
  crea_ag(L2, Ag2).