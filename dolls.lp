female("Annabelle";"Ashley";"Holly";"Jessica";"Kirsty";"Michelle";"Paige";"Staci";"Tanya";"Tiffany").
male("Benji";"Chad";"Damon";"Darren";"Enrique";"Jamie";"Joshua";"Juan";"Keenan"; "Quentin").

doll(X) :- female(X).
doll(X) :- male(X).

color(pink;red;gold;green;purple;blue;silver;yellow).

5{dressed(X, pink): female(X) }5.
2{dressed(X, red): female(X) }2.
1{dressed(X, gold): female(X) }1.
1{dressed(X, green): female(X) }1.
1{dressed(X, purple): female(X) }1.
5{dressed(X, blue): male(X) }5.
2{dressed(X, red): male(X) }2.
1{dressed(X, silver): male(X) }1.
1{dressed(X, green): male(X) }1.
1{dressed(X, yellow): male(X) }1.
1{dressed(X, C):color(C)}1 :- doll(X).
row_a(10..19).
row_b(30..39).
slot(X):- row_a(X).
slot(X):- row_b(X).
end(10;19;30;39).
across(A,B) :- slot(A), slot(B), |A-B|==20.
1{placed(X, SLOT): doll(X)}1 :- slot(SLOT).
1{placed(X, SLOT): slot(SLOT)}1 :- doll(X).
next(A,B) :- slot(A), slot(B), |A-B|==1.
slot_color(S, C) :- placed(X, S), dressed(X, C).
:- slot_color(S1, C1), slot_color(S2, C2), S1==S2, C1!=C2.
male_slot(S) :- placed(X, S), male(X).
female_slot(S) :- placed(X, S), female(X).

%1.No doll wearing pink is next to another doll wearing pink and no doll wearing blue is next to another wearing blue.
:- slot_color(S1, pink), slot_color(S2, pink), next(S1, S2).
:- slot_color(S1, blue), slot_color(S2, blue), next(S1, S2).

%2.Female dolls are at each end of a row, only one of those females has another female next to her.
:- end(S), placed(X, S), not female(X).
1{placed(A, S): doll(A), end(S), placed(A2, S2), next(S,S2), female(A2)}1.

%3.The five dolls with pink outfits are (in some order): Tiffany, 
%two females across from each other (one between two males and the other between two females, in some order), 
%the doll next to Keenan and the doll across from the female in green.
:- not dressed("Tiffany", pink).

1{slot_color(S1, pink) : not placed("Tiffany", S1), across(S1, S2), slot_color(S2, pink), next(S1, S3), next(S1, S4), S3!=S4, placed(A3, S3), male(A3), placed(A4, S4), male(A4)}1.
1{slot_color(S1, pink) : not placed("Tiffany", S1), across(S1, S2), slot_color(S2, pink), next(S1, S3), next(S1, S4), S3!=S4, placed(A3, S3), female(A3), placed(A4, S4), female(A4)}1.

1{slot_color(S1, pink) : placed("Keenan", S2), next(S1, S2), not placed("Tiffany", S1) }1.

%4.The dolls with blue outfits are (in some order): 
%two males who are across from each other (each next to a female in a pink outfit who are at the end of a row), 
2{slot_color(S1, blue): not placed("Quentin", S1), across(S1, S2), slot_color(S2, blue), next(S1, S3), end(S3), slot_color(S3, pink) }2. 

%Quentin, 
:- not dressed("Quentin", blue).

%the doll across from Paige 
1{slot_color(S1, blue): not placed("Quentin", S1), across(S1, S2), placed("Paige", S2)}1.

%and the doll between Annabelle and Enrique (who is wearing red).
:- not dressed("Enrique", red).
1{slot_color(S1, blue): not placed("Quentin", S1), next(S1, S2), next(S1,S3), S2!=S3, placed("Annabelle", S2), placed("Enrique", S3)}1.

%5.The six males in row A are (in some order): the three males next to each other, 
%two males next to each other (dressed in green and red, in some order and flanked by the female in gold and Holly, in some order), 
%and the only male not to have another male next to him.

%these aren't necessary but maybe help performance?
:- slot_color(S, green), row_b(S), male_slot(S).
%only females are gold
:- slot_color(S, gold), not row_a(S).
%these are necessary:
1{ placed(A1, S1): male(A1), row_a(S1), next(S1,S2), next(S1,S3), S2!=S3, male_slot(S2), male_slot(S3)}1.

