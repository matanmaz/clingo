
1{choice("Pull_Lever_Redirect"; "Do_Nothing")}1.

person(1..6).

%making each one worth their number
net_worth(P, P) :- person(P).

survivor(1..5) :- choice("Pull_Lever_Redirect").
survivor(6) :- choice("Do_Nothing").

#maximize { NW, P : survivor(P), net_worth(P, NW)}.