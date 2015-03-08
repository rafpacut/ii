przyjaciel(me, my_cat).

lubi(X,Y):-przyjaciel(X,Y).
lubi(X,Y):-przyjaciel(Y,X).
lubi(my_cat, ryba).
lubi(ptak, dzdzownica).


je(my_cat,X):-lubi(my_cat,X).
