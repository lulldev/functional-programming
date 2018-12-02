import System.Environment
import System.IO
import System.Directory
import Data.List
import Data.Char

prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys

substring :: String -> String -> Bool
substring (x:xs) [] = False
substring xs ys
    | prefix xs ys = True
    | substring xs (tail ys) = True
    | otherwise = False

getLinesWithWord :: String -> [String] -> [String]
getLinesWithWord _ [] = []
getLinesWithWord word (x:xs) = 
  if substring word x then 
    x : getLinesWithWord word xs
  else
    getLinesWithWord word xs

linesToString :: [String] -> String
linesToString [] = ""
linesToString (x:xs) = x ++ "\n" ++ linesToString(xs)

main = do
  args <- getArgs
  if length args == 3 then do
    let inputFile = args !! 0
    let outputFile = args !! 1
    let searchWord = args !! 2
    fileExists <- doesFileExist inputFile
    if fileExists then do
      content <- readFile inputFile
      let linesOfFile = lines content
      writeFile outputFile (linesToString(getLinesWithWord searchWord linesOfFile))
    else
      putStrLn "File doesn't exist!"
  else
    putStrLn "Invalid parameters! Use program <input> <output> <word>"
