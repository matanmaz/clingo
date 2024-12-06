
choice("Pull_Lever_Redirect"; "Do_Nothing").

person(1..6).

{vote(X,Y): person(X)} :- choice(Y).

:- vote(X,Y), vote(X,Z), Y != Z.
:- person(X), not vote(X,_).

vote_count(CHOICE, COUNT) :- COUNT = #count{I : vote(I, CHOICE)}, choice(CHOICE).

max_vote(A) :- vote_count(A, X), vote_count(B, Y), X > Y.
max_vote("Do_Nothing") :- vote_count(A, X), vote_count(B, Y), X == Y.


#show vote_count/2.
#show max_vote/1.
#show percent/1.
death_count(5) :- max_vote("Pull_Lever_Redirect").
death_count(1) :- max_vote("Do_Nothing").

%at least 90% are voting to redirect
:- vote_count("Pull_Lever_Redirect", X), X * 100 / 6 < 90. 
