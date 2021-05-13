/*     5
  a ------- b
   \        | 2
  2 \       | 
	 c ---- d ---- e
	    3      3
Grafo no dirigido
	 
grafo([a,b,c,d,e], [arista(a,b,5),
                    arista(a,c,2),
					arista(c,d,3),
					arista(b,d,2),
					arista(d,e,3)]).
				
Camino:

Ini -------------------> Fin
       camino

Ini ----------> TMP ------------------> Fin
     conectado			 camino	 
  
  
camino(+grafo(V,A), +Ini, +Fin, +Visitados, -Camino, -Peso).
  es cierto si Camino unifica con una lista de 
  vertices/aristas que representa el camino que
  va desde Ini hasta Fin en el grafo(V,A) y donde
  no se repiten los vertices/aristas de que están
  en la lista Visitados. El Peso unifica con coste total
  del camino  
*/  

camino(_, Ini, Ini, _, [Ini], 0).

camino(grafo(_,A), Ini, Fin, Visitados, [Ini|Camino], P2):-
  conectado(Ini, TMP, grafo(_,A), P),
  \+ member(TMP, Visitados),
  camino(grafo(_,A), TMP, Fin, [TMP|Visitados], Camino, Peso),
  P2 is Peso + P.

/*conectado(+A,+B, +G, -P).
  es cierto si los vertices A y B están conectados
  mediante una arista en el grafo G. Si el grafo 
  es dirigido la conexión está solo entre A y B. En
  el caso de los grafos no dirigidos la conexión va
  desde A hata B y desde B hasta A. P unificará con 
  el peso de la arista A-B
*/

conectado(A,B, grafo(_,Aristas), P) :- member(arista(A,B,P), Aristas).
conectado(A,B, grafo(_,Aristas), P) :- member(arista(B,A,P), Aristas).


grafo1(grafo([a,b,c,d,e], [arista(a,b,5),
                    arista(a,c,2),
					arista(c,d,3),
					arista(b,d,2),
					arista(d,e,3)])).

ciclos(grafo(V,A), Camino):- member(P, V), camino(grafo(_, A), P, P, [], Camino), length(Camino, L), L > 1. 

menor_camino([], 10000, _).

menor_camino([(P, C)|Resto], P, C):-
  menor_camino(Resto, P2, _),
  P =< P2.
menor_camino([(P, _)|Resto], P2, C2):-
  menor_camino(Resto, P2, C2),
  P > P2. 






camino_menor([], 10000, _).

camino_menor([(P,C)|Resto], P, C):-
   camino_menor(Resto, P2, _),
   P =< P2.

camino_menor([(P,_)|Resto], P2, C2):-
   camino_menor(Resto, P2, C2),
   P > P2.







  
  