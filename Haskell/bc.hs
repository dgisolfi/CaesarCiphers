import Data.Char (ord, chr, isUpper, isAlpha)
 
encrypt, decrypt :: Int -> String -> String

encrypt = (<$>) . tr
 
decrypt = encrypt . negate
 
tr :: Int -> Char -> Char
tr offset c
  | isAlpha c = chr $ intAlpha + mod ((ord c - intAlpha) + offset) 26
  | otherwise = c
  where
    intAlpha =
      ord
        (if isUpper c
           then 'A'
           else 'a')

-- solve :: String ->
 
main :: IO ()
main = mapM_ print [encoded, decoded]
  where
    encoded = encrypt (6) "HAL"
    decoded = decrypt (6) encoded
    