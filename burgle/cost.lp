point_of_entry("Open Door";"Window";"Garage Door";"Door Opener Code";"Access Garage";"Passage Door";"Penetrate House";"Other methods").
method_cost("Open Door","Break Down",25).
method_cost("Open Door","Pick Lock",250).
method_cost("Open Door","Steal Key",2).
method_cost("Window","Break Glass",1).
method_cost("Window","Cut Glass",5).
method_cost("Garage Door","Brute Force", (250)).
method_cost("Door Opener Code","Eavesdrop",5000).
method_cost("Door Opener Code","Steal from car",5).
method_cost("Access Garage","Cut hole in wall or roof",250).
method_cost("Passage Door","Break down passage door",25).
method_cost("Passage Door","Pick lock",250).
method_cost("Passage Door","Steal Key",2).
method_cost("Penetrate House","Cut hole in wall",1).
method_cost("Other methods","Cut hole in wall or roof",250).
method_cost("Other methods","Chimney",25).
method_cost("Other methods","Tunnel through floor",20000).
method_cost("Other methods","Social Engineering",50).
default(99999).

1{rational_point(X,Y,Z):method_cost(X,Y,Z)}1.
#minimize{C:rational_point(_,_,C)}.