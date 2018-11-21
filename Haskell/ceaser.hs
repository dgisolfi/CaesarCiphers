import Data.Char (ord, chr, isUpper, isAlpha)
 
encrypt :: Int -> String -> String
encrypt = (<$>) . offset

decrypt :: Int -> String -> String
decrypt = encrypt . negate
 
offset :: Int -> Char -> Char
offset key ch
  | isAlpha ch = chr $ intAlpha + mod ((ord ch - intAlpha) + key) 26
  | otherwise = ch
  where
    intAlpha =
      ord
        (if isUpper ch
           then 'A'
           else 'a')

solve :: String -> IO ()
solve str = putStrLn str

main :: IO ()
main = do 
    let encoded = encrypt (6) "HAL"
    putStrLn encoded
    let decoded = decrypt (6) encoded
    putStrLn decoded
    
    solve "HAL"
    