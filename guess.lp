%initiate all the traits
1{name(matthew; frank; raymond; lucus; adam; charlie; kevin; steven; david; brenda; petra; yvette; tasmin; denise; giselle; sophia; kathy; heidi)}1. 
%2
1{gender(male; female)}1.

%2
1{countenance(smile; frown)}1.


%2
1{age(old; young)}1.

%2
1{skin_color(light; dark)}1.
%2
1{nose_shape(small; large)}1.

%3
0{hair_type(straight; curly)}1.
%4
0{hair_color(brown; black; blond)}1. 
%2
1{face_shape(fat; thin)}1.

%2
{headgear(hat)}.
%4
0{facial_hair(mustache; beard)}2.
%2
{eyewear(glasses)}.

%my assertions
:- not countenance(smile).
:- not facial_hair(mustache).
:- not age(young).
:- not not facial_hair(beard).
:- not face_shape(fat).
:- not skin_color(light).

%character data

:- name(adam), not gender(male). 

:- name(adam), not age(old). 

:- name(adam), not skin_color(light). 

:- name(adam), not nose_shape(small). 

:- name(adam), not countenance(smile). 



:- name(adam), not hair_type(straight). 

:- name(adam), not hair_color(brown). 

:- name(adam), not face_shape(fat). 



:- name(adam), not headgear(hat). 

:- name(adam), not not facial_hair(_). 

:- name(adam), not not eyewear(glasses). 



:- name(tasmin), not gender(female). 

:- name(tasmin), not age(young). 

:- name(tasmin), not skin_color(light). 

:- name(tasmin), not nose_shape(small). 

:- name(tasmin), not countenance(smile). 

:- name(tasmin), not hair_type(straight). 

:- name(tasmin), not hair_color(blond). 

:- name(tasmin), not face_shape(thin). 

:- name(tasmin), not not headgear(hat). 

:- name(tasmin), not not facial_hair(_). 

:- name(tasmin), not not eyewear(glasses). 

 

:- name(charlie), not gender(male). 

:- name(charlie), not age(young). 

:- name(charlie), not skin_color(light). 

:- name(charlie), not nose_shape(large). 

:- name(charlie), not countenance(smile). 

:- name(charlie), not hair_type(curly). 

:- name(charlie), not hair_color(blond). 

:- name(charlie), not face_shape(fat). 

:- name(charlie), not not headgear(hat). 

:- name(charlie), not facial_hair(beard). 

:- name(charlie), not facial_hair(mustache). % *** enabled 

:- name(charlie), not eyewear(glasses). 

 

:- name(denise), not gender(female). 

:- name(denise), not age(young). 

:- name(denise), not skin_color(light). 

:- name(denise), not nose_shape(small). 

:- name(denise), not countenance(smile). 

:- name(denise), not hair_type(straight). 

:- name(denise), not hair_color(brown). 

:- name(denise), not face_shape(thin). 

:- name(denise), not not headgear(hat). 

:- name(denise), not not facial_hair(_). 

:- name(denise), not eyewear(glasses). 

 

:- name(giselle), not gender(female). 

:- name(giselle), not age(young). 

:- name(giselle), not skin_color(light). 

:- name(giselle), not nose_shape(large). 

:- name(giselle), not countenance(smile). 

:- name(giselle), not hair_type(curly). 

:- name(giselle), not hair_color(blond). 

:- name(giselle), not face_shape(fat). 

:- name(giselle), not not headgear(hat). 

:- name(giselle), not not facial_hair(_). 

:- name(giselle), not eyewear(glasses). 

 

:- name(kevin), not gender(male). 

:- name(kevin), not age(old). 

:- name(kevin), not skin_color(light). 

:- name(kevin), not nose_shape(large). 

:- name(kevin), not countenance(smile). 

:- name(kevin), not not hair_type(_). 

:- name(kevin), not not hair_color(_). 

:- name(kevin), not face_shape(fat). 

:- name(kevin), not not headgear(hat). 

:- name(kevin), not not facial_hair(_). 

:- name(kevin), not eyewear(glasses). 

 

:- name(sophia), not gender(female). 

:- name(sophia), not age(young). 

:- name(sophia), not skin_color(light). 

:- name(sophia), not nose_shape(small). 

:- name(sophia), not countenance(smile). 

:- name(sophia), not hair_type(curly). 

:- name(sophia), not hair_color(blond). 

:- name(sophia), not face_shape(thin). 

:- name(sophia), not headgear(hat). 

:- name(sophia), not not facial_hair(_). 

:- name(sophia), not not eyewear(glasses). 

 

:- name(steven), not gender(male). 

:- name(steven), not age(young). 

:- name(steven), not skin_color(light). 

:- name(steven), not nose_shape(small). 

:- name(steven), not countenance(smile). 

:- name(steven), not hair_type(straight). 

:- name(steven), not hair_color(blond). 

:- name(steven), not face_shape(fat). 

:- name(steven), not headgear(hat). 

:- name(steven), not not facial_hair(_). 

:- name(steven), not not eyewear(glasses). 

 

:- name(kathy), not gender(female). 

