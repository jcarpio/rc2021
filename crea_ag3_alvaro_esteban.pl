% Caso base para 1 elemento
crea_ag3([E], a(E, [])).

% Caso base para 2 elemento
crea_ag3([E1, E2], a(E1, [a(E2, [])])).

% Caso base para 3 elementos
crea_ag3([E1, E2, E3], a(E1, [a(E2, []), a(E3, [])])).

% Caso para 4 elementos o más
crea_ag3([Cab|Lista], a(Cab, [SubAI, SubAC, SubAD])) :-
	length(Lista, Tam),
	Tam >= 3,
	Tercio is Tam div 3,
	length(L1, Tercio),
	length(L2, Tercio),
	append(L1, L2, ListaDosTercios),
	append(ListaDosTercios, L3, Lista),
	crea_ag3(L1, SubAI),
	crea_ag3(L3, SubAC),
	crea_ag3(L2, SubAD).
	
% Utilizamos la reversibilidad de los predicados length y append
% para dividir la lista por la mitad.