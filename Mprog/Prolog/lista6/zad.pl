% stos

put(Elem, Stack, [Elem|Stack]).

get(Elem, [Elem|Stack], Stack).

empty([]).

addall(Elem, Goal, Stack, NewStack):-
	call(Goal),
	put(Elem, Stack, NewStack).


% queue

put2(Elem, List-[Elem|Rest], List-Rest).

get2(Elem, List-Last, NewList-Last):-
	List \== Last,
	List = [Elem|Rest].


program:-
	Que = A-A,
	put2(1,Que,Que1),
	put2(2,Que1,Que2),
	get2(X,Que2, Que3),
	write(X).
