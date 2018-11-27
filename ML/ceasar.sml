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
fun shiftChar key ch: char =
    if Char.isLower ch
        then toChar((toInt(ch) + key) mod 26)
    else ch
;



fun encrypt(str:string, key:int): string = 
    let 
        val chars = explode(str)
        val test = map (shiftChar key) chars
    in
        implode test
    end
;

fun decrypt(str:string,key:int): string = 
    encrypt(str, ~key)
;

encrypt("hal", 6);
decrypt("ngr", 6);
