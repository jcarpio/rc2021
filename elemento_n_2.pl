
% elemento_enesimo(+Pos, +Lista, -Elem) 
% que es cierto cuando Elem unifica con el 
% elemento que ocupa la posición Pos dentro 
% de Lista.

% Principio de Inducción Matemático
%
% 1) P(n0)
%
% 2) n > n0, P(n-1) -> P(n)

elemento_nesimo(1, [Cab|_], Cab).

elemento_nesimo(N, [_|Resto], Elem):- 
   N > 1, N2 is N-1,
   elemento_nesimo(N2, Resto, Elem).
   
   
%  elemento_nesimo(4, [1,2,3,4,5,6,7], 4).

%  elemento_nesimo(3, [2,3,4,5,6,7], 4)  










