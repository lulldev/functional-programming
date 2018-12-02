main :: IO ()

-- task 1

mod' :: Int -> Int -> Int
mod' x y | (y > x)   = x
         | otherwise = mod'(x-y) y

sumOfNumbersDiv3And5 :: Int -> Int
sumOfNumbersDiv3And5 n
  | n == 1000 = 0
  | mod n 3 == 0 && mod n 5 == 0 = n + sumOfNumbersDiv3And5(n + 1)
  | otherwise = sumOfNumbersDiv3And5(n + 1)
  
-- task 2

abcMultiplicationInPythagorasTroikaByN :: Int -> Int -> Int -> Int -> Int
abcMultiplicationInPythagorasTroikaByN n a b c
  | a < n && a ^ 2 + b ^ 2 == c ^ 2 = a * b * c
  | otherwise = abcMultiplicationInPythagorasTroikaByN n (a+1) (b+1) (c+1)

-- task 3

transpose :: [[a]] -> [[a]]
transpose [[]] = []
transpose [[], _] = []
transpose list = map head list : transpose (map tail list)
  
main = do
   print(sumOfNumbersDiv3And5(0))
   print(abcMultiplicationInPythagorasTroikaByN 1000 1 2 3) -- for 1000
   print(transpose([[1,2,3],[4,5,6]]));
