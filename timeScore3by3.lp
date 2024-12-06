%provide this for user

%score(PlayID, Score), assigned(Transition ID, Play ID, Vehicle ID)
score(1, 0) :- 0{assigned(1, 1, _)}0.
score(1, 40000) :- assigned(1, 1, 1), {assigned(1, 1, _)}=1.
score(1, 87293) :- assigned(1, 1, 2), {assigned(1, 1, _)}=1.
score(1, 47246) :- assigned(1, 1, 3), {assigned(1, 1, _)}=1.
score(1, 107668) :- assigned(1, 1, 1), assigned(1, 1, 2), {assigned(1, 1, _)}=2.
score(1, 84486) :- assigned(1, 1, 1), assigned(1, 1, 3), {assigned(1, 1, _)}=2.
score(1, 87293) :- assigned(1, 1, 2), assigned(1, 1, 3), {assigned(1, 1, _)}=2.
score(1, 107668) :- assigned(1, 1, 1), assigned(1, 1, 2), assigned(1, 1, 3), {assigned(1, 1, _)}=3.
score(2, 0) :- 0{assigned(1, 2, _)}0.
score(2, 81410) :- assigned(1, 2, 1), {assigned(1, 2, _)}=1.
score(2, 30000) :- assigned(1, 2, 2), {assigned(1, 2, _)}=1.
score(2, 56504) :- assigned(1, 2, 3), {assigned(1, 2, _)}=1.
score(2, 81410) :- assigned(1, 2, 1), assigned(1, 2, 2), {assigned(1, 2, _)}=2.
score(2, 97514) :- assigned(1, 2, 1), assigned(1, 2, 3), {assigned(1, 2, _)}=2.
score(2, 56504) :- assigned(1, 2, 2), assigned(1, 2, 3), {assigned(1, 2, _)}=2.
score(2, 97514) :- assigned(1, 2, 1), assigned(1, 2, 2), assigned(1, 2, 3), {assigned(1, 2, _)}=3.
score(3, 0) :- 0{assigned(1, 3, _)}0.
score(3, 24264) :- assigned(1, 3, 1), {assigned(1, 3, _)}=1.
score(3, 30479) :- assigned(1, 3, 2), {assigned(1, 3, _)}=1.
score(3, 15000) :- assigned(1, 3, 3), {assigned(1, 3, _)}=1.
score(3, 38964) :- assigned(1, 3, 1), assigned(1, 3, 2), {assigned(1, 3, _)}=2.
score(3, 33411) :- assigned(1, 3, 1), assigned(1, 3, 3), {assigned(1, 3, _)}=2.
score(3, 30479) :- assigned(1, 3, 2), assigned(1, 3, 3), {assigned(1, 3, _)}=2.
score(3, 38964) :- assigned(1, 3, 1), assigned(1, 3, 2), assigned(1, 3, 3), {assigned(1, 3, _)}=3.
