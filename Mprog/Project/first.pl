populate([], X_row, Y_dimension, Y_dimension):- !.
populate([H|List],X_row, Y_dimension, CountY):-
	H = data(position(X_row, CountY),Visited,parent_pos(Z, Z1)),
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

path_reconstruction(Graph, data(position(_,_),_,parent_pos(X,Y)), PathAcc, Path):-
	nonvar(X), nonvar(Y), !,
	get_elem(Parent, Graph, X, Y),
	path_reconstruction(Graph, Parent, [(X,Y)|PathAcc], Path).

path_reconstruction(_,_, Path, Path):- !.
		
mark_path(Graph, [[]|_]):-!.
mark_path(Graph, []):- !.
mark_path(Graph, [(X,Y)|Rest]):-
	get_elem(Vertex, Graph, X, Y),
	mark_visited(Vertex),
	mark_path(Graph, Rest).



bfs(X_dimension, Y_dimension, (X,Y), (X1,Y1),RecentPath, Path):-
	array2d_constructor(X_dimension, Y_dimension, Graph),
	mark_path(Graph, RecentPath),
	get_elem(StartVertex, Graph, X, Y),
	get_elem(EndVertex, Graph, X1, Y1),
	create_queue(Queue),
	loop(Graph, Queue,StartVertex, EndVertex, Path).



loop(Graph, _, EndVertex, EndVertex, Path):-
	!,
	EndVertex = data(position(X,Y),_,parent_pos(_,_)),
	path_reconstruction(Graph, EndVertex, [(X,Y)], Path).

loop(Graph, Queue, Vertex, EndVertex, Path):-
	was_not_visited(Vertex), !,
	mark_visited(Vertex),
	add_neighbours(Graph, Queue, Vertex, NewQueue),
	dequeue(NextVertex, NewQueue, OtherQueue),
	loop(Graph, OtherQueue, NextVertex, EndVertex, Path).

%in case Vertex in loop was already visited:
loop(Graph, Queue, Vertex, EndVertex, Path):-
	dequeue(NextVertex, Queue, OtherQueue), 
	!,
	loop(Graph, OtherQueue, NextVertex, EndVertex, Path).


loop(Graph, [], Vertex, Endvertex, _):-
	!,
	write(emptyQueue).	
	% That should start another permutation.
%The seperate Vertex and EndVertex should remain, becouse first loop call
%is loop(_, [], SomeVertex, SomePosssiblyOtherVertex).
has_no_parent(data(position(_,_),_,parent_pos(X,Y))):-
	var(X), var(Y).

add_neighbour(Graph, Queue, Vertex, Parent,ProductQueue):-
	nonvar(Vertex),
	has_no_parent(Vertex),
	was_not_visited(Vertex),
	!,
	set_parent(Vertex, Parent),
	enqueue(Vertex, Queue, ProductQueue).

add_neighbour(Graph, Queue, Vertex, Parent,ProductQueue):-
	nonvar(Vertex),
	was_not_visited(Vertex),
	!,
	enqueue(Vertex, Queue, ProductQueue).

add_neighbour(_, Queue, _,_, Queue).


add_neighbours(Graph, Queue, Parent, ProductQueue):-
	Parent = data(position(X,Y),_,parent_pos(_,_)), 

	X1 is X + 1, Y1 is Y + 1,
	X2 is X - 1, Y2 is Y - 1,	

	get_elem(Vert1, Graph, X, Y1),
	add_neighbour(Graph, Queue, Vert1,Parent, Queue2),

	get_elem(Vert2, Graph, X, Y2),
	add_neighbour(Graph, Queue2, Vert2, Parent,Queue3),

	get_elem(Vert3, Graph, X1, Y),
	add_neighbour(Graph, Queue3, Vert3, Parent,Queue4),

	get_elem(Vert6, Graph, X2, Y),
	add_neighbour(Graph, Queue4, Vert6,  Parent,ProductQueue).



was_not_visited(data(position(_,_),Visited, parent_pos(_,_))):-
	var(Visited).

set_parent(data(position(_,_),_, parent_pos(X,Y) ), data(position(X,Y),_,parent_pos(_,_))).


mark_visited(data(position(_,_),Visited, parent_pos(_,_))):-
	Visited = true.

	

find_pair_path([], _, _, _, _):- !.

find_pair_path(PairList, X_dimension, Y_dimension, RecentPaths, [Path1|Path2]):-
	PairList = [((X,Y),(X1,Y1))|Rest],
	bfs(X_dimension, Y_dimension, (X,Y), (X1,Y1),RecentPaths, Path1),
	append(RecentPaths, Path1, TempPaths),
	find_pair_path(Rest, X_dimension, Y_dimension,TempPaths, Path2).

permute([],[]).
permute(List, [((X,Y),(X1,Y1))|Rest]):-
	select(((X,Y),(X1,Y1)), List, List1),
	permute(List1, Rest).



solve(X_dimension, Y_dimension, ListaPar, Rozwiazanie):-
	permute(ListaPar, PermutedPairsList),
	find_pair_path(PermutedPairsList, X_dimension, Y_dimension, [],  Rozwiazanie).
	





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

