import System.IO

main :: IO ()


myNull :: [a] -> Bool
myNull [] = True
myNull _  = False


myMember :: (Eq a) => a -> [a] -> Bool
myMember x [] = False
myMember x (y:ys) = if (y == x) then True else myMember x ys


myFromList :: (Eq a) => [a] -> [a]
myFromList [] = []
myFromList (x:xs) = if myMember x (myFromList xs) then myFromList xs else x:(myFromList xs)


myUnion :: (Eq a) => [a] -> [a] -> [a]
myUnion x y = myFromList (x++y)


myIntersection :: (Eq a) => [a] -> [a] -> [a]
myIntersection x [] = []
myIntersection [] y = []
myIntersection (x:xs) y = myFromList (if myMember x y then x:(myIntersection xs y) else (myIntersection xs y))


main = do
  print("myNull")
  print(myNull [1])
  print(myNull [])
  
  print("myMember")
  print(myMember 1 [2, 3, 5, 2])
  print(myMember 5 [2, 3, 5, 2])
  
  print("myFromList")
  print(myFromList [1, 2, 3, 5, 2])
  
  print("myUnion")
  print(myUnion [1, 2, 3, 5, 2] [4, 8, 2])
  
  print("myIntersection")
  print(myIntersection [1, 2, 3, 4] [2, 3, 5, 2])
