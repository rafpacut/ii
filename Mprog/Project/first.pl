populate([], Y_dimension, Y_dimension):- !.
populate([H|List], Y_dimension, CountY):-
%	H = data(Visited,Parent),
	H = CountY,
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
% get_elem(Elem, List2d, X, Y) gets the i,j element of 2d array
% get_elem(-,+,+,+)
% Elem - Sought element.
% List2d - Two dimensional array to be searched.
% X,Y - position in rows and columns respectively.

get_elem(Elem, List2d, X, Y):-
	get_elem(List1d, List2d, X),
	get_elem(Elem, List1d, Y).
	
get_elem(Elem,[Elem|_],1):- !.
get_elem(Elem,[_|Tail],Iter):-
	IterNext is Iter - 1,
	get_elem(Elem,Tail,IterNext).

% printing 2d array for debugging purposes.
% print_array(Array2d, Xdimension, Ydimension, X, Y).
% X/Ydimension - wymiary tablicy
% X/Y - iteratory, wywolywac z X=1, Y=1.


print_array(Array, Xdimension, Ydimension, X, Ydimension):-
	!,
	get_elem(Elem, Array, X, Ydimension),
	write(Elem),
	nl,
	X1 is X + 1,
	X1 =< Xdimension,
	print_array(Array, Xdimension, Ydimension, X1, 1).


print_array(Array, Xdimension, Ydimension, X, Y):-
	get_elem(Elem, Array, X, Y),
	write(Elem),
	Y1 is Y + 1,
	print_array(Array, Xdimension, Ydimension, X, Y1).

print_array(Array, Xdimension, Ydimension, Xdimension):-
	print_array(Array, Xdimension, Ydimension, Xdimension, 1), !.


print_array(Array, Xdimension, Ydimension, X):-
	print_array(Array, Xdimension, Ydimension, X, 1).




% queue implementation using difference list
queue_constructor(L-L).

% Queue handling
create_queue(List-List).

enqueue(Elem, List-[Elem|Rest], List-Rest).

dequeue(Elem, List-Last, NewList-Last) :- 
	List \== Last,
        List = [Elem|Rest].


mark_visited(data(Visited, Parent)):-
	Visited = true.
	




%bfs(Graph, Startvertex, Path):-
%	create_queue(Queue),
%	mark_visited(Startvertex)
%	enqueue(Startvertex, Queue, Queue1),






program:-
	array2d_constructor(4,4,List2d),
	print_array(List2d, 4, 4, 1).





















