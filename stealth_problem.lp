#include "stealth_domain.lp".

#const jammerStartEnergy = 30.
#const maxStates = 10.
#const numVehicles = 5.

vehicle(1..numVehicles).
states(1..maxStates).
%country risk and country safe
country(country_risk; country_safe).
1{near(A, B): country(A), A!=B}1 :- country(B).
goal_state(S) :- not location(S, _, country_risk), jammerEnergy(S,E), E >= 0.
jammerEnergy(1, jammerStartEnergy).
:- not initial_state.
:- not goal_state(_).
#minimize { S: goal_state(S) }.

transit_time(1, 12).
transit_time(2, 8).
transit_time(3, 6).
transit_time(4, 3).
transit_time(5, 1).


#show fly/2.
%#show location/3.
#show jammerEnergy/2.
#show goal_state/1.