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

main :: IO ()

main = do
  print(listnums(5))
  print(secondlastlist [[1, 2, 3], [5, 4, 3, 2], [0]])
  print(myunion [1, 2, 3, 1] [4, 5, 1, 4])
  print(getNElementsFromList [[1, 2], [3, 1]] 1)