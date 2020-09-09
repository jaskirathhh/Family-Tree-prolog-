%parent
parent(raja,rajesh).
parent(raja,ram).
parent(rani,rajesh).
parent(rani,ram).
parent(ram,ramesh).
parent(ram,raju).
parent(seema,ramesh).
parent(seema,raju).
parent(ram,roshni).
parent(seema,roshni).
parent(ramesh,ritik).
parent(ramesh,madhu).
parent(sita,ritik).
parent(sita,madhu).
parent(raju,karan).
parent(raju,sudha).
parent(rashi,karan).
parent(rashi,sudha).
parent(ritik,deepu).
parent(reena,deepu).
parent(karan,hitesh).
parent(larika,hitesh).




%child
child(ram,raja).
child(ram,rani).
child(rajesh,rani).
child(rajesh,raja).
child(ramesh,ram).
child(raju,ram).
child(ramesh,seema).
child(raju,seema).
child(roshni,seema).
child(roshni,ram).
child(ritik,ramesh).
child(ritik,sita).
child(madhu,ramesh).
child(madhu,sita).
child(karan,raju).
child(karan,rashi).
child(sudha,raju).
child(sudha,rashi).
child(deepu,ritik).
child(deepu,reena).
child(hitesh,karan).
child(hitesh,larika).




%spouse

spouse(ram,seema).
spouse(seema,ram).
spouse(ramesh,sita).
spouse(sita,ramesh).
spouse(raju,rashi).
spouse(rashi,raju).
spouse(alok,roshni).
spouse(roshni,alok).
spouse(reena,ritik).
spouse(ritik,reena).
spouse(karan,larika).
spouse(larika,karan).
spouse(rajesh,meena).
spouse(meena,rajesh).
spouse(raja,rani).
spouse(rani,raja).

%male

male(ram).
male(ramesh).
male(raju).
male(ritik).
male(karan).
male(alok).
male(deepu).
male(hitesh).
male(rajesh).
male(raja).

%female

female(seema).
female(sita).
female(rashi).
female(madhu).
female(sudha).
female(roshni).
female(reena).
female(larika).
female(meena).
female(rani).

%rules


father(X,Y):-parent(X,Y),child(Y,X),male(X).
mother(X,Y):-parent(X,Y),child(Y,X),female(X).
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
husband(X,Y):-spouse(X,Y),spouse(Y,X),male(X).
wife(X,Y):-spouse(X,Y),spouse(Y,X),female(X).

uncle(X,Y):-father(Z,Y),brother(X,Z).
aunt(X,Y):-uncle(Z,Y),wife(X,Z).
grandfather(X,Y):-father(Z,Y),father(X,Z).
grandmother(X,Y):-father(Z,Y),mother(X,Z).
granduncle(X,Y):-grandfather(Z,Y),brother(X,Z).
grandaunt(X,Y):-granduncle(Z,Y),spouse(X,Z).
greatgrandfather(X,Y):-grandfather(Z,Y),father(X,Z).
greatgrandmother(X,Y):-grandfather(Z,Y),mother(X,Z).


son(X,Y):-(father(Y,X),male(X));(mother(Y,X),male(X)).
daughter(X,Y):-(father(Y,X),female(X));(mother(Y,X),female(X)).


siblings(X,Y):-(brother(X,Y);sister(X,Y)),X\==Y.
firstcousin(X,Y):-(grandfather(Z,Y),grandfather(Z,X));(grandmother(Z,Y),grandmother(Z,X)).
secondcousin(X,Y):-(greatgrandfather(Z,Y),greatgrandfather(Z,X));(greatgrandmother(Z,Y),greatgrandmother(Z,X)).

brotherinlaw(X,Y):-husband(W,Y),brother(X,W).
sisterinlaw(X,Y):-husband(W,Y),sister(X,W).



query(X):-

   father(F,X),write("father :"),print(F),nl,!,
   mother(M,X),write("mother :"),print(M),nl,!,
   grandfather(GF,X),write("grandfather :"),print(GF),nl,!,
   grandmother(GM,X),write("grandmother :"),print(GM),nl,!,
   son(S,X),write("son :"),print(S),nl,!,
   daughter(D,X),write("daughter :"),print(D),nl,!,
   uncle(U,X),write("uncle :"),print(U),nl,!,
   aunt(A,X),write("aunt :"),print(A),nl,!,
   secondcousin(SC,X),write("second cousin :"),print(SC),nl,!,
   firstcousin(FS,X),write("first cousin :"),print(FS),nl,!,
   brotherinlaw(BL,X),write("brother in law :"),print(BL),!,
   sisterinlaw(SL,X),write("sister in law :"),print(SL),!,
   granduncle(GA,X),write("granduncle :"),print(GA),!,
   grandaunt(GAT,X),write("grandaunt :"),print(GAT),!.






