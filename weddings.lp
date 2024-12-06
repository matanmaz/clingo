%*
1.	Either Clara or Dorinda became Mrs. Harley.
2.	Dale's name is either Darley or Farley; Primrose was either Miss Wicks or Miss Dicks.
3.	Either Sandra or Miss Dicks married Reuben Marley; neither of them became Mrs. Darley.
4.	Marilyn was either Miss Rix or Miss Wicks, and she married neither Joel nor Mr. Darley.
5.	Neither Benny nor Clyde is Mr. Barley, who married either Marilyn or Primrose.
6.	Benny married either Miss Dicks or Miss Hicks; Clara was either Miss Rix or Dale's bride.
7.	Miss Nix married either Joel or Reuben.
8.	Dorinda married neither Dale nor Clyde; her maiden name was either Dicks or Rix.
*%


miss(clara; dorinda; primrose; sandra; marilyn).
mister(dale; reuben; benny; clyde; joel).
maiden_last(wicks; dicks; rix; nix; hicks).
married_last(harley; darley; farley; marley; barley).

1{maiden(F,L) : miss(F)}1 :- maiden_last(L).
1{maiden(F,L) : maiden_last(L) }1 :- miss(F).

1{married(F,L) : miss(F)}1 :- married_last(L).
1{married(F,L) : married_last(L) }1 :- miss(F).

1{full_name(F,L): married_last(L) }1 :- mister(F).
1{full_name(F,L): mister(F) }1 :- married_last(L).

%1
1{ married(clara, harley); married(dorinda, harley) }1.

%2
1{full_name(dale, darley) ; full_name(dale, farley)}1.
1{ maiden(primrose, wicks) ; maiden(primrose, dicks) }1.

%3
1{ full_name(reuben, marley) }1.

:- not married(sandra, marley), maiden(F, dicks), not married(F, marley).

:- married(sandra, darley).
:- maiden(F, dicks), married(F, darley).

%4
1{ maiden(marilyn, rix) ; maiden(marilyn, wicks) }1.
:- married(marilyn, L), full_name(joel, L2), {L==L2; L==darley}>0.

%5
:- { full_name(benny, barley); full_name(clyde, barley)}>0.
1{ married(marilyn, barley) ; married(primrose, barley) }1.

%6
:- full_name(benny, L), maiden(M1, dicks), maiden(M2, hicks), { married(M1, L) ; married(M2, L) } == 0.
:- not maiden(clara,rix), full_name(dale, L), not married(clara, L).
%7
:- maiden(F, nix), full_name(joel, L1), full_name(reuben, L2), not married(F, L1), not married(F, L2).

%8
1{ maiden(dorinda, dicks); maiden(dorinda, rix) }1.
:- married(dorinda, L), full_name(dale, L).
:- married(dorinda, L), full_name(clyde, L).


#show maiden/2.
#show married/2.
#show full_name/2.
%#show first/1.

%*
married(dorinda,harley) full_name(clyde,farley) full_name(dale,darley) maiden(sandra,nix) married(clara,darley) married(marilyn,farley) married(sandra,marley) full_name(joel,barley) married(primrose,barley) full_name(reuben,marley) maiden(clara,hicks) maiden(dorinda,dicks) full_name(benny,harley) maiden(primrose,wicks) maiden(marilyn,rix)
*%