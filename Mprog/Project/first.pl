populate([], X_row, Y_dimension, Y_dimension):- !.
populate([H|List],X_row, Y_dimension, CountY):-
	H = data(position(X_row, CountY),Visited,parent_pos(X_row, CountY)),
	CountY1 is CountY + 1,
	populate(List,X_row,  Y_dimension, CountY1).	



array2d_constructor(X_dimension,Y_dimension, List2d):-
	array2d_constructor(X_dimension, Y_dimension, 0, List2d).

array2d_constructor(X,_,X,[]):- !.
array2d_constructor(X,Y,Count,[A|B]) :-
  X\=Count,
  populate(A,Count,Y, 0),
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
	nonvar(List1d),
	get_elem(Elem, List1d, Y), !.

get_elem(_,_,_,_):-!.
	

get_elem(Elem,[Elem|_],0):- !.
get_elem(Elem,[_|Tail],Iter):-
	IterNext is Iter - 1,
	get_elem(Elem,Tail,IterNext).

get_elem(_, [], _):- !. % This should prevent from crashing when no such elem exists.

% queue implementation using difference list
queue_constructor(L-L).

% Queue handling
create_queue(List-List).


enqueue(Elem, List-[Elem|Rest], List-Rest).


dequeue(Elem, List-Last, NewList-Last) :- 
	List \== Last,
	List = [Elem|Rest],
	NewList = Rest.




bfs(Graph, Startvertex, Endvertex, Path):-
	create_queue(Queue),
	loop(Graph, Queue,Startvertex, Endvertex).




loop(Graph, Queue, Vertex, EndVertex):-
	was_not_visited(Vertex), !,
	Vertex = data(position(X,Y),_,parent_pos(_,_)), write(X+Y+wasntVisited), nl,
	mark_visited(Vertex),
	add_neighbours(Graph, Queue, Vertex, NewQueue),
	dequeue(NextVertex, NewQueue, OtherQueue),
	%set_parent(NextVertex, Vertex),
	loop(Graph, OtherQueue, NextVertex, EndVertex).

%in case Vertex in loop was already visited:
loop(Graph, Queue, Vertex, EndVertex):-
	Vertex = data(position(X,Y),_,parent_pos(_,_)), write(X+Y+wASVisited),nl,
	dequeue(NextVertex, Queue, OtherQueue), 
	!,
	loop(Graph, OtherQueue, NextVertex, EndVertex).

loop(_, _, EndVertex, EndVertex):-
	!,
       write(weHaveAWinner).	% start path recreation.

loop(Graph, [], Vertex, Endvertex):-
	!,
	write(emptyQueue).	
	% That should start another permutation.
%The seperate Vertex and EndVertex should remain, becouse first loop call
%is loop(_, [], SomeVertex, SomePosssiblyOtherVertex).

add_neighbour(Graph, Queue, Vertex, ProductQueue):-
	nonvar(Vertex), !,
	enqueue(Vertex, Queue, ProductQueue).

add_neighbour(_, Queue, _, Queue).


add_neighbours(Graph, Queue, data(position(X,Y),_,parent_pos(_,_)), ProductQueue):-
	X1 is X + 1, Y1 is Y + 1,
	X2 is X - 1, Y2 is Y - 1,

	get_elem(Vert1, Graph, X, Y1),
	add_neighbour(Graph, Queue, Vert1, Queue2),

	get_elem(Vert2, Graph, X, Y2),
	add_neighbour(Graph, Queue2, Vert2, Queue3),

	get_elem(Vert3, Graph, X1, Y),
	add_neighbour(Graph, Queue3, Vert3, Queue4),

	get_elem(Vert4, Graph, X1, Y1),
	add_neighbour(Graph, Queue4, Vert4, Queue5),

	get_elem(Vert5, Graph, X1, Y2),
	add_neighbour(Graph, Queue5, Vert5, Queue6),

	get_elem(Vert6, Graph, X2, Y),
	add_neighbour(Graph, Queue6, Vert6,  Queue7),

	get_elem(Vert7, Graph, X2, Y1),
	add_neighbour(Graph, Queue7, Vert7,  Queue8),

	get_elem(Vert8, Graph, X2, Y2),
	add_neighbour(Graph, Queue8, Vert8,  ProductQueue).




was_not_visited(data(position(_,_),Visited, parent_pos(_,_))):-
	var(Visited).

set_parent(data(position(_,_),Visited, parent_pos(X,Y) ), parent_pos(X,Y)).


mark_visited(data(position(_,_),Visited, parent_pos(_,_))):-
	Visited = true.
	






program:-
	array2d_constructor(4,4, List2d),
	get_elem(S, List2d, 0,0),
	get_elem(E, List2d, 2,2),
	bfs( List2d, S, E, Path).



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

