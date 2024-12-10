%left is 1, right is 12
throne_id(1..12).
male("Apollo"; "Ares"; "Dionysus"; "Hephaestus"; "Hermes"; "Poseidon"; "Zeus").
female("Aphrodite"; "Artemis"; "Athena"; "Demeter"; "Hera").
male_sphere("messenger";"fire"; "harvest"; "hunt"; "light"; "sea"; "wine").
female_sphere("love"; "marriage"; "sky"; "war"; "wisdom").
dad("Cronus"; "Zeus"; "N/A").
mom("Rhea"; "Leto"; "Maia"; "Semele"; "Zeus wife"; "N/A").
gen(old, young).
god(X) :- male(X).
god(X) :- female(X).
1{zeus_wife(X):female(X)}1.
1{throne(X, Y): god(Y) }1 :- throne_id(X).
1{throne(X, Y):  throne_id(X)}1 :- god(Y).
next(X,Y):- throne_id(X), throne_id(Y), |X-Y|==1.
1{god_sphere(X, Y): male(X) }1 :- male_sphere(Y).
1{god_sphere(X, Y): male_sphere(Y) }1 :- male(X).
1{god_sphere(X, Y): female(X) }1 :- female_sphere(Y).
1{god_sphere(X, Y): female_sphere(Y) }1 :- female(X).
sphere(X) :- male_sphere(X).
sphere(X) :- female_sphere(X).
1{god_sphere(X, Y): sphere(Y) }1 :- god(X).
throne_sphere(X, S) :- throne(X, G), god_sphere(G, S).

%1.There were two generations of immortals represented in the throne room. Four of the immortals were of the older generation; all four were children of Cronus and Rhea.
4{god_gen(X,old):god(X)}4.
god_dad(X, "Cronus") :- god_gen(X, old).
god_mom(X, "Rhea") :- god_gen(X, old).
:- not god_gen("Zeus", old).

%2.The other eight were of the younger generation. 
%Of these, one had no parents, as she was born from the foam of the sea;
% another was born from the head of Zeus and so had a father but no mother.
8{god_gen(X,young):god(X)}8.
:- god_gen(X, young), god_gen(X, old).
1{god_gen(X, young): female(X), god_dad(X, "N/A"), god_mom(X, "N/A")}.
1{god_dad(X,Y): dad(Y)}1 :- god(X).
1{god_mom(X,Y): mom(Y)}1 :- god(X).
1{god_gen(X, young): god_dad(X, "Zeus"), god_mom(X, "N/A")}.

%3.The remaining six were born more or less in the usual fashion. 
%All six were children of Zeus, 
%but not all six had the same mother. 
%Each was the child either of Zeus's wife (who was one of the goddesses in the throne room) 
%or of one of three mortal women: Leto, Maia, and Semele.
7{god_gen(X, young): god_dad(X, "Zeus") }7.
6{god_gen(X, young): god_mom(X, "Zeus wife");god_gen(X, young): god_mom(X, "Leto");god_gen(X, young): god_mom(X, "Maia");god_gen(X, young): god_mom(X, "Semele") }6.
1{god_mom(X, "Semele"): god(X)}.
%4.The two centermost thrones belonged to Zeus and his wife, 
%in one order or the other; on the other side of Zeus sat a brother of his.
1{ throne(6, "Zeus"); throne(7, "Zeus")}1.
1{ throne(6, X): zeus_wife(X); throne(7, X): zeus_wife(X)}1.
%what does it mean that they are brothers? all older gens are siblings so it means they are also older gen
1{ throne(X, Y): throne(X2, "Zeus"), next(X, X2), male(Y), god_gen(Y, old)}1.

%5.There was exactly one pair of twins among the twelve immortals; 
%they occupied adjacent thrones, but on the opposite side of Zeus from the god of light.
%twins means younger gen and share the same parents?
1{ twins(G1, G2): god_gen(G1, young), god_gen(G2, young), god_dad(G1, D), god_dad(G2, D), god_mom(G1, M), god_mom(G2, M), G1!=G2 }1.
:- twins(G1, G2), throne(X1, G1), throne(X2, G2), not next(X1,X2).
:- god_sphere(G1, "light"), throne(X1, G1), throne(X2, "Zeus"), twins(G3, _), throne(X3, G3), X1 < X2, X3 < X2.
:- god_sphere(G1, "light"), throne(X1, G1), throne(X2, "Zeus"), twins(G3, _), throne(X3, G3), X1 > X2, X3 > X2.
:- god_sphere("Zeus", "light").

