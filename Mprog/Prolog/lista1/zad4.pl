parent(adam,helen).
parent(adam,ivonne).
parent(adam,anna).
parent(eve,helen).
parent(eve,ivonne).
parent(eve,anna).
parent(john,joshua).
parent(helen,joshua).
parent(ivonne,david).
parent(mark,david).

male(john).
male(joshua).
male(adam).
male(mark).
male(david).

female(eve).
female(helen).
female(ivonne).
female(anna).



sibling(X,Y):-parent(Z,X),
		parent(Z,Y).

sister(X,Y):-sibling(X,Y),
		female(X).

grandson(X,Y):-parent(Z,X),
		parent(Y,Z).
		male(X).

cousin(X,Y):-parent(Z,X),
		sibling(Z,A),
		parent(A,Y),
		male(X).

descendant(X,Y):-parent(Y,X).

is_mother(X):-parent(X,Z).
		female(X).

is_father(X):-parent(X,Z).
		male(X).
