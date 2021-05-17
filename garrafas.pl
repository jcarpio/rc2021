/*
Problemas de Estado
-----------------------

1) Definición del estado
   
   estado(L3, L5)
   
2) Definición/Implementación de los movimientos 

  mov(NombreMov, EstadoAnterior, EstadoPosterior, Coste)  
  
  Movimientos:
  1 - Llenar L3 
  2 - Llenar L5
  3 - Vaciar L3
  4 - Vaciar L5
  5 - Pasar de L3 a L5
  6 - Pasar de L5 a L3
*/  
  
% DEFINICIÓN DE LAS ACCIONES POSIBLES

mov(llenar_l3, estado(_, L5), estado(3, L5)).
mov(llenar_l5, estado(L3, _), estado(L3, 5)).
mov(vaciar_l3, estado(_, L5), estado(0, L5)).
mov(vaciar_l5, estado(L3, _), estado(L3, 0)).

% Pasar de L3 a L5
mov(pasar_l3_a_l5, estado(L3, L5), estado(0, T)):-
	T is L3 + L5, T =< 5.
mov(pasar_l3_a_l5, estado(L3, L5), estado(T1, 5)):-
	T is L3 + L5, T > 5, T1 is T - 5.
	
% Pasar de L5 a L3
mov(pasar_l5_a_l3, estado(L3, L5), estado(T, 0)):-
	T is L3 + L5, T =< 3.
mov(pasar_l5_a_l3, estado(L3, L5), estado(3, T2)):-
	T is L3 + L5, T > 3, T2 is T - 3.
  
/*  
camino(+EstadoInicial, +EstadoFinal, +Visitados, -Camino)
  es cierto si Camino unifica con la lista de 
  nombres de movimientos para pasar del EstadoInicial
  al EstadoFinal sin repetir los estados de la
  lista Visitados.
                         Camino(n)
  EstadoInicial ---------------------------> EstadoFinal
  
                  Mov             Camino(n-1)
  EstadoInicial -------> EstadoTMP --------> EstadoFinal

*/ 

camino(EstadoIni, EstadoIni, _, []).

camino(EstadoIni, EstadoFin, Visitados, [NomMov|Camino]):-
  mov(NomMov, EstadoIni, EstadoTMP),
  camino(EstadoTMP, EstadoFin, [EstadoTMP|Visitados], Camino).
  
% Solución
% camino(estado(0,0), estado(_, 4), [], Camino).
% Camino = [llenar_l5, pasar_l5_a_l3, vaciar_l3, pasar_l5_a_l3, llenar_l5, pasar_l5_a_l3]
