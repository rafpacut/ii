permute([],[]).
permute(List, [X|Rest]):-
	select(X, List, List1),
	permute(List1, Rest).


do_sth([3|_]).

program:-
	List = [1,2,3],
	permute(List,List2),
	do_sth(List2).
