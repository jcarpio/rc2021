% concatena(+L1, +L2, -R)
%  es cierto si R unifica con una lista que
%  contiene los elementos de L1 seguidos de
%  los elementos de L2
%
%1.	P(n0)
%2. n > n0, P(n-1) -> P(n)

%concatena(L1, L2, [L1, L2]).
%concatena([], L2, [L1]).

% Concatenar lista vacía con otra lista da esa misma lista
% como resultado.
concatena([], L2, L2).

% Clausula de Horn
% a and c and d -> b
% b :- a, c, d.
% a.
%1.	P(n0)
%2. n > n0, P(n-1) -> P(n)

concatena([Cab|Resto], L2, [Cab|R]) :-
	concatena(Resto, L2, R).

% Mi solución
%concatena([Cab1|Res1], [Cab2|Res2], []) :-
%	concatena(Res1, [Cab2|Res2], [_, Cab1]) :-
%	concatena(_, Res2, [_, Cab2]).

	
	
	