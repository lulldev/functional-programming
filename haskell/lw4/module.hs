module LW4 (myNull, myMember, myFromList, myUnion, myIntersection) where


{-|
  The 'myNull' check is set empty?
  It takes one argument, of type [].
  Return type: Boolean
-}
myNull :: [a] -> Bool
myNull [] = True
myNull _  = False


{-|
  The 'myMember' check is some element exist in list/set
  It takes two argument. First argument of some type, second argument of list/set elements.
  Return type: Boolean
-}
myMember :: (Eq a) => a -> [a] -> Bool
myMember x [] = False
myMember x (y:ys) = if (y == x) then True else myMember x ys


{-|
  The 'myFromList' generate set (only unique elements) from some list
  It takes one argument, of type list.
  Return type: Set
  Depency: myMember, myFromList
-}
myFromList :: (Eq a) => [a] -> [a]
myFromList [] = []
myFromList (x:xs) = if myMember x (myFromList xs) then myFromList xs else x:(myFromList xs)


{-|
  The 'myUnion' return union of two lists/sets.
  It takes two argument, of type lists/sets.
  Return type: Set
  Depency: myFromList
-}
myUnion :: (Eq a) => [a] -> [a] -> [a]
myUnion x [] = x
myUnion [] y = y
myUnion x y = myFromList (x++y)


{-|
  The 'myIntersection' return intersection of two lists/sets.
  It takes two argument, of type lists/sets.
  Return type: Set
  Depency: myMember, myFromList
-}
myIntersection :: (Eq a) => [a] -> [a] -> [a]
myIntersection x [] = x
myIntersection [] y = y
myIntersection (x:xs) y = myFromList (if myMember x y then x:(myIntersection xs y) else (myIntersection xs y))
