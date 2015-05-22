% zad2.a) filter([],[]).

filter([],[]).
filter([H|T],[H|T2]):-
	H >= 0,
	filter(T,T2).

filter([H|T],S):-
	H < 0,
	filter(T,S).


% zad2.b)
% count(Elem,List,Count)
count(_,[],0).
count(Elem,[Elem|T],Count):-
	count(Elem,T,C),
	Count is C + 1.

count(Elem, [H|T], Count):-
	count(Elem, T, C),
	Count is C.

% zad2.c)
% exp(+Base, +Exp, ?Res).
exp(_,0,1):-
	!.

exp(Base,Exp,Res):-
	E is Exp -1,
	exp(Base, E, Res2),
	Res is Base*Res2.  


% 5te
% select_min(+NumList, ?Min, ?Rest)



% zad1.

perm([],[]).
perm([H|T1],T):-
	perm(T1,X),
	select(H, T, X).

			

	


