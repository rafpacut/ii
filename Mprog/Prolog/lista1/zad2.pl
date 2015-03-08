mily(X):-czlowiek(X),
	odwiedza_ZOO(X).

styka_sie(X,Y):-zwierze(X),
		mieszka_w_zoo(X),
		czlowiek(Y),
		odwiedza_ZOO(Y).

szczesliwy(X):-zwierze(X),
		styka_sie(X,Y).

nieszczesliwy(X):- smok(X),
		mieszka_w_zoo(X).


%1) Smok to zwierze.
zwierze(smok).

%2) Ktos odwiedza zoo.
czlowiek(rafal).
odwiedza_ZOO(rafal).

