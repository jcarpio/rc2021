/*

Grafos
--------

- Grafos no dirigidos

  a ------- b
   \        |
    \       |
	 c ---- d ---- e
	 
- Grafos dirigidos	 
  a ------> b
   \        |
   _\/      V
	 c ---> d ---> e

grafo(ListaVertices, ListaAristas)

grafo([a,b,c,d,e], [arista(a,b), arista(b,d), arista(a,c)
                    arista(c,d), arista(d,e)]).
					
Aplicamos inducción a los grafos para 
obtener el camino

camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso, -Camino2).
  es cierto si Camino unifica con lista vertices/aristas
  que van desde Ini hasta Fin en Grafo sin repetir
  los vertices/aristas que hay en la lista Visitados.
  Peso (opcional) unifica con el coste total del camino.
  Camino2 (opcional) unifica con un camino desde Ini
  hasta Fin representado como lista de etiquetas de las
  aristas.

  1) P(n0)
  2) n > n0, P(n-1) -> P(n)
  
               camino(n)
  Ini ------------------------> Fin
  
  Ini --------> TMP ----------> Fin
       arista         camino
	                   (n-1)


       a
      / \
     /   \
    /     \
   /       \
 b ---------- c
  | \     / |
  |  \   /  |
  |   \ /   |
  |   / \   |
  |  /   \  |
  | /     \ |
 d|---------- e

*/
grafo_sobre(grafo([a,b,c,d,e], [arista(a,b), arista(a,c), arista(b,c),
                   arista(b,d), arista(d,e), arista(c,e),
				   arista(b,e), arista(d,c)])).
				   
camino(_, Ini, Ini, _, []).

camino(grafo(_, A), Ini, Fin, Visitados, [arista(Ini,TMP)|Camino]):-
  conectado(Ini, TMP, grafo(_,A)),
  \+ member(arista(Ini, TMP), Visitados),
  camino(grafo(_,A), TMP, Fin, [arista(Ini,TMP),
                                arista(TMP,Ini)|Visitados], 
								Camino).  

conectado(A,B, grafo(_, Aristas)):- member(arista(A,B), Aristas).
conectado(A,B, grafo(_, Aristas)):- member(arista(B,A), Aristas).  

sobre(grafo(V,A), Camino):- member(P, V),
        camino(grafo(_,A), P, _, [], Camino), length(Camino, 8).

% obtener el número de soluciones
%  grafo_sobre(G), bagof(C, sobre(G, C), R), length(R, N)