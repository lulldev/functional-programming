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
  write('A solution is:'), formatWrite(ResultPathList), fail. 
  go(_, _). 

formatWrite([]). 
  formatWrite([Head|ListTail]) :- 
  formatWrite(ListTail), nl, tab(2), write(Head), !. 