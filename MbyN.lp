#const vehicles = 3.
#const plays = 3.
#const transitionSteps = plays.

%#include "timeScore3by3.lp".

transitionInstance(1..transitionSteps).
vehicleInstance(1..vehicles).
playInstance(1..plays).
vehicleID(1..vehicles).
playID(1..plays).

assignmentState(assigned; unassigned).

1{vehicleEvent(VID, TI, VI)}1 :- vehicleID(VID), transitionInstance(TI), vehicleInstance(VI).
%*
:- vehicleEvent(VID, _, VI), vehicleEvent(VID2, _, VI2), VID==VID2, VI != VI2.
:- vehicleEvent(VID, _, VI), vehicleEvent(VID2, _, VI2), VI==VI2, VID != VID2.

1{playEvent(PID, TI, PI):playID(PID)}1 :- transitionInstance(TI), playInstance(PI).
:- playEvent(PID, _, PI), playEvent(PID2, _, PI2), PID==PID2, PI != PI2.
:- playEvent(PID, _, PI), playEvent(PID2, _, PI2), PI==PI2, PID != PID2.
1{assignedEvent(VID,PID,TI,AS):assignmentState(AS)}1 :- vehicleID(VID), playID(PID), transitionInstance(TI).
:-assignedEvent(TI1,VI1,PI1,A1),assignedEvent(TI2,VI2,PI2,A2), TI1=TI2,VI1=VI2,PI1!=PI2,A1=assigned,A2=assigned.


assigned(TI,PID,VID) :- assignedEvent(VID,PID,TI,assigned), vehicleID(VID), playID(PID), transitionInstance(TI).

#maximize{ SCORE, PID : score(PID, SCORE), playID(PID)}.
*%