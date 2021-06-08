:- use_module(library(clpfd)).

% Dimensión

% N dias a la semana
% K bloques por día

% clase_asig_prof_numVeces(Clase, Asignatura, Profesor, NumVeces)
% La Clase necesita la Asignatura impartida por Profesor NumVeces a la semana.
% La asignatura debe impartirse al menos una vez al dia.

% Tarea: consiste en asignar profesor/asignatura a bloque de tiempo

% suponemos que todas las semanas tenemos las mismas clases

huecos_semana(30).
huecos_dia(6).

clase_asign_prof_veces('1a', mate, jose, 5).
clase_asign_prof_veces('1a', ingl, laura, 5).
clase_asign_prof_veces('1a', hist, juan, 2).


% Restricciones

% M1 // K #< M2 // K #< M3 // K Asignaturas en días diferentes K = slots por día

% estrictamente_ascendente(Lista)
% es cierto si todos los elementos de Lista siguen un orden
% estrictamente ascendente

estrictamente_ascendente([Cab|Resto]):-
  estrictamente_ascendente_(Resto, Cab).

% estrictamente_ascendete_(Lista, Anterior)
% es cierto si todos los elementos de Lista están ordenados
% de forma estrictamente ascendente y son mayores que Anterior
estrictamente_ascendente_([], _).
estrictamente_ascendente_([Cab|Resto], Anterior):-
  Anterior #< Cab,
  estrictamente_ascendente_(Resto, Cab).

cociente_entero(Divisor, Dividendo, Cociente):- Cociente #= Dividendo // Divisor.  
