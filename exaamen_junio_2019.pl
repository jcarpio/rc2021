
% Implemente el predicado invertir(+Lista, -ListaR) 
% que es cierto cuando ListaR unifica con una lista 
% que contiene los elementos de Lista en orden 
% inverso.

invertir([],[]).

invertir([Cab|Resto], R2):-
    invertir(Resto, R),
	append(R,[Cab],R2).
	
/*
(2 puntos) Implemente el predicado mas_veces(+Lista, -Elem, -Num)
 que es cierto cuando Elem unifica con el elemento que se repite
 más veces en Lista y Num unifica con el número de veces que 
 se repite dicho elemento.
*/

% 1. ordeno la lista
% 2. comprime
% 3. obtener la tupla con mayor N

% comprime(Lista, R)
% es cierto si R unifica con una lista que contiene los elementos
% de Lista con el siguiente formato
%
% comprime([1,1,1,2,2,3,1,1], R)
% R = [(1,3),(2,2),(3,1),(1,2)]

% comprime([1,1,2,2,3,1,1])
% R = [(1,2),(2,2),(3,1),(1,2)]

comprime([], []).

comprime([E], [(E,1)]).

comprime([C1,C1|Resto], [(C1,N2)|R]):-
  comprime([C1|Resto], [(C1,N)|R]),
  N2 is N+1.
  
comprime([C1,C2|Resto], [(C1,1)|R]):-
  C1 \= C2,
  comprime([C2|Resto], R).  
			
mas_veces(Lista, E, N):-
  msort(Lista, L2),
  comprime(L2, R),
  tupla_n_mayor(R, E, N).
    
  
% tupla_n_mayor(Lista, E, N)
% es cierto si E unifica con el elemento de lista que
% se repite más veces y N el número de veces que se repite,
% conteniendo L una lista de tuplas con los elementos y el
% número de veces que se repiten. Si la lista está vacía ç
% N vale -1

tupla_n_mayor([], _, -1).

tupla_n_mayor([(Cab,N)|Resto], Cab, N):-
  tupla_n_mayor(Resto, Emayor, Nmayor),
  N > Nmayor.
  
tupla_n_mayor([(Cab,N)]|Resto], Emayor, Nmayor):-
  tupla_n_mayor(Resto, Emayor, Nmayor),
  N =< Nmayor.
  
  

