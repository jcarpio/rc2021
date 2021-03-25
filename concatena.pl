
% concatena(+L1, +L2, -R)
%  es cierto si R unifica con una lista que
%  contiene los elementos de L1 seguidos de
%  los elementos de L2
%

concatena([], L2, L2).

concatena([Cab|Resto], L2, [Cab|Resto]):-
  concatena(Resto, L2, R).
