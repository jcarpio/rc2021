
:- use_module(library(clpfd)).

% longitud(?Lista, ?Longitud)
% es cierto si Longitud unifica con el número de elmentos de
% Lista

longitud([], 0).

longitud([_|Resto], LT):-
   LT #= L + 1,
   longitud(Resto, L).