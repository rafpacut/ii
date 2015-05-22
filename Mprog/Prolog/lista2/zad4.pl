append( [], X, X).
append( [H|T], X, [H|Y] ):-
	append(T,X,Y).


select(H, [H|T], T).
select(X, [H|T], [H|S]):-
	select(X, T, S).


	% 3.1 ?-append(X,X,Y).
	% 3.2 ?-select(X,[a,b,c,d], [a,c,d]).
	% 3.3 ?-append([a,b,c],X,[a,b,c,d,e]).

even([]).
even([_|T]):-
	odd(T).

odd([_|T]):-
	even(T).


palindrome(X):- X=Y, reverse(X,Y).

singleton([_|[]]).

head(H,[H|T]).

last([H],H).
last([_|T],H):-
	last(T,H).

tail(T,[_|T]).


init([_],[]).
init([H|T],[H|R]):-
	init(T,R).

prefix([H],[H|[_]]).
prefix([H|T],[H|R]):-
	prefix(T,R).

suffix(L,L).
suffix([H|L], [H|R]).

sublist(L1,L2):-
	append([],X,L1).
