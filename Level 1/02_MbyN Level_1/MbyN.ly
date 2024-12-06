%M
vehicleID(1..3).
%N
taskID(1..2).

0{vehicleEvent(VID, TID): taskID(TID)}1 :- vehicleID(VID).

#show.
%*
a.) Create a predicate in which all vehicles must be allocated to a task.
b.) Create a predicate in which only one vehicle can be allocated to each task.
c.) all tasks must be allocated?
d.) conditions a and b are true?
e.) conditions a and c are true?
f.) conditions b and c are true?
g.) conditions a, b, and c are true?
*%

%a
%:- vehicleID(VID), not vehicleEvent(VID,_).

%b
%:- vehicleEvent(VID1,TID1), vehicleEvent(VID2,TID1), VID1 != VID2.

%c
%:- taskID(TID), not vehicleEvent(_,TID).
