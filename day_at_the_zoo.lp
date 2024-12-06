children(johan; mario; kerry; lani; naomi).
animal(tiger; chimp; giraffe; lion; zebra).
baloon(hearts; stripes; swirls; rainbow; dots).
boy(johan;mario).
girl(kerry; lani; naomi).
order(1..5).

1{child_order(O, C) : children(C) }1 :- order(O).
:- child_order(O1,C1), child_order(O2,C2), O1!=O2, C1==C2.
1{child_animal(C, A): animal(A) }1 :- children(C).
:- child_animal(C1,A1), child_animal(C2,A2), C1!=C2, A1==A2.
1{child_baloon(C, B): baloon(B) }1 :- children(C).
:- child_baloon(C1,B1), child_baloon(C2,B2), C1!=C2, B1==B2.

%1. The girl whose favorite animals are the tigers (who isn't Naomi) was third in line. Her balloon did not have hearts or stripes.
first :- child_order(O, C), O==3, C!=naomi, child_animal(C,A), child_baloon(C,B), A==tiger, B!=hearts, B!=stripes, girl(C).
:- not first.
%2.	Johan (who was not last in line) was standing immediately behind a boy. Lani's favorite animals are neither the tigers nor the zebras.
second_a :- child_order(O, C), O!=5, C==johan, O!=1, child_order(O2, C2), O2 == O-1, C2=mario.
:- not second_a.
second_b :- child_animal(C, A), C==lani, A!=tiger, A!=zebra.
:- not second_b.
%3.	Neither Lani's nor Naomi's balloon was either the one with hearts or the one with stripes. The balloon with stripes wasn't Mario's.
third_a :- child_baloon(C, B), C==lani, B!=hearts, B!=stripes.
:- not third_a.
third_b :- child_baloon(C, B), C==naomi,B!=hearts, B!=stripes.
:- not third_b.
third_c :- child_baloon(C, B), C==mario, B!=stripes.
:- not third_c.
%4.	The one whose favorite animals are the zebras, who isn't the one who received the balloon with swirls, was fourth in line. The one who received the balloon with polka dots likes the lions the most. Johan isn't the one whose favorite animals are the giraffes.
fourth :- child_order(O, C), O==4, child_animal(C, A), A==zebra, child_baloon(C, B), B!=swirls.
:- not fourth.
fourth_b :- child_baloon(C, B), child_animal(C, A), B==dots, A==lion.
:- not fourth_b.
fourth_c :- child_animal(C, A), C==johan, A!=giraffe.
:- not fourth_c.

#show child_order/2.
#show child_animal/2.
#show child_baloon/2.