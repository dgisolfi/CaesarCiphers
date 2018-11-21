-- Daniel Nicolas Gisolfi
-- Haskell Cipher

import Data.Char (ord, chr, isUpper, isAlpha)

-- For each character in the given string offset it by the key
encrypt :: Int -> String -> String
encrypt = (<$>) . offset

-- Negate the key and then call encrypt as per usual
decrypt :: Int -> String -> String
decrypt = encrypt . negate
 
-- Given a character and a key shift the char and return it
offset :: Int -> Char -> Char
offset key ch
  | isAlpha ch = chr $ intAlpha + mod ((ord ch - intAlpha) + key) 26
  | otherwise = ch
  where
    intAlpha =
      ord
        -- Check for Case of Char   
        (if isUpper ch
           then 'A'
           else 'a')

--  Gotta use recursion...
--  No matter what Call encrypt with the given vals and
--  print the results 
--  Check if the given lim has been reached otherwise 
--  increment the cur number and call the func again 
solve :: String -> Int -> Int -> IO ()
solve str cur lim = do
    let encode = encrypt (cur) str
    let out = "Ceaser " ++ show cur ++ ": " ++ encode
    putStrLn out
    let c = cur + 1
    if cur /= lim
    then solve str c lim
    else putStrLn "Done"

main :: IO ()
main = do
    -- Define the string and key
    let og = "HAL"
    let key = 6

    -- Using the returned value build nice output for print statement
    let encoded = encrypt key og
    let encrypted_out = "Encrypt: " ++ og ++ " -> " ++ encoded
    putStrLn encrypted_out

    -- Using the returned value build nice output for print statement
    let decoded = decrypt key encoded
    let decrypted_out = "Decrypt: " ++ encoded ++ " -> " ++ decoded
    putStrLn decrypted_out

    -- Pass the og string as well as a 0 for the cur value, giving the
    -- fucntion a place to start and finally give it a limit to reach 
    solve og 0 26
    