% 1.
length(X,Y):-
	length(X,Y,0).

length([],Y,Y).
length([_|T],Y,Acc):-
	length(T,B,NextAcc),
	Acc is B,
	NextAcc is Acc+1.


% 2.
con(alwernia,bielsko).
con(alwernia,elblag).
con(bielsko,chrzanow).
con(bielsko,gdansk).
con(bielsko,alwernia).
con(bielsko,elblag).
con(chrzanow,bielsko).
con(chrzanow,elblag).
con(chrzanow,dabrowa).
con(elblag,alwernia).
con(elblag,bielsko).
con(elblag,chrzanow).
con(elblag,dabrowa).
con(elblag,frombork).
con(dabrowa,chrzanow).
con(dabrowa,elblag).
con(frombork,elblag).
con(frombork,gdansk).
con(gdansk,bielsko).
con(gdansk,frombork).


trip(From,To,By):-
	trip(From,To,[X],[Y]).

trip(Start,End,Z,Acc):-
	con(End,X),
	\+ member(X,Acc),
	trip(Start,X,[X|Z],[X|Acc]).

trip(Start,End,Z,Acc):-
	con(End,Start),
	write(Z),
	write(Acc).



%4.
mirror(leaf,leaf).
mirror(node(Left,Val,Right),node(MirRight,Val,MirLeft)):-
	mirror(Left,MirLeft),
	mirror(Right,MirRight).


flatten(leaf,[]).
flatten(node(Left,Val,Right),List):-
	flatten(Left,LeftList),
	flatten(Right,RightList),
	append(LeftList,[Val|RightList],List).


%5
%insert(Tree,Value,Result).

insert(leaf,Value,node(leaf,Value,leaf)).
insert(node(Left,NValue,Right),Value,node(Left,NValue,InsertedRight)):-
	Value >= NValue,
	insert(Right,Value,InsertedRight).

insert(node(Left,NValue,Right),Value,node(InsertedLeft,NValue,Right)):-
	Value < NValue,
	insert(Left,Value,InsertedLeft).


treesort(List,SortedList):-
	treesort(List,SortedTree,leaf),
	flatten(SortedTree, SortedList).
treesort([],SortedTree, SortedTree).
treesort([H|T], SortedTree, Acc):-
	insert(Acc,H,NAcc),
	treesort(T,SortedTree,NAcc).



