husband("Burke";"Eli";"Allen"; "David"; "Charles").
wife("Janet";"Freda";"Harriet";"Ingrid"; "Gloria").
surname("Nolan";"Langley";"Massey"; "Kilgore"; "O'Neal").
trauma("Wife Returned"; "Evil Twin"; "Amnesia"; "Ghost"; "Switched Baby").

1{couple(X,Y,S,T): wife(Y), surname(S), trauma(T)}1 :- husband(X).
1{couple(X,Y,S,T): husband(X), wife(Y), trauma(T)}1 :- surname(S).
1{couple(X,Y,S,T): husband(X), surname(S), trauma(T)}1 :- wife(Y).
1{couple(X,Y,S,T): husband(X), surname(S), wife(Y)}1 :- trauma(T).

:- not couple("Burke", _, _, "Wife Returned").
:- couple(_, "Janet", "Nolan", _).
:- not couple(_, "Janet", _, "Evil Twin").
:- couple(_, Y, "Langley", _), Y != "Harriet", Y!="Freda".
:- couple(_, Y, _, "Amnesia"), Y != "Harriet", Y!="Freda".
:- couple(_, _, "Langley", "Amnesia").
:- couple("Eli", _, "Massey", _).
:- not couple(_, _, "Massey", "Ghost").
:- couple("Eli", _, _, "Switched Baby").
:- couple("Allen", _, _, "Switched Baby").
:- couple("David", "Freda", _, _).
:- couple(_, "Ingrid", "Nolan", _).
:- not couple("Charles", _, "Kilgore", _).
:- couple(_, "Gloria", _, "Switched Baby").
:- not couple(_, "Gloria", "O'Neal", _).

#show couple/4.

%*
Answer: 1
couple("Burke","Gloria","O'Neal","Wife Returned") 
couple("Charles","Janet","Kilgore","Evil Twin") 
couple("Allen","Ingrid","Massey","Ghost") 
couple("Eli","Freda","Nolan","Amnesia") 
couple("David","Harriet","Langley","Switched Baby")
*%