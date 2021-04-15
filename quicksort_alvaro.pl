% -----------------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
% es cierto cuando Menores unifica con una lista que
% contiene los elemenentos de Lista que son menores
% o iguales que Elem y Mayores unifica con una lista
% que contiene los elementos de Lista que son
% mayores que Elem.
% ------------------------------------------------------

divide(_,[],[],[]).
% divide(E,[Cab|Resto],Men2,May2) :- Cab =< E, insertar(Cab,Men1,Men2), 
%	Cab > E, insertar(Cab,May1,May2).

divide(E,[Cab|Resto],[Cab|Menores],Mayores) :- Cab =< E,
	divide(E,Resto,Menores,Mayores).
divide(E,[Cab|Resto],Menores,[Cab|Mayores]) :- Cab > E,
	divide(E,Resto,Menores,Mayores).	
	
% Con el divide no hace falta insertar a una nueva lista
% insertar(C,[],[C]).
% insertar(C,[Cab|Resto],[E,Cab|Resto) :- C =< Cab.
% insertar(C,[Cab|Resto], ) :- C > Cab,
% 	insertar(

% ---------------------------------------------------
% ordena_quick(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
% --------------------------------------------------

