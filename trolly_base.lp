
1{choice("Pull_Lever_Redirect"; "Do_Nothing")}1.

person(1..6).

survivor(1..5) :- choice("Pull_Lever_Redirect").
survivor(6) :- choice("Do_Nothing").

#include "min_death.lp".