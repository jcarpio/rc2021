%--------------------------------------------------
% permuta(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene los elementos de Lista en orden
% distinto. Este predicado genera todas las
% listas posibles por backtraking.
%
% permuta([1,2,3], R)
% R = [1,2,3];
% R = [1,3,2];
% R = [2,1,3];
% R = [2,3,1];
% R = [3,1,2];
% R = [3,2,1];

permuta([],[]).
permuta([Cab|Resto], R2):-
  permuta(Resto, R),
  insertar_todas(Cab, R, R2).
  
insertar_todas(E, Lista, [E|Lista]).
insertar_todas(E, [Cab|Resto], [Cab|R]):-
  insertar_todas(E, Resto, R).
%--------------------------------------------------