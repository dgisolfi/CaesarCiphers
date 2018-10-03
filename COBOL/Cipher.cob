IDENTIFICATION DIVISION.
PROGRAM-ID. Cipher.
ENVIRONMENT DIVISION.
DATA DIVISION.
 
*> Define all Global Variables
WORKING-STORAGE SECTION.
       01 str PIC x(3).
       01 og PIC x(3).
       01 encrypted PIC x(3).
       01 offset PIC 99.
       01 Counter PIC 99. 
       01 i PIC 9(3).
       01 c PIC x(1).

*> Have no idea what im diving but the manuel says to do it 
PROCEDURE DIVISION.
*> Subprogram (Basically my MAIN)
Begin.
       *> Assign the original values and default key
       SET str TO "HAL";
       SET og TO str;
       SET offset TO 3;
       
       *> For comparison     
       DISPLAY FUNCTION CONCATENATE("Original ------> " str)
       *> Run Encrypt on the defualt
       PERFORM Encrypt.
       SET encrypted TO str;
       *> Using the encrypted version, decrypt
       PERFORM Decrypt.

       *> To solve run through the subprogram 26 times    
       SET Counter TO 0;
       SET offset TO 0;
       DISPLAY "Solve:"
       PERFORM Solve UNTIL Counter = 26.

       STOP RUN.
			
Encrypt.
       MOVE Function Upper-case(og) to og
       *> If the offset is 26, cycle back to 0    
       IF offset >= 26
           MOVE FUNCTION MOD(offset, 26) to offset
       END-IF
       *> This is basically a For loop I had to read the manual to find this....    
       PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(og)
        *>    Get rid of extra spaces
           IF og(i:1) IS NOT EQUAL TO SPACE
            *>  For each char in OG(original) Add the offset
               MOVE og (i:1) to c
               IF (FUNCTION ORD(c) + offset) <= FUNCTION ORD("Z")
                   MOVE FUNCTION CHAR(FUNCTION ORD(c) + offset) to str (i:1)
               ELSE
                   MOVE FUNCTION CHAR(FUNCTION ORD("A") 
                   + ((FUNCTION ORD(c) + offset) - 1) - FUNCTION ORD("Z")) to str (i:1)
		       END-IF
		    END-IF
		END-PERFORM
         *> Show the User the diff
        DISPLAY FUNCTION CONCATENATE("Encrypted " og " -> " str " with Key:" offset).
     
Decrypt.
       MOVE Function Upper-case(str) to str
       
       IF offset >= 26
           MOVE FUNCTION MOD(offset, 26) to offset
       END-IF
		
	   PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
	      IF str(i:1) IS NOT EQUAL TO SPACE
		    MOVE str (i:1) to c
			IF (FUNCTION ORD(c) - offset) >= FUNCTION ORD("A")
				MOVE FUNCTION CHAR(FUNCTION ORD(c) - offset) to str (i:1)
			ELSE
				MOVE FUNCTION CHAR(FUNCTION ORD("Z") 
				- ((offset - 1) - (FUNCTION ORD(c) - FUNCTION ORD("A")))) to str (i:1)
			END-IF
	      END-IF
	   END-PERFORM
	   DISPLAY FUNCTION CONCATENATE("Decrypted " encrypted " -> " str " with Key:" offset).
       
Solve.
       ADD 1 TO Counter;
       ADD 1 TO offset;
       PERFORM Encrypt.
       STOP RUN.