%			 +
%		   /   \
%		  *	    /
%		 / \   / \
%		2   2 0	  3


% inorden 2 * 2 + 0 / 3 -> izq, raiz, dcha
% inorder(+Arbol, -R)
% es cierto si R unifica con una lista con 
% las etiquetas de Arbol en inorden.

inorden(nil, []).
inorden(a(Et, Hi, Hd), R):-
  inorden(Hi, Ri),
  inorden(Hd, Rd),
  append(Ri, [Et|Rd], R).
  
  
hoja(a(_, nil,nil)).
inorden2(a(Et, nil, nil), [Et]).  
inorden2(nil, []).
inorden2(a(Et, Hi, Hd), R2):-
  \+ hoja(a(Et,Hi,Hd)),
  inorden2(Hi, Ri),
  inorden2(Hd, Rd),
  append(['('|Ri], [Et|Rd], R),
  append(R, [')'], R2).
  
% preoden + * 2 2 / 0 3 -> raiz, izq, dcha

% postorden 2 2 * 0 3 / + -> izq, dcha, raiz