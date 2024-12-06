
first(oscar;peter;ruth1;ruth2;shirley).
last(underwood;valdez;yorke;zaniewski;same_last).
novel(absalom;light_in_august;ship_of_fools;sun_also_rises;lighthouse).

male(oscar;peter).
female(ruth1;ruth2;shirley).
ruth(ruth1;ruth2).

faulkner(light_in_august;absalom).
light(light_in_august; lighthouse).

sibling(same_last).
2{sibling(X): last(X)}2.

1{result(X,Y,Z): last(Y), novel(Z)}1 :- first(X).
1{result(X,Y,Z): first(X), novel(Z)}1 :- last(Y).
1{result(X,Y,Z): first(X), last(Y)}1 :- novel(Z).

%1
:- result(shirley, L, _), sibling(L).

%2
:- male(X1), male(X2), result(X1, Y1, _), result(X2, Y2, _), sibling(Y1), sibling(Y2), X1!=X2.
:- male(X1), male(X2), result(X1, _, Z1), result(X2, _, Z2), faulkner(Z1), faulkner(Z2), X1!=X2.
:- male(X1), male(X2), result(X1, _, Z1), result(X2, _, Z2), not faulkner(Z1), not faulkner(Z2), X1!=X2.

%3
:- ruth(X), result(X, _, sun_also_rises).
:- result(_, Y, sun_also_rises), not sibling(Y).

%4
:- sibling(yorke).
:- result(_, yorke, Z), light(Z).

%5
:- sibling(valdez).
:- not female(X), result(X, underwood, _).

rule(5)  :- #count{AA:AA=A; BB:BB=B; CC:CC=C; DD:DD=D; EE:EE=E} == 5,
    A=oscar,
    first(B), result(B, underwood, _),
    first(C), result(C, valdez, _),
    first(D), result(D, _, lighthouse),
    first(E), E!=X, result(E, Y_E, Z_E), result(X, Y, absalom), { 
        ruth(E): ruth(X);
        sibling(Y_E):sibling(Y);
        Z_E == light_in_august
    } > 0.
:- not rule(5).

#show result/3.
#show sibling/1.

%*
Solving...
Answer: 1
result(shirley,zaniewski,lighthouse)
result(peter,valdez,light_in_august)
result(ruth2,underwood,absalom)
result(ruth1,yorke,ship_of_fools)
result(oscar,same_last,sun_also_rises) sibling(underwood)
*%