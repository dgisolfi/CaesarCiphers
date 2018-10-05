// Cipher Program 
object Cipher {
    def main(args: Array[String]): Unit = {
        val text = "HAL"
        // backup the text var
        val og = text
        // show we got the corrct input
        println("Original  => " + text)

        // encode the text and show results
        val encoded = Cipher.encode(text, 10)
        println("Encrypt:   " + og +  " => " + encoded)

        //d ecode the text and show results
        val decoded = Cipher.decode(encoded, 10)
        println("Decrypted: " + og +  " => " + decoded)
        
        // pass thw text to the solve program
        Cipher.solve(text)
    }
    // Upper case alphabet 
    private val alphaU='A' to 'Z'
    // Lower case alphabet 
    private val alphaL='a' to 'z'
    
    // Encode
    def encode(text:String, key:Int)=text.map{
        // This is way cooler than how I originally did it...once again thank you stack overflow
        // shift uppers
        case str if alphaU.contains(str) => rot(alphaU, str, key)
        // shift normal case
        case str if alphaL.contains(str) => rot(alphaL, str, key)
        // assign the new val
        case str => str
    }
    // Im not this clever, googling is an art
    def decode(text:String, key:Int)=encode(text,-key)
    private def rot(a:IndexedSeq[Char], c:Char, key:Int)=a((c-a.head+key+a.size)%a.size)
    
    // Just call the encode function 27 times, 0-26 and print it nicley
    def solve(text:String){
        for(i <- 0 to 26){
            val encoded = Cipher.encode(text, i)
            println("Key " + i + " => " + encoded )
        }
    }
}