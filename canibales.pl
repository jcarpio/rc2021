
% https://novelgames.com/en/missionaries

/*

1. Definición del estado
  
  estado(MI, CI, Barca).
  
  Estado Inicial:
  estado(0, 0, dch). 
  
  Estado Final:
  estado(3, 3, izq).


2. Definición de los movimientos

- Pasar un misionero a izq/dcha
- Pasar un canibal a izq/dcha
- Pasar dos misioneros a izq/dcha
- Pasar dos canibales a izq/dcha
- Pasar un misionero y un canibal a izq/dcha

*/

% mov(pasar_un_mis_izq, estado(MI, CI, dcha), estado(MI2, CI, izq)):-
%  MI2 is MI + 1.
  
  
% mov(pasar(C,M,Dir), estadoAntes, estadoDespues).   

pasar(1,0, izq).
pasar(1,0, dch).
pasar(0,1, izq).
pasar(0,1, dch).
pasar(2,0, izq).
pasar(2,0, dch).
pasar(0,2, izq).
pasar(0,2, dch).
pasar(1,1, izq).
pasar(1,1, dch).

mov(pasar(M, C, izq), estado(MI, CI, dch), estado(MI2, CI2, izq)):-
   pasar(M,C,izq),
   MD is 3 - MI, CD is 3 - CI, MD >= M, CD >= C,
   MI2 is MI + M, CI2 is CI + C.
   
mov(pasar(M, C, dch), estado(MI, CI, izq), estado(MI2, CI2, dch)):-
   pasar(M, C, dch),
   MI >= M, CI >= C,
   MI2 is MI - M, CI2 is CI - C.
   
no_valido(estado(1, 3, _)).
no_valido(estado(1, 2, _)).
no_valido(estado(2, 3, _)).
no_valido(estado(2, 1, _)).
no_valido(estado(1, 0, _)).
no_valido(estado(2, 0, _)).

camino(EstadoIni, EstadoIni, _, []).

camino(EstadoIni, EstadoFin, Visitados, [pasar(M,C,Dir)|Camino]):-
  mov(pasar(M, C, Dir), EstadoIni, EstadoTMP),
  \+ no_valido(EstadoTMP),
  \+ member(EstadoTMP, Visitados),
  camino(EstadoTMP, EstadoFin, [EstadoTMP|Visitados], Camino).


% solucion:
solucion(Camino):- camino(estado(0,0, dch), estado(3,3,_), [], Camino). 