
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
  
/*
(1.5 puntos) Implemente el predicado lista_hojas(+Arbol_binario, +Lista_hojas) que
es cierto cuando Lista_hojas unifica con las lista de etiquetas de las hojas contenidas en el árbol
binario
*/

lista_hojas(nil, []).

hoja(a(_, nil, nil)).

lista_hojas(a(E,nil,nil), [E]).

lista_hojas(a(_, Hi, Hd), R):-
  \+ hoja(a(_,Hi,Hd)),
  lista_hojas(Hi, Ri),
  lista_hojas(Hd, Rd),
  append(Ri, Rd, R).
  
  
/*
(1.5 puntos) Implemente el predicado balanceado(+Arbol_binario) 
que es cierto cuando la diferencia entre la altura del arbol 
derecho y el izquierdo de cualquier nodo es como máximo 1.

      1 
     / \
    2   5
   /     \
  3       6
 /	       \
4           7

*/

balanceado(nil).

balanceado(a(_, Hi, Hd)):-
  altura(Hi, Ai),
  altura(Hd, Ad),
  X is abs(Hi - Hd),
  X =< 1,
  balanceado(Hi),
  balanceado(Hd).
 
altura(nil, 0).
altura(a(_, Hi, Hd), R):-
  altura(Hi, Ai),
  altura(Hd, Ad),
  X is max(Ai, Ad),
  R is X + 1.
  
/*
(1.5 puntos) Implemente el predicado 
construye_arbol_generico(+Lista, -Arbol_generico) que es cierto 
Arbol_generico unifica con un árbol genérico que contiene
todas las etiquetas de Lista.
*/

construye_arbol_generico([Cab|Resto], a(Cab, R)):-
  construye_lista_arboles_genericos(Resto, R).

construye_lista_arboles_genericos([], []).
construye_lista_arboles_genericos([Cab|Resto], [a(Cab,[])|R]):-
   construye_lista_arboles_genericos(Resto, R).
   
   
/*
(2 puntos) Implemente el predicado ciclos(+Grafo, -Lista_ciclos) que es cierto cuando
Lista_ciclos unifica con todos los ciclos de Grafo.   

Supongo que el grafo es dirigido, el camino es una
lista de vértices y los visitados es una lista de
aristas.

Llamaré al predicado que devuelve todas las soluciones
bolsa(Plantilla, Objetivo, Lista)

*/

camino(_, Ini,Ini,_,[Ini]).
camino(grafo(V,A), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(Ini, Tmp, A),
  \+ member(arista(Ini,Tmp), Visitados),
  camino(grafo(V,A), Tmp, Fin, [arista(Ini,Tmp)|Visitados], 
  Camino).
  
ciclo(grafo(V,A), Ciclo):- member(Vertice, V),
       camino(grafo(V,A), Vertice, Vertice, [], Ciclo), 
	   length(Ciclo, L), L > 1.
	   
ciclos(G, R):- bagof(C, ciclo(G, C), R).

/*
iguales(A1, A2),
es cierto si los árboles binario/generico A1 y A2 son iguales.
*/

iguales(A,A).
  
 

  
  

  
  

