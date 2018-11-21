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