%6.The goddess of war and Poseidon's mother were both members of the older generation.
:- god_sphere(G1, "war"), not god_gen(G1, old).
:- not god_gen("Poseidon", young).
:- not god_mom("Poseidon", "Zeus wife").
:- not god_gen(G, old), zeus_wife(G).
:- god_sphere(G, "war"), zeus_wife(G).

%7.The god of fire wasn't Zeus.
:- god_sphere("Zeus", "fire").

%8.The god of the harvest didn't sit immediately to the right of Hera.
:- god_sphere(G1, "harvest"), throne(X1, G1), throne(X1-1, "Hera").

%9.The eight members of the younger generation of immortals, in order of their thrones from left to right, were: 
%9.1 the messenger god (whose mother wasn't Zeus's wife), 
:- god_sphere(G1, "messenger"), god_mom(G1, "Zeus wife").
:- god_sphere(G1, "messenger"), not god_gen(G1, young).
%9.2 the god of wine, 
:- throne_sphere(X1, "messenger"), throne_sphere(X2, "wine"), X2 < X1.
:- god_sphere(G2, "wine"), not god_gen(G2, young).
%9.3 the goddess born from the foam of the sea (who wasn't the goddess of marriage), 
:- throne_sphere(X2, "wine"), god_dad(G3, "N/A"), throne(X3, G3), X3 < X2.
:- god_dad(G3, "N/A"), god_sphere(G3, "marriage").
%9.4 an unmarried son of Zeus and his wife, 
1{throne(X4, G4): not athena_husband(G4), god_mom(G4, "Zeus wife"), male(G4), throne_id(X4), god_dad(G5, "Zeus"), god_mom(G5, "N/A"), throne(X5, G5), X4 < X5, god_dad(G3, "N/A"), throne(X3, G3), X3 < X4}.
%9.5 the goddess with only one parent, 
:- god_dad(G3, "N/A"), throne(X3, G3), god_dad(G5, "Zeus"), god_mom(G5, "N/A"), throne(X5, G5), X5 < X3.
%9.6 a twin who was Maia's son, 
twin(X) :- twins(X, _).
twin(X) :- twins(_, X).
:- twin(G), not god_mom(G, "Maia").
1{throne(X6, G6): throne_id(X6), male(G6), twin(G6), god_dad(G5, "Zeus"), god_mom(G5, "N/A"), throne(X5, G5), X5 < X6}1.
%9.7 the goddess of wisdom, 
1{god_sphere(G7, "wisdom") : female(G7), twin(G7), twin(G6), throne(X6, G6), throne(X7, G7) , X6 < X7}1.
%9.8 and Hermes.
:- not god_gen("Hermes", young).
:- throne_sphere(X7, "wisdom"), throne(X8, "Hermes"), X8 < X7.

%10.Aphrodite, who sat just three thrones from Athena, wasn't goddess of marriage or of love.
:- god_sphere("Aphrodite","marriage").
:- god_sphere("Aphrodite","love").
:- throne(X1, "Aphrodite"), throne(X2, "Athena"), |X1-X2|!=3.

%11.The god of the hunt, whose mother was Leto, sat at one end of the row of thrones.
end(1;12).
:- god_sphere(G, "hunt"), not god_mom(G, "Leto").
:- throne_sphere(X, "hunt"), not end(X).

%12.Demeter, who was the goddess of the sky and a daughter of Cronus and Rhea,
% sat somewhere to the right of the goddess of war.
:- not god_sphere("Demeter", "sky").
:- not god_gen("Demeter", old).
:- throne_sphere(X1, "war"), throne(X2, "Demeter"), X2 < X1.

%13.One of the gods of the younger generation (who wasn't named Hephaestus) was husband of Athena; he had the same father and mother as Poseidon.
1{athena_husband(G): G!="Hephaestus", G!="Poseidon", male(G), god_mom(G, "Zeus wife")}1.

%14.Dionysus and Apollo were from different generations; the younger of the two was the god of the harvest.
:- god_gen("Dionysus", G), god_gen("Apollo", G).
younger(young).
1{god_sphere(G, "harvest"): G=="Dionysus", god_gen(G, G1), younger(G1);god_sphere(G, "harvest"):G=="Apollo", god_gen(G, G1), younger(G1)}1.

%15.The goddess of marriage didn't sit next to Dionysus.
:- throne_sphere(X1, "marriage"), throne(X2, "Dionysus"), next(X1,X2).

result(T, S, X, A, Y, Z) :- god(X), throne_id(T), throne(T, X), god_gen(X, A), god_dad(X, Y), god_mom(X, Z), god_sphere(X, S).