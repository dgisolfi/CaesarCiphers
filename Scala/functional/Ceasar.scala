// Daniel Nicolas Gisolfi
// Ceasar Cipher in Scala done functionaly
object Ceasar {
    // Given a char shift it by the key and convert
    // back to char to return
    def offset(char:Char, key:Int):Char =  {
        // check if the letters are going out of bounds
        if (char.toInt + key > 'Z'.toInt) {
            return (char.toInt + key -26).toChar
        } else {
            return (char.toInt + key).toChar
        }
    }

    // Iterate through each character of the string and
    // for each char, send it to offset() and then concat it
    def encrypt(str:String, key:Int):String = {
        var encoded:String = "";
        str.foreach((char: Char) => encoded = encoded.concat((offset(char, key).toString)));
        return encoded
    }

    // Just call encrypt but negate the key first
    def decrypt(str:String, key:Int):String = {
        return  Ceasar.encrypt(str, -key)
    }

    // for the desired limit solve the cipher for all values
    def solve(str:String, cur:Int, lim:Int) {
        println("Ceasar " + cur + ": " + Ceasar.encrypt(str, cur));
        // Base case, check if the limits been reached,
        // otherwise call the function again
        if(cur != lim) {
            solve(str, cur+1 , lim);
        } else {
            println("Done");
        }
    }

    def main(args: Array[String]): Unit = {
        val og = "HAL";
        val key = 6;

        val encrypted = Ceasar.encrypt(og, key);
        val decrypted = Ceasar.decrypt(encrypted, key);

        println("Original  --> " + og);
        println("Encrypted --> " + encrypted);
        println("Decrypted --> " + decrypted);
        Ceasar.solve(og,0,26);
    }

}