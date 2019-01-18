#!/usr/local/bin/swipl

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
  write('Solution:'), formatWrite(ResultPathList), fail. 
  go(_, _). 

formatWrite([]). 
  formatWrite([Head|ListTail]) :- 
  formatWrite(ListTail), nl, tab(2), write(Head), !. 

goToA :- go(state(east, east, east, east), state(west, west, west, west)). 
goToB :- go(state(west, east, east, east), state(west, west, west, west)). 
goToC :- go(state(east, east, east, west), state(west, west, west, west)). 
goToD :- go(state(west, west, west, east), state(west, west, west, west)). 
goToE :- go(state(east, east, west, east), state(west, west, west, west)). 