:- name(kathy), not age(young). 

:- name(kathy), not skin_color(light). 

:- name(kathy), not nose_shape(large). 

:- name(kathy), not countenance(smile). 

:- name(kathy), not hair_type(straight). 

:- name(kathy), not hair_color(brown). 

:- name(kathy), not face_shape(thin). 

:- name(kathy), not not headgear(hat). 

:- name(kathy), not not facial_hair(_). 

:- name(kathy), not not eyewear(glasses). 

 

:- name(matthew), not gender(male). 

:- name(matthew), not age(young). 

:- name(matthew), not skin_color(dark). 

:- name(matthew), not nose_shape(large). 

:- name(matthew), not countenance(smile). 

:- name(matthew), not hair_type(curly). 

:- name(matthew), not hair_color(brown). 

:- name(matthew), not face_shape(fat). 

:- name(matthew), not not headgear(hat). 

:- name(matthew), not not facial_hair(_). 

:- name(matthew), not not eyewear(glasses). 

 

:- name(frank), not gender(male). 

:- name(frank), not age(young). 

:- name(frank), not skin_color(dark). 

:- name(frank), not nose_shape(large). 

:- name(frank), not countenance(smile). 

:- name(frank), not not hair_type(_). 

:- name(frank), not not hair_color(_). 

:- name(frank), not face_shape(thin). 

:- name(frank), not not headgear(hat). 

:- name(frank), not not facial_hair(_). 

:- name(frank), not not eyewear(glasses). 

 

:- name(brenda), not gender(female). 

:- name(brenda), not age(old). 

:- name(brenda), not skin_color(light). 

:- name(brenda), not nose_shape(small). 

:- name(brenda), not countenance(smile). 

:- name(brenda), not hair_type(curly). 

:- name(brenda), not hair_color(black). 

:- name(brenda), not face_shape(fat). 

:- name(brenda), not not headgear(hat). 

:- name(brenda), not not facial_hair(_). 

:- name(brenda), not eyewear(glasses). 

 

:- name(raymond), not gender(male). 

:- name(raymond), not age(young). 

:- name(raymond), not skin_color(light). 

:- name(raymond), not nose_shape(large). 

:- name(raymond), not countenance(smile). 

:- name(raymond), not not hair_type(_). 

:- name(raymond), not not hair_color(_). 

:- name(raymond), not face_shape(fat). 

:- name(raymond), not not headgear(hat). 

:- name(raymond), not not facial_hair(beard). 

:- name(raymond), not facial_hair(mustache). 

:- name(raymond), not eyewear(glasses). 

 

:- name(petra), not gender(female). 

:- name(petra), not age(young). 

:- name(petra), not skin_color(light). 

:- name(petra), not nose_shape(small). 

:- name(petra), not countenance(smile). 

:- name(petra), not hair_type(curly). 

:- name(petra), not hair_color(black). 

:- name(petra), not face_shape(thin). 

:- name(petra), not headgear(hat). 

:- name(petra), not not facial_hair(_). 

:- name(petra), not not eyewear(glasses). 

 

:- name(lucus), not gender(male). 

:- name(lucus), not age(young). 

:- name(lucus), not skin_color(light). 

:- name(lucus), not nose_shape(large). 

:- name(lucus), not countenance(smile). 

:- name(lucus), not hair_type(curly). 

:- name(lucus), not hair_color(black). 

:- name(lucus), not face_shape(fat). 

:- name(lucus), not headgear(hat). 

:- name(lucus), not not facial_hair(_). 

:- name(lucus), not not eyewear(glasses). 

 

:- name(yvette), not gender(female). 

:- name(yvette), not age(young). 

:- name(yvette), not skin_color(dark). 

:- name(yvette), not nose_shape(large). 

:- name(yvette), not countenance(smile). 

:- name(yvette), not hair_type(straight). 

:- name(yvette), not hair_color(brown). 

:- name(yvette), not face_shape(fat). 

:- name(yvette), not not headgear(hat). 

:- name(yvette), not not facial_hair(_). 

:- name(yvette), not not eyewear(glasses). 

 

:- name(heidi), not gender(female). 

:- name(heidi), not age(old). 

:- name(heidi), not skin_color(light). 

:- name(heidi), not nose_shape(small). 

:- name(heidi), not countenance(smile). 

:- name(heidi), not hair_type(straight). 

:- name(heidi), not hair_color(brown). 

:- name(heidi), not face_shape(fat). 

:- name(heidi), not headgear(hat). 

:- name(heidi), not not facial_hair(_). 

:- name(heidi), not eyewear(glasses). 

 

:- name(david), not gender(male). 

:- name(david), not age(young). 

:- name(david), not skin_color(dark). 

:- name(david), not nose_shape(large). 

:- name(david), not countenance(smile). 

:- name(david), not hair_type(curly). 

:- name(david), not hair_color(black). 

:- name(david), not face_shape(fat). 

:- name(david), not not headgear(hat). 

:- name(david), not not facial_hair(beard). 

:- name(david), not facial_hair(mustache). 

:- name(david), not eyewear(glasses). 
