% Prolog - Primer programa

% natural(+N)
% es cierto si N es un número natural

natural(1).

% natural(n-1) -> natural(n).

natural(N) :- number(N), N > 1, N2 is N - 1, natural(N2).

% N = N - 1.
