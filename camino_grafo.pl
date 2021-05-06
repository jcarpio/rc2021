/*
  a ------- b
   \        |
    \       |
	 c ---- d ---- e
	 
Grafo no dirigido
	 
grafo([a,b,c,d,e], [arista(a,b),
                    arista(a,c),
					arista(c,d),
					arista(b,d),
					arista(d,e)]).
				
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

camino(_, Ini, Ini, _, [Ini]).

camino(grafo(_,A), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(Ini, TMP, grafo(_,A)),
  \+ member(TMP, Visitados),
  camino(grafo(_,A), TMP, Fin, [TMP|Visitados], Camino).

/*conectado(+A,+B, +G).
  es cierto si los vertices A y B están conectados
  mediante una arista en el grafo G. Si el grafo 
  es dirigido la conexión está solo entre A y B. En
  el caso de los grafos no dirigidos la conexión va
  desde A hata B y desde B hasta A.
*/

conectado(A,B, grafo(_,Aristas)) :- member(arista(A,B), Aristas).
conectado(A,B, grafo(_,Aristas)) :- member(arista(B,A), Aristas).


grafo1(grafo([a,b,c,d,e], [arista(a,b),
                    arista(a,c),
					arista(b,d),
					arista(c,d),
					arista(d,e)])).

ciclos(grafo(V,A), Camino):- member(P, V), camino(grafo(_, A), P, P, [], Camino).   