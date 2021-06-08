
:- use_module(library(clpz)).

suma(0, Y, Y).
suma(X, Y, s(Z)) :- suma (s(X), Y, Z).