# Programming In The Past 

Daniel Gisolfi

## LISP

### Code

```commonlisp
;; Daniel Nicolas Gisolfi
;; LISP Cipher
;; BEST RESOURCE => http://progopedia.com/implementation/steel-bank-common-lisp/

;; Create a function to do individual character shifting
(defun offset (ch key)
  ;; Here comes the "Lots of Irritating Superfluous Parentheses " 
  (let* ((c  (char-code  ch)) (la (char-code #\a)) (ua (char-code #\A)) 
         (base (cond ((<= la c (char-code #\z)) la) 
                     ((<= ua c (char-code #\Z)) ua) 
                     (nil))))
    (if base (code-char (+ (mod (+ (- c base) key) 26) base)) ch)))
 
(defun encrypt (str key)
  ;; map is very useful and is used in a few of these languages actually
  ;; For each char in string call offset to shift the character 
  (map 'string #'(lambda (c) (offset c key)) str))

;; lazy decryption...or efficient?
(defun decrypt (str key) (encrypt str (- key)))

;; I will admit this is a very concise version of the solve function
;; thanks to LISP....not worth it though
(defun solve (str num) 
  ;; loop through the required number of test cases, encrypt as we go 
  (loop for n from 0 to num
    do (format t "Caesar ~D: ~a~%" n (encrypt str n))))


;; Define the String to be encrypte and the base key
(let* ((og "HAL")
       (key 6)
       (encrypted_text (encrypt og key))
       (decrypted_text (decrypt encrypted_text key)))
       ;; Just Call Solve and let it do its thing  
       (solve og 26)

  (format t "Original Text: ~a ~%" og)
  ;; ENCRYPT
  (format t "Encrypted: ~a ~%" encrypted_text)
  ;; DECRYPT
  (format t "Decrypted: ~a ~%" decrypted_text))
```

### Output

**Case 1**

```
Caesar 0: HAL
Caesar 1: IBM
Caesar 2: JCN
Caesar 3: KDO
Caesar 4: LEP
Caesar 5: MFQ
Caesar 6: NGR
Caesar 7: OHS
Caesar 8: PIT
Caesar 9: QJU
Caesar 10: RKV
Caesar 11: SLW
Caesar 12: TMX
Caesar 13: UNY
Caesar 14: VOZ
Caesar 15: WPA
Caesar 16: XQB
Caesar 17: YRC
Caesar 18: ZSD
Caesar 19: ATE
Caesar 20: BUF
Caesar 21: CVG
Caesar 22: DWH
Caesar 23: EXI
Caesar 24: FYJ
Caesar 25: GZK
Caesar 26: HAL
Original Text: HAL
Encrypted: NGR
Decrypted: HAL
```

**Case 2**

