
%------------------------------------------------
% lista_divisores(+X, +Y, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene a los números cuyo resto
% de la división entera de X entre Z es igual a 0
% para valores de Z entre 1 e Y.
% lista_divisores(10, 10, R)
% R = [1,2,5]
%-------------------------------------------------


lista_divisores(_, 1, [1]).
lista_divisores(X, Y, [Y|R]):-
  Y > 1, Y2 is Y-1,
  0 is X mod Y,
  lista_divisores(X, Y2, R).
  
lista_divisores(X, Y, R):-
  Y > 1, Y2 is Y-1,
  Resto is X mod Y,
  Resto \= 0,
  lista_divisores(X, Y2, R).


%---------------------------------------------------
% primo(+X)
% es cierto si X unifica con un número primo.
%---------------------------------------------------



%---------------------------------------------------
% primosEntrexy(+X, +Y, -ListaR)
% es cierto cuando ListaR unifica con una lista
% que contiene a los primos que van desde X hasta
% Y ambos incluidos en orden ascendente.
%---------------------------------------------------

