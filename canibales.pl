
% https://novelgames.com/en/missionaries

/*

1. Definición del estado
  
  estado(MI, CI, Barca).
  
  Estado Inicial:
  estado(0, 0, dcha). 
  
  Estado Final:
  estado(3, 3, izq).


2. Definición de los movimientos

- Pasar un misionero a izq/dcha
- Pasar un canibal a izq/dcha
- Pasar dos misioneros a izq/dcha
- Pasar dos canibales a izq/dcha
- Pasar un misionero y un canibal a izq/dcha

*/

mov(pasar_un_mis_izq, estado(MI, CI, dcha), estado(MI2, CI, izq)):-
  MI2 is MI + 1.
  
  
% mov(pasar(C,M,Dir), estadoAntes, estadoDespues).   

pasar(1,0, izq).
pasar(1,0, dcha).
pasar(0,1, izq).
pasar(0,1, dcha).
pasar(2,0, izq).
pasar(2,0, dch).
pasar(0,2, izq).
pasar(0,2, dch).
pasar(1,1, izq).
pasar(1,1, dcha).

mov(pasar(M, C, izq), estado(MI, CI, dch), estado(MI2, CI2, izq)):-
   MI2 is MI + M, CI2 is CI + C.
   
mov(pasar(M, C, dcha), estado(MI, CI, izq), estado(MI2, CI2, dcha)):-
   MI2 is MI - M, CI2 is CI - C.
   

no_valido(estado(1, 2, _)).
no_valido(estado(2, 3, _)).
no_valido(estado(2, 1, _)).

camino(EstadoIni, EstadoIni, _, []).

camino(EstadoIni, EstadoFin, Visitados, [pasar(M,C,Dir)|Camino]):-
  mov(pasar(M, C, Dir), EstadoIni, EstadoTMP),
  \+ no_valido(EstadoTMP),
  \+ member(EstadoTMP, Visitados),
  camino(EstadoTMP, EstadoFin, [EstadoTMP|Visitados], Camino).
