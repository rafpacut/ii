dimension(X,7). % dimensions of the board, suppose for the moment its square.

%make list of lists.


populate([], Y_dimension, Y_dimension):- !.
populate([H|List], Y_dimension, CountY):-
	H = false,
	CountY1 is CountY + 1,
	populate(List, Y_dimension, CountY1).	



array2d_constructor(X_dimension,Y_dimension, List2d):-
	array2d_constructor(X_dimension, Y_dimension, 0, List2d).

array2d_constructor(X,_,X,[]):- !.
array2d_constructor(X,Y,Count,[A|B]) :-
  X\=Count,
  populate(A,Y, 0),
  Count1 is Count+1,
  array2d_constructor(X,Y,Count1,B).


% 2d array handling.
% get_element gets the i,j element of 2d array
% get_element(-,+,+,+)
% Elem - Sought element.
% List2d - Two dimensional array to be searched.
% X,Y - position in rows and columns respectively.

get_element(Elem, List2d, X, Y):-
	get_elem(List1d, List2d, Y),
	get_elem(Elem, List1d, X).
	
get_elem(Elem,[Elem|_],1):- !.
get_elem(Elem,[_|Tail],Iter):-
	get_elem(Elem,Tail,IterNext),
	Iter is IterNext + 1.


% Stack implementation
stack_constructor(Stack):-
	Stack = [].

% Stack handling
top([], empty).
top([Head|_], Head).

stack_pop([], empty).
stack_pop([_|Tail], Tail).
	
stack_put(Elem, Stack, [Elem|Stack]).

	


program:-
	array2d_constructor(2,2,List),
	get_element(Elem,List,2, 2),

	stack_constructor(Stack),
	stack_put(Elem, Stack, Stack1),
	top(Stack1, Elem),
	write(Elem),
	stack_pop(Stack, Stackmod).















