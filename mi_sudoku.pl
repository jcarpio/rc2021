
:- use_module(library(clpfd)).

mi_sudoku(Filas):- length(Filas, 9), % Filas tiene 9 posiciones
                    maplist(same_length(Filas), Filas), % Cada elemento en filas tiene 9 posiciones
					append(Filas, Var), Var ins 1..9, % incluimos todas las variables en Var
					maplist(all_distinct, Filas), % Todas las filas con valores distintos
					transpose(Filas, Columnas),
					maplist(all_distinct, Columnas), % Todas las columnas diferentes
					Filas = [F1,F2,F3,F4,F5,F6,F7,F8,F9], % Tomamos filas de 3 en 3
					% cada grupo de tres filas consta de tres bloques
					bloques_distintos(F1,F2,F3), 
					bloques_distintos(F4,F5,F6), 
					bloques_distintos(F7,F8,F9).
	
% bloques_distintos(Lista1, Lista2, Lista3)
% es cierto si los bloques 3x3 que forman las tres listas
% tienen valores diferentes. Vease el siguiente ejemplo.
% |1,2,3|1,2,3|1,2,3|
% |4,5,6|4,5,6|4,5,6|
% |7,8,9|7,8,9|7,8,9|
	
bloques_distintos([],[],[]).				
bloques_distintos([A,B,C|Resto1], [D,E,F|Resto2], [G,H,I|Resto3]):-
	             all_distinct([A,B,C,D,E,F,G,H,I]),
				 bloques_distintos(Resto1, Resto2, Resto3).
				 
solucion(1, S) :- sudoku(1, S), mi_sudoku(S), maplist(labeling([ff]), S), maplist(portray_clause, S).				 
					
sudoku(1, P) :-
        P = [[1,_,_,8,_,4,_,_,_],
             [_,2,_,_,_,_,4,5,6],
             [_,_,3,2,_,5,_,_,_],
             [_,_,_,4,_,_,8,_,5],
             [7,8,9,_,5,_,_,_,_],
             [_,_,_,_,_,6,2,_,3],
             [8,_,1,_,_,_,7,_,_],
             [_,_,_,1,2,3,_,8,_],
             [2,_,5,_,_,_,_,_,9]].					