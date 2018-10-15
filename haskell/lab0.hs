main :: IO ()

main = do
  putStr "N1:"
  print(snd(fst ((1, 'a'), "abc")))
  putStr "N2:"
  print(head(tail(['a', 'b', 'c'])))
  putStr "N2:"
  -- (tail(head([['a', 'b'], ['c','d']])) !! 0)
  print (head(tail(head([['a', 'b'], ['c','d']]))))
  putStr "N2:"
  -- print(head(tail([['a', 'c', 'd'], ['a','b']])) !! 1)
  print (head(tail(head(tail([['a', 'c', 'd'], ['a','b']])))))
  putStr "N2:"
  -- print(tail([['a','d'], ['b', 'c']]) !! 0 !! 0)
  print(head(head(tail([['a','d'], ['b', 'c']]))))
  putStr "N3:"
  print(take 20 [1, 3..])
  putStr "N3:"
  print(filter odd [1..39])
  putStr "N3:"
  print([1, 3.. 40])
  putStr "N4:"
  print([round((x*(x+1))/2) | x <- [1 .. 50]])
  putStr "N5:"
  print([round((x*(x+1)*(2*x+1)/6)) | x <- [1 .. 50]])
