color(1..6).
index(1..4).
1{guess(I, C): color(C)}1 :- index(I).

%solution that provides the max number of unique feedback
%*
goal_index(1..6**4).
full_guess(C1, C2, C3, C4) :- guess(1, C1), guess(2, C2), guess(3, C3), guess(4, C4).
goal(C1, C2, C3, C4) :- color(C1), color(C2), color(C3), color(C4).
1{igoal(I, C1, C2, C3, C4): goal(C1, C2, C3, C4)}1 :- goal_index(I).
1{igoal(I, C1, C2, C3, C4): goal_index(I)}1 :- goal(C1, C2, C3, C4).

feedback_type(black, white, none).
*%
{possible_goal(I, C)} :- color(C), index(I).
feedback_type(black; white; none).
feedback(I, black) :- possible_goal(I,C), guess(I,C). 
feedback(I, white) :- index(I), index(I2), I2!=I, possible_goal(I2,C), guess(I,C).
feedback(I, none) :- guess(I,C), possible_goal(1,C1), possible_goal(2,C2), possible_goal(3,C3), possible_goal(4,C4),
    C!=C1,C!=C2,C!=C3,C!=C4. 

:- possible_goal(_, 1).
num_feedback(C) :- C = #count { I,F:feedback(I,F)}.
#maximize{ C: num_feedback(C)}.