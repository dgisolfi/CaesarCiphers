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
  