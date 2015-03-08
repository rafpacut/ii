dom(niebieski).
dom(czerwony).
dom(zolty).
dom(bialy).
dom(zielony).

czlowiek(hiszpan).
czlowiek(anglik).
czlowiek(ukrainiec).
czlowiek(norweg).
czlowiek(japonczyk).

zwierze(pies).
zwierze(waz).
zwierze(lis).
zwierze(kon).
zwierze(slon).

papieros(winston).
papieros(koole).
papieros(chesterfieldy).
papieros(lucky_striky).
papieros(kenty).

napoj(kawa).
napoj(herbata).
napoj(mleko).
napoj(sok).
napoj(wodka).

% kazdy dom ma wlasciciela:
wlasciciel(X,Y):-dom(X),
		czlowiek(Y).

wlasciciel(czerwony,anglik).

% ma zwierze:
ma_zwierze(X,Y):-czlowiek(X),
		zwierze(Y),

ma_zwierze(hiszpan,pies).
