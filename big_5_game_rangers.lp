male("Ian";"Ethan";"Anton"; "Greg";"Colin").
female("Freda";"Bernadette";"Hilda";"Delia";"Julia").
last_name("Aarons";"Frank";"Bester";"Govender";"Chuene";"Hedges";"Dooby";"Ivanov";"Ebony";"Jackson").
animal("Buffalo";"Elephant";"Leopard";"Lion";"Rhino").
bird("Eagle";"Hornbill";"Owl";"Stork";"Vulture").

location(top,1,"A";top,2,"B";top,3,"C";top,4,"D";top,5,"E";bottom,1,"F";bottom,2,"G";bottom,3,"H";bottom,4,"I";bottom,5,"J").

1{ first_name(X) }1 :- male(X).
1{ first_name(X) }1 :- female(X).

1{ full_name(F, L): first_name(F) }1 :- last_name(L).
1{ full_name(F, L): last_name(L) }1 :- first_name(F).

1{ camp(X) }1 :- bird(X).
1{ camp(X) }1 :- animal(X).

1{ fc(F, C) : first_name(F) }1 :- camp(C).
1{ fc(F, C) : camp(C) }1 :- first_name(F).

1{ fl(F, L) : first_name(F) }1 :- location(_,_,L).
1{ fl(F, L) : location(_,_,L) }1 :- first_name(F).

%1. No person's first name, last name, or camp location starts with the same letter.
:- fl(F,C), @first_letter(F) == C.
:- full_name(F, L), @first_letter(F) == @first_letter(L). 
:- full_name(F, L), fl(F,C), @first_letter(L) == @first_letter(C). 

%2.The five female rangers are: Freda (who runs a "bird" camp), Ms Bester (who does not run the elephant camp), the one running the lion camp, the one at camp F, and Ms Chuene (who runs the eagle camp).
rule(2)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    A="Freda",
    full_name(B, "Bester"), female(B),
    fc(C, "Lion"), female(C),
    fl(D, "F"), female(D),
    full_name(E, "Chuene"), female(E).
:- not rule(2).
:- full_name(F, "Chuene"), not fc(F, "Eagle").
:- fc("Freda", C), not bird(C).
:- full_name(B, "Bester"), fc(B, "Elephant").

%3.The five male rangers are: the one running the rhino camp, the one at camp B, Mr. Ebony, Greg Ivanov, and the one running the stork camp (who is not Colin).
rule(3)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    fc(A, "Rhino"), male(A),
    fl(B, "B"), male(B),
    full_name(C, "Ebony"), male(C),
    D="Greg",
    male(E), E!="Colin", fc(E, "Stork").
full_name("Greg","Ivanov").
:- not rule(3).

%4.The five rangers who run the Big 5 animal camps are: Govender, the ranger at camp B, Mr. Dooby at camp G, Delia, and Ms Frank.
rule(4)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    full_name(F, "Govender"), fc(F, A), animal(A),
    fl(FB, "B"), fc(FB, B), animal(B),
    full_name(FC, "Dooby"), male(FC), fl(FC, "G"), fc(FC, C), animal(C),
    fc("Delia", D), animal(D),
    full_name(FE, "Frank"), female(FE), fc(FE, E), animal(E).
:- not rule(4).

%5.The five rangers who run the Big 5 bird camps are: Greg, Ms Aarons, Bernadette, the one running the stork camp, and the ranger at camp A.
:- fc("Greg", C), { not bird(C); C=="Stork"} > 0.
:- full_name(F, "Aarons"), not female(F).
:- full_name(F, "Aarons"), fc(F, C), { not bird(C); C=="Stork"} > 0.
:- fc("Bernadette", C), { not bird(C); C=="Stork"} > 0.
:- fl(F, "A"), fc(F, C), { not bird(C); C=="Stork"} > 0.

%6.The five rangers at camp A - E are: the ranger at camp A, the ranger at camp E, the ranger running the vulture camp,  
%Freda (who is not the ranger at camp C), and Ethan (who runs an animal camp).
:- fc("Ethan", CAMP), not animal(CAMP).
rule(6)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    A="A",E="E",
    location(top,_,C), fl(F,C), fc(F,"Vulture"),
    location(top,_,D), D!="C", fl("Freda",D),
    location(top,_,B), fl("Ethan",B).
:- not rule(6).


%7.The five rangers at camp F - J are: the ranger at camp F, the ranger at camp J, Delia (who does not run the lion camp), Anton, and Jackson (who does not run the rhino camp).
:- fc("Delia","Lion").
:- fc(F,"Rhino"),full_name(F, "Jackson").
rule(7)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    A="F",
    B="J",
    fl("Delia", C),
    fl("Anton", D),
    full_name(FE, "Jackson"), fl(FE,E).
:- not rule(7).

%8.Colin (who does not run the hornbill camp), Ethan (whose camp is not next to Ian), Bernadette, and Hilda's (whose camp is not next to Freda) camps are not next to a member of the opposite sex.
:- fc("Colin","Hornbill").
no_opposite("Colin";"Ethan";"Bernadette"; "Hilda").
:- first_name(NEIGHBOR), no_opposite(PERSON), fl(PERSON, L_P), fl(NEIGHBOR, L_N), 
    location(SIDE,I_P,L_P), location(SIDE, I_N, L_N), 
    | I_N - I_P | == 1, 
    #count{1:female(NEIGHBOR); 2:male(PERSON)}!=1.
:-  fl("Colin", L_P), fl("Ian", L_N), 
    location(SIDE,I_P,L_P), location(SIDE, I_N, L_N), 
    | I_N - I_P | == 1. 

:-  fl("Hilda", L_P), fl("Freda", L_N), 
    location(SIDE,I_P,L_P), location(SIDE, I_N, L_N), 
    | I_N - I_P | == 1.

%9.The owl and hornbill camps are run by rangers on the same side of the entrafce, but by rangers of opposite genders.
:- fc(A, "Owl"), fc(B, "Hornbill"), fl(A, L_A), fl(B, L_B),
    location(SIDE_A,_,A), location(SIDE_B,_,B), SIDE_A!=SIDE_B.
:- fc(A, "Owl"), fc(B, "Hornbill"), #count{1:female(A); 2:male(B)}==1.
%10.The elephant and buffalo camps are run by rangers of the same gender.
:- fc(A, "Elephant"), fc(B, "Buffalo"), #count{1:female(A); 2:male(B)}!=1.