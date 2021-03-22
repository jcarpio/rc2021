% pertenece(+Elem, +Lista)
% es cierto si Elem pertenece a la Lista

pertenece(Cab, [Cab|_] ).
pertenece(N , [Cab | Resto] ) :- N \= Cab,  pertenece(N , Resto ).


