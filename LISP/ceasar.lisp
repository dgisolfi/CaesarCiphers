(defun offset (ch key)
  (let* ((c  (char-code  ch)) (la (char-code #\a)) (ua (char-code #\A)) 
         (base (cond ((<= la c (char-code #\z)) la) 
                     ((<= ua c (char-code #\Z)) ua) 
                     (nil))))
    (if base (code-char (+ (mod (+ (- c base) key) 26) base)) ch)))
 
(defun encrypt (str key)
  (map 'string #'(lambda (c) (offset c key)) str))
 
(defun decrypt (str key) (encrypt str (- key)))

(defun solve (str key) 
  (loop for i from 0
    for x=26)
    while(<x 26)
    do 
)
 
(let* ((og "diggery do")
       (key 6)
       (cipher-text (encrypt og key))
       (recovered-text (decrypt cipher-text key)))

  (format t "Original Text: ~a ~%" og)
  ;; ENCRYPT
  (format t "Encrypted: ~a ~%" cipher-text)
  ;; DECRYPT
  (format t "Decrypted: ~a ~%" recovered-text))
  ;; SOLVE