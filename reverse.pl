
% reverse(?List, ?ListR) que es cierto cuando
% ListR unifica con una lista que contiene 
% los mismos elementos que List pero en 
% orden inverso.

reverse([], []).

reverse([Cab|Resto], R2):- reverse(Resto, R),
  append(R, [Cab], R2).