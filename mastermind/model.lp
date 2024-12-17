color(1..6).
index(1..4).
1{guess(I, C): color(C)}1 :- index(I).

%solution that provides the max number of unique feedback

1{goal(I, C): color(C)}1 :- index(I).

feedback_type(black, white, none).
feedback(I, black) :- goal(I, C), guess(I, C).
feedback(I, white) :- goal(I2, C), guess(I, C), index(I2), I!=I2, not goal(I, C).
feedback(I, none) :- not goal(_, C), guess(I, C).