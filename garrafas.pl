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

  mov(llenar_l3, estado(_, L5), estado(3, L5)).
  mov(llenar_l5, estado(L3, _), estado(L3, 5)).
  mov(vaciar_l3, estado(_, L5), estado(0, L5)).
  mov(vaciar_l5, estado(L3, _), estado(L3, 0)).
  mov(pasar_l3_a_l5, estado(L3, L5), estado(0, T)):-
     T is L3 + L5, T =< 5.  
  
  
  