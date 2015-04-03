dimension(X,7). % dimensions of the board, suppose for the moment its square.

%make list of lists.


populate([], Y_dimension, Y_dimension):- !.
populate([H|List], Y_dimension, CountY):-
	H is CountY,
	CountY1 is CountY + 1,
	populate(List, Y_dimension, CountY1).	



mult(X_dimension,Y_dimension, List2d):-
	mult(X_dimension, Y_dimension, 0, List2d).

mult(X,_,X,[]):- !.
mult(X,Y,Count,[A|B]) :-
  X\=Count,
  populate(A,Y, 0),
  Count1 is Count+1,
  mult(X,Y,Count1,B).

