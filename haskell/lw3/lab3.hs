module Lab3 where

-- Task 1

listnums :: Int -> [Int]
listnums n
  | n < 1 = []
  | otherwise =  n : listnums (n-1)


-- Task 2

secondlastlist :: [[a]] -> [a]
secondlastlist [] = []
secondlastlist (x:xs) = (last x) : (secondlastlist xs)


-- Task 3

myunion  [] ys = ys
myunion  (x:xs) ys
    | elem x ys = myunion xs ys
    | otherwise = x : (myunion xs ys)


-- Task 5

getNElementsFromList :: [[a]] -> Int -> [a]
getNElementsFromList list pos = map (!!pos) list
