(* DANIEL NICOLAS GISOLFI *)
(* CASER CHIPHER *)

(* The following two functions exist to make the code more
readable as well as keep me sane... for now *)

(* given an integer return the char value of it *)
fun toChar(i:int):char = 
    chr (ord #"a" + i)

(* given a char return the numeric value of it *)
fun toInt(c:char):int = 
    ord c - ord #"a"

(* Using the prev two funcs, shift the lowercase char by the key *)
fun offset(ch:char,key:int):char = 
    if Char.isLower ch then 
        toChar((toInt(ch) + key) mod 26)
    else ch

(* TEST IT BOI *)
val test = offset(#"d", 6)