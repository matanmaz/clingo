talk(1..5).
first_name(tom;laura;ed;christa;samuel).
last_name(jones;gray;howe;flynn;ives).
topic(big_bang;pulsars;black_holes;stellar;quasars).
man(tom;ed;samuel).
woman(laura;christa).
num_attendance(1..24).
5{attendance(A):num_attendance(A)}5.

1{of(O,F): talk(O)}1 :- first_name(F).
1{of(O,F): first_name(F)}1 :- talk(O).

1{ol(O,L): talk(O)}1 :- last_name(L).
1{ol(O,L): last_name(L)}1 :- talk(O).

1{ot(O,T): talk(O)}1 :- topic(T).
1{ot(O,T): topic(T)}1 :- talk(O).

1{oa(O,A): talk(O)}1 :- attendance(A).
1{oa(O,A): attendance(A)}1 :- talk(O).


%1.The first talk of the day was on the big bang theory.
:- not ot(1, big_bang).
%2.Laura drew 24 listeners, more than any other speaker.
:- of(O, laura), not oa(O, 24).
%3.No two men spoke consecutively.
:- of(A1, B1), of(A2, B2), man(B1), man(B2), |A1-A2|==1.
%4.As many people attended the talk on pulsars as attended both the third speech and Gray's talk combined.
:- ol(3, gray).
:- ot(O1, pulsars), oa(O1, E1), oa(3, E2), ol(O3, gray), oa(O3, E3), E1!=E2+E3.
%5.Howe's talk was attended by twice as many people as Ed's.
:- ol(O1, howe), oa(O1, E1), of(O2, ed), oa(O2, E2), E1!=E2*2.
%6.The last two speakers drew (not necessarily respectively) the largest and smallest numbers of attendees.
:- oa(4, E1), oa(5, E3), oa(A, E2), A<4, { E1 < E2 : E2 < E3; E1 > E2 : E2 > E3 }!=1. 
%7.The talk about black holes drew half as many listeners as the second speech.
:- ot(O1, black_holes), oa(O1, E1), oa(2, E2), E1*2!=E2.
%8.The talk on stellar evolution (which wasn't the one given by Christa Flynn) didn't draw the fewest attendees of the day.
:- not of(O1, christa), ol(O1, flynn).
:- of(O1, christa), ol(O1, stellar).
rule(8) :- ot(O1, stellar), oa(O1, E1), oa(_, E2), E1>E2.
:- not rule(8).
%9.The number of people who attended Samuel's talk was as much less than the number who attended the talk on quasars
% as it was more than the number who attended Ives's talk.
:- of(O1, samuel), oa(O1, E1), ot(O2, quasars), oa(O2, E2), ol(O3, ives), oa(O3, E3), E2>E1, E1>E3, E2-E1!=E1-E3.

%10.A different number of people attended each talk.
:- oa(O1, A1), oa(O2, A2), O1!=O2, A1==A2.
result(A, B, C, D, E) :- of(A, B), ol(A, C), ot(A,D), oa(A, E).

#show result/5.

%with version 1
%*
result(1,ed,ives,big_bang,12) 
result(5,tom,jones,quasars,2) 
result(3,samuel,gray,black_holes,7) 
result(2,christa,flynn,pulsars,14) 
result(4,laura,howe,stellar,24)

version 2
result(1,ed,jones,big_bang,12) 
result(2,christa,flynn,quasars,2) 
result(3,samuel,ives,stellar,23)
result(4,laura,howe,pulsars,24)
result(5,tom,gray,black_holes,1)
*%
