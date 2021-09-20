import Data.Char (toLower)
import Data.List (delete, elemIndex, transpose)
import Data.List.Split (chunksOf)
import Data.Maybe (isJust)

-- Helper function
charToInt :: Char -> Int
charToInt = read . pure

-- Returns a 5x5 Polybius Square using "abcdefghjklmnopqrstuvwxyz"
-- Note that 'i' and 'j' are the same letter, so 'i' is deleted from the Square
getPolybiusSquare :: [[Char]]
getPolybiusSquare = chunksOf 5 (delete 'i' ['a'..'z'])

-- Returns the transposed Polybius Square to make finding the character's row and collumn easier.
getTransposedPolybiusSquare :: [[Char]]
getTransposedPolybiusSquare = transpose getPolybiusSquare

-- Returns a character's Polybius Square index.
encodePolybiusValue :: Char -> String
encodePolybiusValue 'i' = encodePolybiusValue 'j'
encodePolybiusValue c =
  show (getPolybiusValueFromSquare c getPolybiusSquare) ++ show (getPolybiusValueFromSquare c getTransposedPolybiusSquare)

-- Returs the character from a Polybius Square index.
decodePolybiusValue :: [Char] -> Char
decodePolybiusValue "00" = ' '
decodePolybiusValue (x:y:_) = getPolybiusSquare !! (charToInt y - 1) !! (charToInt x - 1)
decodePolybiusValue __ = '\NUL'

-- Returns a character's index value from a square, it's used two times, one with the normal square and another with
-- the transposed one, getting the row and column that a character belongs to. 
getPolybiusValueFromSquare :: Char -> [[Char]] -> Int
getPolybiusValueFromSquare c css =
  case filter isJust (map (elemIndex $ toLower c) css) of
    (Just n : _) -> n + 1
    _ -> 0

-- Method to call the encodePolybiusValue method for each character in a String.
toPolybius :: String -> String
toPolybius = unwords . map encodePolybiusValue

-- Method to call the decodePolybiusValue for each index value in a string.
-- NOTE: it only works with a perfect input, no errors allowed!
fromPolybius :: String -> String
fromPolybius = map decodePolybiusValue . words

main :: IO ()
main = do

  putStrLn "+-----------------------+"
  putStrLn "|Polybius Square Encoder|"
  putStrLn "+-----------------------+"

  let example = "rafael souza"
  putStrLn ("Encoding string: " ++ example)
  putStrLn ("Encoded: " ++ toPolybius example)
  putStrLn ("Decoded: " ++ fromPolybius (toPolybius example))
