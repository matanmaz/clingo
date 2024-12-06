
evacuation_state(1..maxStates).

%:- evacuation_state(S), goal_state(G), S<=G.

numVehicles { evac_vehicle(S, V) : vehicle(V) }numVehicles :- evacuation_state(S).

1 { location(S, V, L) : country(L)} 1 :- evac_vehicle(S,V).

1 { jammer(S, L): country(L)} 1 :- evacuation_state(S).

1{ fly(S, V):  evac_vehicle(S, V), location(S, V, L), country(L), jammer(S, L)}2 :- evacuation_state(S), not goal_state(S).

jammer(S+1, L) :- jammer(S, O), near(L, O), evacuation_state(S+1).

location(S+1, V, O) :- fly(S, V), evacuation_state(S+1), location(S, V, L), near(L,O), not goal_state(S).

location(S+1, V, L) :- not fly(S,V), location(S, V, L), evacuation_state(S+1), not goal_state(S).

initial_state :- not location(1, _, country_safe), jammer(1, country_risk).

jammerEnergy(S+1, X-T1) :- { fly(S, _) } == 2, fly(S, V1), fly(S, V2), V1 != V2, transit_time(V1, T1), transit_time(V2, T2), T1 >= T2, jammerEnergy(S,X), evacuation_state(S+1), not goal_state(S).


jammerEnergy(S+1, X-T) :- { fly(S, _) } == 1, fly(S, V), transit_time(V, T), jammerEnergy(S,X), evacuation_state(S+1), not goal_state(S).


