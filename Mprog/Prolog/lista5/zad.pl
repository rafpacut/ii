% halve(+,-,-)

halve(List,Left,Right):-
	halve(List,List,Left,Right).


halve(Right,[],[], Right):-
	!.
halve(Right,[_],[],Right):-
	!.

halve([Head|Tail],[_,_|Tail2],[Head|Left],Right):-
	halve(Tail,Tail2,Left,Right).

% merge(+,+,-)

merge([],List, List):-
	!.
merge(List,[],List):-
	!.


merge([Head|Tail],[Head2|Tail2],[Head|Merged]):-
	Head =< Head2,
	!,
	merge(Tail,[Head2|Tail2],Merged).


merge([Head|Tail],[Head2|Tail2],[Head2|Merged]):-
	merge([Head|Tail],Tail2,Merged).	


% mergesort(+,-).
mergesort([],[]):-
	!.
mergesort([X],[X]):-
	!.

mergesort(List,Sorted):-
	halve(List,Left,Right),
	mergesort(Left,SortedLeft),
	mergesort(Right,SortedRight),
	merge(SortedLeft,SortedRight, Sorted).

































