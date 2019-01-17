oppositeSides(east, west). 
oppositeSides(west, east). 

posibleMove(state(X, X, G, C), state(Y, Y, G, C)) :- oppositeSides(X, Y).
posibleMove(state(X, W, X, C), state(Y, W, Y, C)) :- oppositeSides(X, Y).
posibleMove(state(X, W, G, X), state(Y, W, G, Y)) :- oppositeSides(X, Y).
posibleMove(state(X, W, G, C), state(Y, W, G, C)) :- oppositeSides(X, Y).

unsafe(state(F, X, X, _)):- oppositeSides(F, X). 
unsafe(state(F, _, X, X)):- oppositeSides(F, X). 

path(State, Goal, PathList, ResultPathList) :- 
posibleMove(State, NextState), not(unsafe(NextState)), not(member(NextState, PathList)), 
path(NextState, Goal, [NextState|PathList], ResultPathList), !. 

path(Goal, Goal, PathList, PathList) :- !. 

go(State, Goal) :- 
path(State, Goal, [State], ResultPathList), 
write('A solution is:'), formatWrite(ResultPathList), fail. 
go(_, _). 

formatWrite([]). 
formatWrite([Head|ListTail]) :- 
formatWrite(ListTail), nl, tab(2), write(Head), !. 

goToA :- go(state(east, east, east, east), state(west, west, west, west)). 
goToB :- go(state(west, east, east, east), state(west, west, west, west)). 
goToC :- go(state(east, east, east, west), state(west, west, west, west)). 
goToD :- go(state(west, west, west, east), state(west, west, west, west)). 
goToE :- go(state(east, east, west, east), state(west, west, west, west)). 

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

path7(to, to, _, windowsCount) :- windows(to, windowsCount). 
path7(from, to, visited, windowsCount) :- 
(door(from, near); door(near, from)), 
not(member(near, visited)), write(near), nl, 
path7(near, to, [from, near|visited], windowsAtnearRooms), 
windows(from, windowsAtThisRoom), windowsCount is windowsAtnearRooms + windowsAtThisRoom, !.

