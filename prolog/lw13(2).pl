#!/usr/local/bin/swipl

door(a, b). 
door(b, c). 
door(b, e). 
door(c, d). 
door(d, h). 
door(e, d). 
door(e, j). 
door(e, f). 
door(f, h). 
door(f, i). 
door(i, j). 
door(i, k). 
door(j, g). 
door(j, l). 
door(k, l). 

windows(a, 0). 
windows(b, 1). 
windows(c, 1). 
windows(d, 0). 
windows(e, 0). 
windows(f, 1). 
windows(g, 0). 
windows(h, 3). 
windows(i, 1). 
windows(k, 2). 
windows(l, 1). 
windows(j, 1). 

path2Helper(to, to, _, []) :- !. 
  path2Helper(from, to, visited, ResultList) :- 
  (door(from, near); door(near, from)), 
  not(member(near, visited)), 
  path2Helper(near, to, [from, near|visited], TmpResult), 
  append([from], TmpResult, ResultList), !. 

path2(from, to, Path) :- 
  path2Helper(from, to, [], WithoutLast), 
  append(WithoutLast, [to], Path), 
  write(Path), nl, !. 


path3(to, to, _).
 
path3(from, to, visited) :- 
  (door(from, near); door(near, from)), 
  not(member(near, visited)), 
  write('entering room '), write(near), nl, 
  path3(near, to, [from, near|visited]), !. 

path4(from, to) :-
  path2Helper(from, to, [], Path), length(Path, Count), 
  write('rooms count: '), write(Count), nl. 


path5(to, to, _, _, []).

path5(from, to, Pass, visited, ResultList) :- 
  (door(from, near); door(near, from)), 
  not(member(near, visited)), near \= Pass, 
  path5(near, to, Pass, [from, near|visited], TmpResult), 
  append([from], TmpResult, ResultList), !. 


path6Helper(to, to, _, []).

path6Helper(from, to, visited, Result) :- 
  (door(from, near); door(near, from)), 
  not(member(near, visited)), 
  path6Helper(near, to, [from, near|visited], TmpResult), 
  append([from], TmpResult, Result). 

path6(from, to, Result) :- 
  path6Helper(from, to, [], Result), write(Result), nl, fail. 

path7(to, to, _, windowsCount) :- windows(to, windowsCount). 
  path7(from, to, visited, windowsCount) :- 
  (door(from, near); door(near, from)), 
  not(member(near, visited)), write(near), nl, 
  path7(near, to, [from, near|visited], windowsAtnearRooms), 
  windows(from, windowsAtThisRoom), windowsCount is windowsAtnearRooms + windowsAtThisRoom, !.