:- dressed("Holly", gold).
:- placed("Holly", S), not row_a(S).
%1{ slot_color(S1, green): male_slot(S1), next(S1, S2), placed("Holly", S2), next(S1, S3), slot_color(S3, red), male_slot(S3); 
%    slot_color(S1, red): slot_color(S1, red), male_slot(S1), next(S1, S2), placed("Holly", S2)}1.
%1{ slot_color(S1, green): male_slot(S1), next(S1, S2), slot_color(S2, gold), next(S1, S3), slot_color(S3, red), male_slot(S3); 
%    slot_color(S1, red): slot_color(S1, red), male_slot(S1), next(S1, S2),  slot_color(S2, gold)}1.
1{ slot_color(S1, green): male_slot(S1), next(S1, S2), placed("Holly", S2), next(S1, S3), slot_color(S3, red), male_slot(S3) }1.
1{ slot_color(S1, red): slot_color(S1, red), male_slot(S1), next(S1, S2),  slot_color(S2, gold)}1.
1{ slot_color(S1, green): male_slot(S1), next(S1, S2), slot_color(S2, red), male_slot(S2) }1.
1{ male_slot(S1): row_a(S1), next(S1, S2), female_slot(S2), next(S1, S3), S2!=S3, female_slot(S3)}1.
%the above also ensure only 6 males because there's no more spots

%6.The four dolls in red are: Juan, the male across from Juan, the female next to that male and Paige.
:- not dressed("Paige", red).
:- not dressed("Juan", red).
1{ slot_color(S1, red): male_slot(S1), across(S1, S2), placed("Juan", S2) }1.
1{ slot_color(S1, red): female_slot(S1), next(S1, S2), not placed("Juan", S2), not placed("Paige", S1), slot_color(S2, red), male_slot(S2) }1.
:- placed("Paige", S1), next(S1, S2), male_slot(S2), slot_color(S2, red), not placed("Juan", S2).
%7.The two dolls in green are a male and female next to each other in row A.
:- not dressed("Holly", green).
%already satisfied from above

%8.Darren is dressed in yellow and he is across from the male dressed in silver.
:- not dressed("Darren", yellow).
:- placed("Darren", S1), across(S1, S2), not slot_color(S2, silver).

%9.Jessica (who is not next to Staci) and Ashley are at the left and right ends of row B, respectively, and wear the same color outfit.
:- placed("Jessica", S1), next(S1, S2), placed("Staci", S2).
:- not placed("Jessica",30).
:- not placed("Ashley",39).
:- dressed("Jessica", C), not dressed("Ashley", C).
%10.Jamie is flanked by Kirsty (with Tanya across from her) and Benji, in some order.
:- placed("Kirsty", S1), across(S1, S2), not placed("Tanya", S2).
1{ placed("Jamie", S1): next(S1, S2), placed("Kirsty", S2), next(S1, S3), placed("Benji", S3) }1.
%11.Michelle and Joshua are across from each other and Chad is not wearing blue.
:- placed("Michelle", S1), across(S1, S2), not placed("Joshua", S2).
:- dressed("Chad", blue).

result(S, A, B) :- slot_color(S, B), placed(A, S).
%#show result/3.
%*
 - ['10', 'Tiffany', 'pink']
 - ['11', 'Damon', 'blue']
 - ['12', 'Benji', 'silver']
 - ['13', 'Jamie', 'blue']
 - ['14', 'Kirsty', 'pink']
 - ['15', 'Quentin', 'blue']
 - ['16', 'Michelle', 'gold']
 - ['17', 'Juan', 'red']
 - ['18', 'Chad', 'green']
 - ['19', 'Holly', 'green']
 - ['30', 'Jessica', 'pink']
 - ['31', 'Keenan', 'blue']
 - ['32', 'Darren', 'yellow']
 - ['33', 'Paige', 'red']
 - ['34', 'Tanya', 'pink']
 - ['35', 'Annabelle', 'purple']
 - ['36', 'Joshua', 'blue']
 - ['37', 'Enrique', 'red']
 - ['38', 'Staci', 'red']
 - ['39', 'Ashley', 'pink']
 *%