```
Caesar 0: Lots of Irritating Superfluous Parentheses
Caesar 1: Mput pg Jssjubujoh Tvqfsgmvpvt Qbsfouiftft
Caesar 2: Nqvu qh Kttkvcvkpi Uwrgthnwqwu Rctgpvjgugu
Caesar 3: Orwv ri Luulwdwlqj Vxshuioxrxv Sduhqwkhvhv
Caesar 4: Psxw sj Mvvmxexmrk Wytivjpysyw Tevirxliwiw
Caesar 5: Qtyx tk Nwwnyfynsl Xzujwkqztzx Ufwjsymjxjx
Caesar 6: Ruzy ul Oxxozgzotm Yavkxlrauay Vgxktznkyky
Caesar 7: Svaz vm Pyypahapun Zbwlymsbvbz Whyluaolzlz
Caesar 8: Twba wn Qzzqbibqvo Acxmzntcwca Xizmvbpmama
Caesar 9: Uxcb xo Raarcjcrwp Bdynaoudxdb Yjanwcqnbnb
Caesar 10: Vydc yp Sbbsdkdsxq Cezobpveyec Zkboxdrococ
Caesar 11: Wzed zq Tccteletyr Dfapcqwfzfd Alcpyespdpd
Caesar 12: Xafe ar Uddufmfuzs Egbqdrxgage Bmdqzftqeqe
Caesar 13: Ybgf bs Veevgngvat Fhcresyhbhf Cneragurfrf
Caesar 14: Zchg ct Wffwhohwbu Gidsftzicig Dofsbhvsgsg
Caesar 15: Adih du Xggxipixcv Hjetguajdjh Epgtciwthth
Caesar 16: Beji ev Yhhyjqjydw Ikfuhvbkeki Fqhudjxuiui
Caesar 17: Cfkj fw Ziizkrkzex Jlgviwclflj Grivekyvjvj
Caesar 18: Dglk gx Ajjalslafy Kmhwjxdmgmk Hsjwflzwkwk
Caesar 19: Ehml hy Bkkbmtmbgz Lnixkyenhnl Itkxgmaxlxl
Caesar 20: Finm iz Cllcnuncha Mojylzfoiom Julyhnbymym
Caesar 21: Gjon ja Dmmdovodib Npkzmagpjpn Kvmziocznzn
Caesar 22: Hkpo kb Ennepwpejc Oqlanbhqkqo Lwnajpdaoao
Caesar 23: Ilqp lc Foofqxqfkd Prmbocirlrp Mxobkqebpbp
Caesar 24: Jmrq md Gppgryrgle Qsncpdjsmsq Nypclrfcqcq
Caesar 25: Knsr ne Hqqhszshmf Rtodqektntr Ozqdmsgdrdr
Caesar 26: Lots of Irritating Superfluous Parentheses
Original Text: Lots of Irritating Superfluous Parentheses
Encrypted: Ruzy ul Oxxozgzotm Yavkxlrauay Vgxktznkyky
Decrypted: Lots of Irritating Superfluous Parentheses
```

### Log

#### 2018-11-14

* Somehow this language is easier than ML....possibly because of the compiler is at least slightly more helpful.
* Was able to write my offset function to return a character shifted by the key!
* Using this offset function the encrypt and decrypt functions become easier, using map(just like in ML) I can pass each character of a string into offset....this took a while was LISP made to be confusing?

#### 2018-11-21
* ML is pissing me off again....please save me LISP
* Most of the resources online aren't that helpful....this one is a savior http://progopedia.com/implementation/steel-bank-common-lisp/
* Using that Manuel the Solve function is now easy, using the `for loop` syntax found there
* Only took like an extra 1.5 hours to get solve working, LISP wasn't as hard as I anticipated, however, it was just as frustrating as expected. 
* In Conclusion, you will not find me using the language unless forced to, and even then I will plead for mercy.
* Steel Bank Common LISP  compiler was extremely fast....however, the errors were absolutely not readable, just a big mess

## Haskell

### Code
```haskell
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
```

### Output

**Case 1**

```
Encrypt: HAL -> NGR
Decrypt: NGR -> HAL
Ceaser 0: HAL
Ceaser 1: IBM
Ceaser 2: JCN
Ceaser 3: KDO
Ceaser 4: LEP
Ceaser 5: MFQ
Ceaser 6: NGR
Ceaser 7: OHS
Ceaser 8: PIT
Ceaser 9: QJU
Ceaser 10: RKV
Ceaser 11: SLW
Ceaser 12: TMX
Ceaser 13: UNY
Ceaser 14: VOZ
Ceaser 15: WPA
Ceaser 16: XQB
Ceaser 17: YRC
Ceaser 18: ZSD
Ceaser 19: ATE
Ceaser 20: BUF
Ceaser 21: CVG
Ceaser 22: DWH
Ceaser 23: EXI
Ceaser 24: FYJ
Ceaser 25: GZK
Ceaser 26: HAL
Done
```

**Case 2**

