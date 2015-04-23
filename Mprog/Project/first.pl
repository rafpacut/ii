pop([vertex(position(X,Y_dimension),Visited,parent_pos(ParentX,ParentY))], X, Y_dimension, Y_dimension):- !.
pop([Head|Rest], X, Y_dimension, YAcc):-
	%Head = (X, YAcc),
	Head = vertex(position(X, YAcc), Visited, parent_pos(ParentX, ParentY)),
	YAcc1 is YAcc + 1,
	pop(Rest, X, Y_dimension, YAcc1).

create_graph(X_dimension, Y_dimension, Graph):-
	create_graph(X_dimension, Y_dimension, 1, Graph).

create_graph(X_dimension, Y_dimension, X_dimension, [Array]):- 
	pop(Array, X_dimension, Y_dimension, 1), !.


create_graph(X_dimension, Y_dimension, XAcc, [Array|RestOfGraph]):-
	pop(Array, XAcc, Y_dimension, 1),
	XAcc1 is XAcc + 1,
	create_graph(X_dimension, Y_dimension, XAcc1, RestOfGraph).


get_elem(Elem, Graph, X, Y):-
	get(Column, Graph, X ,1),
	nonvar(Column),
	!,
	get(Elem, Column, Y, 1).

get_elem(_,_,_,_):- !.

get(Elem, [Elem|_], Position, Position):-!.

get(Elem, [Head|Tail], Position, Acc):-
	Acc1 is Acc + 1,
	get(Elem, Tail, Position, Acc1).

get(_, [], _, _):- !.

% 2d array handling.
% get_elem(Elem, List2d, X, Y) gets the i,j element of 2d array
% get_elem(-,+,+,+)
% Elem - Sought element.
% List2d - Two dimensional array to be searched.
% X,Y - position in rows and columns respectively.

%get_elem(Elem, List2d, X, Y):-
%	get_elem(List1d, List2d, X), 
%	nonvar(List1d),
%	get_elem(Elem, List1d, Y), !.
%
%get_elem(_,_,_,_):-!.
%	
%
%get_elem(Elem,[Elem|_],0):- !.
%get_elem(Elem,[_|Tail],Iter):-
%	IterNext is Iter - 1,
%	get_elem(Elem,Tail,IterNext).
%
%get_elem(_, [], _):- !. % This should prevent from crashing when no such elem exists.

% queue implementation using difference list
queue_constructor(L-L).

% Queue handling
create_queue(List-List).


enqueue(Elem, List-[Elem|Rest], List-Rest).


dequeue(Elem, List-Last, NewList-Last) :- 
	List \== Last,
	List = [Elem|Rest],
	NewList = Rest.

path_reconstruction(Graph, vertex(position(_,_),_,parent_pos(X,Y)), PathAcc, Path):-
	nonvar(X), nonvar(Y), !,
	get_elem(Parent, Graph, X, Y),
	path_reconstruction(Graph, Parent, [(X,Y)|PathAcc], Path).

path_reconstruction(_,_, Path, Path):- !.
		
mark_path(Graph, [], first):- !.
mark_path(Graph, [(X,Y)|Rest], first):-
	mark_path(Graph, Rest).

mark_path(Graph, [[]|_]):-!. % Is it still necessary?
mark_path(Graph, []):- !.
mark_path(Graph, [(X,Y)|Rest]):-
	get_elem(Vertex, Graph, X, Y),
	mark_visited(Vertex),
	mark_path(Graph, Rest).

	%Take first vertex out of recent path to allow bfs to start from it.
	%Is the first element of RecentPath also the first of Path?	


bfs(X_dimension, Y_dimension, (X,Y), (X1,Y1),RecentPath, Path):-
	create_graph(X_dimension, Y_dimension, Graph),
	mark_path(Graph, RecentPath, first),
	get_elem(StartVertex, Graph, X, Y),
	get_elem(EndVertex, Graph, X1, Y1),
	create_queue(Queue),
	loop(Graph, Queue,StartVertex, EndVertex, Path).





loop(Graph, _, EndVertex, EndVertex, Path):-
	EndVertex = vertex(position(X,Y),_,parent_pos(_,_)),
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
has_no_parent(vertex(position(_,_),_,parent_pos(X,Y))):-
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
	Parent = vertex(position(X,Y),_,parent_pos(_,_)), 

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



was_not_visited(vertex(position(_,_),Visited, parent_pos(_,_))):-
	var(Visited).

set_parent(vertex(position(_,_),_, parent_pos(X,Y) ), vertex(position(X,Y),_,parent_pos(_,_))).


mark_visited(vertex(position(_,_),Visited, parent_pos(_,_))):-
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



pairs_to_points([], []):- !.
pairs_to_points([((X,Y),(X1,Y1))|PairsList], [(X,Y),(X1,Y1)|PointsList]):-
	pairs_to_points(PairsList, PointsList).


solve(X_dimension, Y_dimension, ListaPar, Rozwiazanie):-
	permute(ListaPar, PermutedPairsList),
	find_pair_path(PermutedPairsList, X_dimension, Y_dimension, [],  Rozwiazanie),
	!.
	



