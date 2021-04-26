arbol1(a(3, a(2, a(1, nil, nil), a(4, nil, nil)), a(4, nil, a(1, nil, nil)))).

%			 3
%		   /   \
%		  2	    4
%		 / \     \
%		1   4	  1

arbol2(a(5, a(3, a(2, nil, nil), a(2, nil, nil)), a(6, a(0, nil, nil), a(3, nil, nil)))).

%			 5
%		   /   \
%		  3	    6
%		 / \   / \
%		2   2 0	  3

arbol3(a(1, a(2, a(2, nil, nil), nil), a(4, a(8, nil, nil), a(3, nil, nil)))).

%			 1
%		   /   \
%		  2	    4
%		 /     / \
%		2     8	  3

arbol4(a(1, a(2, a(3, nil, nil), nil), nil)).

%			1
%		   /
%		  2
%		 /
%		3

arbol5(a(1, a(2, a(3, a(6, nil, nil), nil), nil), a(4, nil, a(5, nil, a(7, nil, nil))))).

%			1
%		   / \
%		  2   4
%		 /     \
%		3       5
%      /         \
%     6           7


arbol6(a(+, a(*, a(2, nil, nil), a(2, nil, nil)), a(/, a(0, nil, nil), a(3, nil, nil)))).

%			 +
%		   /   \
%		  *	    /
%		 / \   / \
%		2   2 0	  3


% inorden 2 * 2 + 0 / 3 -> izq, raiz, dcha
%
% preoden + * 2 2 / 0 3 -> raiz, izq, dcha

% postorden 2 2 * 0 3 / + -> izq, dcha, raiz