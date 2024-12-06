husband("Max" ; "Lew"; "Wade"; "Harold"; "Andy").
wife("Joan"; "Rhonda"; "Emma"; "Velma"; "Claire").
surname("Platt"; "Summers"; "Reynolds"; "Burche"; "Oldham").
street("Laurel Lane"; "Jasper Road"; "Dogwood Street"; "Rosemont Drive"; "Nutley Circle").
day(1..5).

1{couple(X,Y,S,ST,D): wife(Y), surname(S), street(ST), day(D)}1 :- husband(X).
1{couple(X,Y,S,ST,D): husband(X), wife(Y), street(ST), day(D)}1 :- surname(S).
1{couple(X,Y,S,ST,D): husband(X), surname(S), wife(Y), day(D)}1 :- street(ST).
1{couple(X,Y,S,ST,D): husband(X), surname(S), street(ST), wife(Y)}1 :- day(D).
1{couple(X,Y,S,ST,D): husband(X), surname(S), street(ST), day(D)}1 :- wife(Y).


:- couple("Lew", "Joan", _,_,_).
:- couple("Lew", _, "Platt",_,_).
:- couple("Lew", _, _, "Laurel Lane", _).
:- couple("Lew", _, _, _, 5).
:- couple(_, "Joan", "Platt",_,_).
:- couple(_, "Joan", _, "Laurel Lane", _).
:- couple(_, "Joan", _, _, 5).
:- couple(_, _, "Platt", "Laurel Lane", _).
:- couple(_, _, "Platt", _, 5).
:- couple(_, _, _, "Laurel Lane", 5).

%2
:- couple("Wade", "Joan", _, _, _).
:- couple("Wade",_, _, "Jasper Road", _).
:- couple(_,_, "Summers", "Jasper Road", _).
:- couple("Wade", _, "Summers", _, _).

%3
:- couple("Harold", _, _, "Dogwood Street", _).
:- couple("Harold", _, "Reynolds", _, _).

%4
:- couple(_, _, _, "Rosemont Drive", D1), couple(_, "Joan", _, _, D2), D2 <= D1.
:- couple(_, _, _, "Rosemont Drive", D1), couple("Andy", _, _, _, D2), D1 <= D2.

%5
:- couple(_, "Emma", "Burche", _, _).
:- couple(_, _, "Burche", _, D1), couple("Wade", _, _, _, D2), D2 <= D1.
:- couple(_, _, "Burche", _, D1), couple(_, _, _, "Dogwood Street", D2), D1 <= D2.

%6
:- couple(_, "Velma", _, _, D1), couple(_, _, _, "Nutley Circle", D2), D1 <= D2.

%7
:- couple(_, _, "Oldham", "Jasper Road", _).

%8
:- couple("Andy", _, "Platt", _, _).
:- couple(_,"Claire", "Platt", _, _).
%is this required?
:- couple("Andy", "Claire", _, _, _).

:- couple(_, "Claire", "Summers", _, _).
#show couple/5.

%*
Answer: 1
couple("Harold","Joan","Summers","Nutley Circle",4) couple("Max","Velma","Reynolds","Jasper Road",5) couple("Lew","Claire","Oldham","Dogwood Street",1) couple("Wade","Emma","Platt","Rosemont Drive",3) couple("Andy","Rhonda","Burche","Laurel Lane",2)
SATISFIABLE

Models       : 1
Calls        : 1
Time         : 0.067s (Solving: 0.04s 1st Model: 0.02s Unsat: 0.02s)
CPU Time     : 0.031s
*%