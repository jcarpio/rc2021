
% comprime(+Lista, -Resultado)
% es cierto si Resultado unfica con una lista
% de siguiente forma:
%
% comprime([a,a,a,b,b,c,d,d], R)
% R = [(a,3),(b,2),(c,1),(d,2)]

comprime([],[]).
comprime([Elem],[(Elem,1)]).
comprime([Cab,Cab|Resto], [(Cab,N2)|R]):-
  comprime([Cab|Resto], [(Cab,N)|R]),
  N2 is N + 1.
  
comprime([Cab1,Cab2|Resto], [(Cab1,1)|R]):-
  Cab1 \= Cab2,
  comprime([Cab2|Resto], R).
  
%------------------------------------------------------
% mas_veces(+Lista, -Elem, -Num)
% es cierto cuando Elem unifica con el elemento
% que se repite más veces en la lista Lista
% y Num unifica con el número de veces que se
% repite dicho elemento.
%------------------------------------------------------
mas_veces(Lista, Elem, N):-
  msort(Lista, ListaOrdenada),
  comprime(ListaOrdenada, R),
  mayor(R, Elem, N).
  
mayor([], _, 0).  
mayor([(E,N)|Resto], E, N):-
  mayor(Resto, _, N1), N >= N1.
mayor([(_,N)|Resto], E1, N1):-
  mayor(Resto, E1, N1), N < N1.  
  
% 1. Ordenar la lista

% 2. Comprimir la lista

% 3. Ordenar la lista atendiendo al valor
%    de la tupla que indica el número de veces
%    que se repite el elemento.
%    Otra opción sería buscar el mayor N

% 4. Acceder al último elemento de la lista
%    leer el elemento y número de veces que se
%    repite.