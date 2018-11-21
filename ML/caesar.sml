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
fun offset(key:int, ch:char):char = 
    if Char.isLower ch 
    then toChar((toInt(ch) + key) mod 26)
    else ch
;

(* fun shift n c = if Char.isLower c
              then int2let((let2int c + n) mod 26)
              else c *)

fun encrypt(str:string,key:int):string =
    (* (explode(str)).hd *)
    implode str map (offset key) str explode
    (* if String.isLower str then *)
    (* else str *)
;

(* fun encode n = implode o map (o n) o explode *)

val t = offset(#"d",6)
val test = encrypt("fish", 6)
(* TEST IT BOI *)

(* implode "dan" map (offset 6) "dan" explode *)