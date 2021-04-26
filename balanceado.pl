/*
  balanceado(+Arbol)
  es cierto si Arbol está balanceado.
  Para todo nodo la diferencia entre la altura
  del sub-arbol de la derecha y el sub-arbol
  de la izquierda es como máximo uno.
    
  balanceado       no-balanceado  no-balanceado
      1              1                  1
	 / \            /                  / \
 	2   3          2                  2   5
                  /                  /     \
                 3 				    3       6
				                   /         \
								  4           7
*/

balanceado(nil).
balanceado(a(_,Hi,Hd)):-
  altura(Hi, Ai),
  altura(Hd, Ad),
  N is Ai - Ad, abs(N, N2),
  N2 =< 1,
  balanceado(Hi),
  balanceado(Hd).
  
altura(nil, 0).
altura(a(_,Hi,Hd), R):-
  altura(Hi, Ri),
  altura(Hd, Rd),
  X is max(Ri,Rd),
  R is X + 1.
  
