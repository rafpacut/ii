append( [], X, X).
append( [H|T], X, [H|Y] ):-
	append(T,X,Y).


select(H, [H|T], T).
select(X, [H|T], [H|S]):-
	select(X, T, S).


	% 3.1 ?-append(X,X,Y).
	% 3.2 ?-select(X,[a,b,c,d], [a,c,d]).
	% 3.3 ?-append([a,b,c],X,[a,b,c,d,e]).



