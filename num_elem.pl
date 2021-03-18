
% num_elem(?Lista, ?Num)
% es cierto si Num unifica con el número
% de elementos de Lista

% Principio de Inducción
% 1) P(n0)
% 2) n > n0, P(n-1) -> P(n)
% num_elem(Lista, ) :- num_elem(Lista-1, ).

% ¿Cuál es la lista más pequeña?
% La lista vacia []

num_elem([], 0).
num_elem([_|Resto], N2):- num_elem(Resto, N), 
  N2 is N + 1.





