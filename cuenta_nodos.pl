/*

Árboles Binarios en Prolog
---------------------------

    1
   / \
  2   3
       \
	    4
		
  a(1,a(2,nil,nil),a(3,nil,a(4,nil,nil))).		
		
1) El árbol binario más pequeño
   es el árbol nulo = nil (por convenio)
   
2) Un árbol binario se representa
   a(E, Ai, Ad)  (por convenio)

*/

% cuenta_nodos(+Arbol, -N)
% es cierto si N unifica con el número de nodos
% de Arbol

cuenta_nodos(nil, 0).
cuenta_nodos(a(Hi, HD), N):-
 cuenta_nodos(Hi, Ni),
 cuenta_nodos(Hd, Nd),
 N is Ni + Nd + 1.


   
   
   
