object Ceasar {

    def offset(char:Char, key:Int):Char =  {
        return (char.toInt + key).toChar
    }

    def encrypt(str:String, key:Int):String = {
        var encoded:String = "";
        str.foreach((char: Char) => encoded = encoded.concat((offset(char, key).toString)));
        return encoded
    }

    def decrypt(str:String, key:Int):String = {
        return  Ceasar.encrypt(str, -key)
    }

    def main(args: Array[String]): Unit = {
        val og = "HAL";
        val key = 6;

        val encrypted = Ceasar.encrypt(og, key)
        val decrypted = Ceasar.decrypt(encrypted, key)

        println("Original  --> " + og)
        println("Encrypted --> " + encrypted)
        println("Decrypted --> " + decrypted)
    }

}