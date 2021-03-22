
% elemento_enesimo0(+Pos, +Lista, -Elem) 
% que es cierto cuando Elem unifica con el 
% elemento que ocupa la posición Pos dentro 
% de Lista empezando a contar desde cero.

% Principio de Inducción Matemático
%
% 1) P(n0)
%
% 2) n > n0, P(n-1) -> P(n)

elemento_nesimo0(0, [Cab|_], Cab).

elemento_nesimo0(N, [_|Resto], Elem):- 
   N > 0, N2 is N-1,
   elemento_nesimo0(N2, Resto, Elem).
   
   
%  elemento_nesimo0(4, [1,2,3,4,5,6,7], 4).

%  elemento_nesimo0(3, [2,3,4,5,6,7], 4)  










