(* DANIEL NICOLAS GISOLFI *)
(* CAESAR CHIPHER *)

(* The following two functions exist to make the code more
readable as well as keep me sane... for now *)

(* given an integer return the char value of it *)
fun toChar(i:int):char = 
    chr (ord #"a" + i)
;

(* given a char return the numeric value of it *)
fun toInt(ch:char):int = 
    ord ch - ord #"a"
;

(* Using the prev two funcs, shift the lowercase char by the key *)
fun shiftChar(key:int, ch:char):char = 
    if Char.isLower ch; 
    then toChar((toInt(ch) + key) mod 26);
    else ch



(* fun encrypt(str:string,key:int) = *)
    val newstring = []
    val chars = explode("fish")
    val ch = hd(chars)
    val f = shiftChar(6 ch)
    concat(newstring f) *)
    (* if length chars > 0
    then 
    else implode newstring
    
(* ; *)

(* fun decrypt(str:string,key:int):string = 
    encrypt(str ~key)
; *)

(* val t = offset(6, #"d")
val test = encrypt("fish", 6) *)
(* val test2 = encrypt(encrypt("fish", 6), 6) *)
(* TEST IT BOI *)


