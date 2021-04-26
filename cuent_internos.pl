/*
  cuenta_internos(+Arbol, -N)
  es cierto si N unifica con el número
  de nodos internos de Arbol
  
*/

% cuenta_nodos(+Arbol, -N)
% es cierto si N unifica con el número de nodos
% de Arbol

cuenta_nodos(nil, 0).
cuenta_nodos(a(Hi, HD), N):-
 cuenta_nodos(Hi, Ni),
 cuenta_nodos(Hd, Nd),
 N is Ni + Nd + 1.