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

(* 
There is no easy way to do this without the map function
the difficult task was to figure out how to use the map function while
the fn your passing through takes more than one arguement
The documentation is lacking.
 *)
fun encrypt(str:string, key:int): string = 
    let 
        val chars = explode(str)
        val shiftedChars = map (shiftChar key) chars
    in
        implode shiftedChars
    end
;

(* Just negate it and send it through *)
fun decrypt(str:string,key:int): string = 
    encrypt(str, ~key)
;

(* Recursion is easier than a for loop for this *)
fun solve(str:string, cur:int, lim:int) = 
    let
        val c = cur + 1
        val curStr = Int.toString(cur)
        val encrypted = encrypt(str, cur)
    in
        (* print the encryption for the given key *)
        print("Ceasar " ^ curStr ^ ": " ^ encrypted ^ "\n");
        (* if the limit has not been reached call the fn again*)
        if cur <> lim
            then solve(str, c, lim)
        (* are we there yet? *)
        else print("done\n")
    end
;

(* TEST IT ALL *)
val og = "hal";
val _ = print("ORIGINAL ------->  " ^ og ^ "\n");
val _ = print("ENCRYPTED -------> " ^ encrypt(og, 6) ^ "\n");
val _ = print("DECRYPTED -------> " ^ decrypt(og, 6) ^ "\n");
solve(og, 0, 26);