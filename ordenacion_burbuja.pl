%-----------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
% Caso base de la inducción: 
% 1) Que Lista esté ordenada
% 2) Si append(L1, [E1,E2|L2], Lista), E1 > E2
%     ordena_burbuja(Lista2,  R):- 
%	   append(L1, [E2,E1|L2], Lista2).
%
% Principio de Inducción
% 1) P(n0)
% 2) n > n0, P(n-1) -> P(n) 
%-----------------------------------------------------

% Caso en que la lista está ordenada
ordena_burbuja(Lista, Lista):- ordenada(Lista).

% Caso en que la lista está desordenada
ordena_burbuja(Lista, R):-
  append(L1, [E1,E2|L2], Lista),
  E1 > E2,
  append(L1, [E2,E1|L2], L3),
  ordena_burbuja(L3, R).  

%--------------------------------------
% ordenada(+Lista)
% es cierto si los elementos de Lista están
% ordenados de menor a mayor.
%--------------------------------------

ordenada([]).
ordenada([_]).
ordenada([C1,C2|Resto]):- C1 =< C2,
  ordenada([C2|Resto]).
