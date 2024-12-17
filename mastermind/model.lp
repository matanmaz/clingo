color(1..6).
index(1..4).
1{guess(I, C): color(C)}1 :- index(I).

%solution that provides the max number of unique feedback
full_guess(C1, C2, C3, C4) :- guess(1, C1), guess(2, C2), guess(3, C3), guess(4, C4).
goal(C1, C2, C3, C4) :- color(C1), color(C2), color(C3), color(C4).

feedback_type(black, white, none).
