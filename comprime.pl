
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