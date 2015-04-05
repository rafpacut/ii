%dimension(X,7). % dimensions of the board, suppose for the moment its square.

%make list of lists.


populate([], Y_dimension, Y_dimension):- !.
populate([H|List], Y_dimension, CountY):-
	H = data(notvisited,noparent),
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


% queue implementation using difference list
queue_constructor(L-L).

% Queue handling
create_queue(List-List).

add_queue(Elem, List-[Elem|Rest], List-Rest).

del_queue(Elem, List-Last, NewList-Last) :- 
	List \== Last,
        List = [Elem|Rest].




program:-
	create_queue(Queue),
	add_queue(1,Queue, Queue1),
	del_queue(X, Queue1, Queue2),
	write(X).

















