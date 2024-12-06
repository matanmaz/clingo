%all tired out
people(grace; lisa; marge; ethan; jeff).
women(grace;lisa;marge).
men(ethan;jeff).
service(chains; jack; shock; whitewall; wheel).
order(1..5).

1{po(P,O) : people(P)}1 :- order(O).
:- po(P1,O1), po(P2,O2), O1!=O2, P1==P2.
1{ps(P,S) : service(S)}1 :- people(P).
:- ps(P1,S1), ps(P2,S2), P1!=P2, S1==S2.

%1.	Three customers were Ethan, the third person in line, and the one who bought tire chains.
first :- po(P,O), O==3, P!=ethan, ps(P2,S), P2!=P, P2!=ethan, S==chains.
:- not first.

%2.	Lisa stood just behind the person who bought the jack.
second :- po(Lisa,O),po(Person,O2), Lisa==lisa, O == O2+1, ps(Person,S), S==jack.
:- not second.

%3.	The second person in line was a woman.
third :- po(Woman, 2), women(Woman).
:- not third.

%4.	The person who bought whitewall tires stood three places ahead of the one who requested a wheel alignment.
fourth :- po(P1,O1), po(P2,O2), O1+3 == O2, ps(P1,S1), ps(P2, S2), S1==whitewall, S2==wheel.
:- not fourth.

%5.	Marge wasn't the second of the three women in line.
fifth :- po(P1,O1), po(P2,O2), po(P3,O3), women(P1), women(P2), women(P3), O1>O2, O2>O3, P2!=marge.
:- not fifth.

%6.	Jeff was just ahead of the person who had shock absorbers installed.
sixth :- po(P1,O1), po(P2,O2), P1==jeff, O1+1==O2, ps(P2,S), S==shock.
:- not sixth.

%7.	Grace stood next to at least one man in line.
seventh :- po(P1,O1), po(G,OG),G==grace, men(P1), { O1+1==OG; OG+1==O1 }.
%:- not seventh.

#show po/2.
#show ps/2.