```
Encrypt: Dark Themes are Superior in almost every Case -> Jgxq Znksky gxk Yavkxoux ot grsuyz kbkxe Igyk
Decrypt: Jgxq Znksky gxk Yavkxoux ot grsuyz kbkxe Igyk -> Dark Themes are Superior in almost every Case
Ceaser 0: Dark Themes are Superior in almost every Case
Ceaser 1: Ebsl Uifnft bsf Tvqfsjps jo bmnptu fwfsz Dbtf
Ceaser 2: Fctm Vjgogu ctg Uwrgtkqt kp cnoquv gxgta Ecug
Ceaser 3: Gdun Wkhphv duh Vxshulru lq doprvw hyhub Fdvh
Ceaser 4: Hevo Xliqiw evi Wytivmsv mr epqswx izivc Gewi
Ceaser 5: Ifwp Ymjrjx fwj Xzujwntw ns fqrtxy jajwd Hfxj
Ceaser 6: Jgxq Znksky gxk Yavkxoux ot grsuyz kbkxe Igyk
Ceaser 7: Khyr Aoltlz hyl Zbwlypvy pu hstvza lclyf Jhzl
Ceaser 8: Lizs Bpmuma izm Acxmzqwz qv ituwab mdmzg Kiam
Ceaser 9: Mjat Cqnvnb jan Bdynarxa rw juvxbc nenah Ljbn
Ceaser 10: Nkbu Drowoc kbo Cezobsyb sx kvwycd ofobi Mkco
Ceaser 11: Olcv Espxpd lcp Dfapctzc ty lwxzde pgpcj Nldp
Ceaser 12: Pmdw Ftqyqe mdq Egbqduad uz mxyaef qhqdk Omeq
Ceaser 13: Qnex Gurzrf ner Fhcrevbe va nyzbfg rirel Pnfr
Ceaser 14: Rofy Hvsasg ofs Gidsfwcf wb ozacgh sjsfm Qogs
Ceaser 15: Spgz Iwtbth pgt Hjetgxdg xc pabdhi tktgn Rpht
Ceaser 16: Tqha Jxucui qhu Ikfuhyeh yd qbceij uluho Sqiu
Ceaser 17: Urib Kyvdvj riv Jlgvizfi ze rcdfjk vmvip Trjv
Ceaser 18: Vsjc Lzwewk sjw Kmhwjagj af sdegkl wnwjq Uskw
Ceaser 19: Wtkd Maxfxl tkx Lnixkbhk bg tefhlm xoxkr Vtlx
Ceaser 20: Xule Nbygym uly Mojylcil ch ufgimn ypyls Wumy
Ceaser 21: Yvmf Oczhzn vmz Npkzmdjm di vghjno zqzmt Xvnz
Ceaser 22: Zwng Pdaiao wna Oqlanekn ej whikop aranu Ywoa
Ceaser 23: Axoh Qebjbp xob Prmboflo fk xijlpq bsbov Zxpb
Ceaser 24: Bypi Rfckcq ypc Qsncpgmp gl yjkmqr ctcpw Ayqc
Ceaser 25: Czqj Sgdldr zqd Rtodqhnq hm zklnrs dudqx Bzrd
Ceaser 26: Dark Themes are Superior in almost every Case
Done
```

### Log

#### 2018-11-21

* The syntax is interesting and seems to suffer one of the problems alan mentioned about PHP, too many ways to do the same thing.
* Its also interesting that you must define basically the path that a value takes through the functions as data types, not sure how I feel about it
* I'm unsure if this will be true for all of the functional languages however the process of the program was very similar to that of lisp, using an offset function that changes char values rather than the entire string.
* some of the syntax is very strange, especially the pipe character making an appearance
* I was struggling to find documentation on how to write a while or for loop in the language and then laughed when I realized it probably wouldn't have loops and instead the only recursion, of course, it does Haskell discovered or created the Y Combinator. 
* I was intimidated at first about writing the solve function as a recursive loop however it turned out to be easier and fewer lines than some of the procedural languages with loops
* strange choice of concatenation symbols in the syntax `++`, gave me some weird errors when I was attempting to increment an int by doing `cur++`.
* Haskell grew on me during the process(only took me an hour and a half for the whole thing), it wasn't too difficult mostly due to the great documentation readily available. Still probably would rather write a CLI application in Java, C or even python before Haskell.

