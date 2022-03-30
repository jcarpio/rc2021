% lista_divisores(+X, +Y, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene a los números cuyo resto
% de la división entera de X entre Z es igual a 0
% para valores de Z entre 1 e Y.


lista_divisores(_, 1, [1]).

lista_divisores(X, Y, [Y|R]):-
  Y > 1,
  Y2 is Y - 1,
  lista_divisores(X, Y2, R),
  0 is mod(X, Y).

lista_divisores(X, Y, R):-
  Y > 1,
  Y2 is Y - 1,
  lista_divisores(X, Y2, R),
  Resto is mod(X, Y), Resto \= 0.

/*

 divisores(+X, -R).
   es cierto si R unifica con la lista de
   divisores de X.
 
*/  
divisores(X, R):- lista_divisores(X, X, R).


/*

primo(+X).
  es cierto si X es un número primo.

*/

primo(X):- divisores(X, [X,1]).


/*

primo_xy(+X, +Y, -R).
  es cierto si R unifica con una lista
  que contiene los primos que
  van desde X hasta Y.

*/

primos_xy(X, Y, []):- X > Y.

primos_xy(X, Y, [X|R]):- X =< Y, X2 is X+1,
       primos_xy(X2, Y, R), primo(X). 

primos_xy(X, Y, R):- X =< Y, X2 is X+1,
       primos_xy(X2, Y, R), \+ primo(X).

