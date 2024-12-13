point_of_entry("Open Door";"Window";"Garage Door";"Door Opener Code";"Access Garage";"Passage Door";"Penetrate House";"Other methods").
method_ability("Open Door","Break Down",10).
method_ability("Open Door","Pick Lock",65).
method_ability("Open Door","Steal Key",70).
method_ability("Window","Break Glass",2).
method_ability("Window","Cut Glass",40).
method_ability("Garage Door","Brute Force", 45).
method_ability("Door Opener Code","Eavesdrop",70).
method_ability("Door Opener Code","Steal from car",5).
method_ability("Access Garage","Cut hole in wall or roof",45).
method_ability("Passage Door","Break down passage door",10).
method_ability("Passage Door","Pick lock",65).
method_ability("Passage Door","Steal Key",70).
method_ability("Penetrate House","Cut hole in wall",45).
method_ability("Other methods","Cut hole in wall or roof",45).
method_ability("Other methods","Chimney",98).
method_ability("Other methods","Tunnel through floor",60).
method_ability("Other methods","Social Engineering",40).
default(99999).

1{rational_point(X,Y,Z):method_ability(X,Y,Z)}1.
#minimize{C:rational_point(_,_,C)}.