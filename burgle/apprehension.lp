point_of_entry("Open Door";"Window";"Garage Door";"Door Opener Code";"Access Garage";"Passage Door";"Penetrate House";"Other methods").
method_apprehension("Open Door","Break Down","0.3").
method_apprehension("Open Door","Pick Lock","0.15").
method_apprehension("Open Door","Steal Key","0.2").
method_apprehension("Window","Break Glass","0.3").
method_apprehension("Window","Cut Glass","0.2").
method_apprehension("Garage Door","Brute Force", "0.6").
method_apprehension("Door Opener Code","Eavesdrop","0.05").
method_apprehension("Door Opener Code","Steal from car","0.2").
method_apprehension("Access Garage","Cut hole in wall or roof","0.6").
method_apprehension("Passage Door","Break down passage door","0.1").
method_apprehension("Passage Door","Pick lock","0.15").
method_apprehension("Passage Door","Steal Key","0.2").
method_apprehension("Penetrate House","Cut hole in wall","0.2").
method_apprehension("Other methods","Cut hole in wall or roof","0.6").
method_apprehension("Other methods","Chimney","0.01").
method_apprehension("Other methods","Tunnel through floor","0.2").
method_apprehension("Other methods","Social Engineering","0.85").
default("0.0").

1{rational_point(X,Y,Z):method_apprehension(X,Y,Z)}1.
@minimum_float{C:rational_point(_,_,C)}.