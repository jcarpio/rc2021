
% elemento_enesimo(+Pos, +Lista, -Elem) 
% que es cierto cuando Elem unifica con el 
% elemento que ocupa la posición Pos dentro 
% de Lista.

elemento_enesimo(1, [Cab|_], Cab).
elemento_enesimo(N, [_|Resto], Elem):- N > 1, 
  N2 is N-1, elemento_enesimo(N2, Resto, Elem).

% elemento_enesimo(3, [1,2,3,4,5,6,7], Elem)
% 
% elemento_enesimo(2, [2,3,4,5,6,7], Elem) 
%                  -  -------------
%				N-1	    Resto