IDENTIFICATION DIVISION.
PROGRAM-ID. Cipher.
ENVIRONMENT DIVISION.
DATA DIVISION.
 
WORKING-STORAGE SECTION.
       01 inputString PIC x(99).
       01 numShift PIC 99.
       01 i PIC 9(3).
       01 c PIC x(1).	
PROCEDURE DIVISION.
Begin.
       SET inputString TO "HAL";
       SET numShift TO 3;
       PERFORM Encrypt.
       EXIT PROGRAM.
			
Encrypt.
       MOVE Function Upper-case(inputString) to inputString
       IF numShift >= 26
           MOVE FUNCTION MOD(numShift, 26) to numShift
       END-IF
       
       PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(inputString)
           IF inputString(i:1) IS NOT EQUAL TO SPACE
               MOVE inputString (i:1) to c
               IF (FUNCTION ORD(c) + numShift) <= FUNCTION ORD("Z")
                   MOVE FUNCTION CHAR(FUNCTION ORD(c) + numShift) to inputString (i:1)
               ELSE
                   MOVE FUNCTION CHAR(FUNCTION ORD("A") 
                   + ((FUNCTION ORD(c) + numShift) - 1) - FUNCTION ORD("Z")) to inputString (i:1)
		       END-IF
		    END-IF
		END-PERFORM
        DISPLAY inputString
       STOP RUN.
     
Decrypt.
       MOVE Function Upper-case(inputString) to inputString
		
		IF numShift >= 26
                     MOVE FUNCTION MOD(numShift, 26) to numShift
                END-IF
		
		PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(inputString)
	 		IF inputString(i:1) IS NOT EQUAL TO SPACE
				MOVE inputString (i:1) to c
				IF (FUNCTION ORD(c) - numShift) >= FUNCTION ORD("A")
					MOVE FUNCTION CHAR(FUNCTION ORD(c) - numShift) to inputString (i:1)
				ELSE
					MOVE FUNCTION CHAR(FUNCTION ORD("Z") 
					- ((numShift - 1) - (FUNCTION ORD(c) - FUNCTION ORD("A")))) to inputString (i:1)
				END-IF
			END-IF
		END-PERFORM
		DISPLAY inputString
		STOP RUN.
       
