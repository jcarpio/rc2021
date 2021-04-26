/*
Árboles Genéricos en Prolog
----------------------------

a(E, ListaHijos)

      1
	/ | \  
   2  3  4
 
a(1, [a(2,[]), a(3,[]), a(4,[])])

*/

% Predicado para Árbol Genérico

num_nodos_ag(a(_, ListaHijos), R):-
  num_nodos_lista_hijos(ListaHijos, RL),
  R is RL + 1.
  
% Predicado para Lista de Árboles  
num_nodos_lista_hijos([], 0).
num_nodos_lista_hijos([Cab|Resto], R2):-
  num_nodos_lista_hijos(Resto, R),
  num_nodos_ag(Cab, RCa),
  R2 is R + RCa.
  
  


