
crea_ag([E], a(E,[])).

crea_lista_ag([],[]).
crea_lista_ag([Cab|Resto], [R1,R2]):-
 length(Resto, L), L > 2,
 X is L div 2,
 length(L1, X), 
 append(L1, L2, Resto),
 crea_lista_ag(L1, R1),
 crea_lista_ag(L2, R2).