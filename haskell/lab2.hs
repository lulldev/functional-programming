import System.IO

doMyList :: Int -> [Int]
doMyList(x) = [x, x + 1 .. x + x]

oddEven :: [a] -> [a]
oddEven([]) = []
oddEven([x]) = [x]
-- oddEven(xs) = xs !! 1 : xs !! 0 : oddEven(tail(tail(xs)))
oddEven(x:xs) = head(xs) : x : oddEven(tail(xs))

insert :: [a] -> a -> Int -> [a]
insert list target pos = take pos list ++ [target] ++ drop pos list

listSum :: Num a => [a] -> [a] -> [a]
listSum [x] [] = [x]
listSum [] [x] = [x]
listSum (x:xs) (y:ys) = sum(x:xs) : sum(y:ys) : []

-- position :: [a] -> a -> Int
-- position list targetElement = findIndex (==targetElement) list

getSimpleSumByN :: Int -> Int
getSimpleSumByN n = sum([1 .. n])

getSubtractionSumByN :: Int -> Int
getSubtractionSumByN n = sum([n - i | i <- [1 .. n]])

main :: IO ()
  
main = do
    putStr "N0:"
    print(doMyList(4))
    putStr "N1:"
    print(oddEven [1, 2, 3, 4])
    putStr "N2:"
    print(insert [1, 2, 5, 4, 2] 10 3)
    putStr "N3:"
    print(listSum [1, 2] [3, 4])
    putStr "N4:\n"
    -- print(position [1, 2] 3)
    -- print(findIndex (>3) [0,2,4,6,8])
    putStr "N5:"
    print(getSimpleSumByN(5))
    putStr "N6:"
    print(getSubtractionSumByN(3))
    