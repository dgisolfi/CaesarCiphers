Sub Encrypt(text As String, key As Integer)
  Dim temp As Integer
  For i As Integer = 0 To Len(text) 
  ' get one char of the string
    Select Case As Const text[i] 
    ' Check if char is upper case
      Case 65 To 90   
        ' Shift and store in c as a placeholder 
        temp = text[i] + key
        If temp > 90 Then temp -= 26
          text[i] = temp
      ' Check if char is lower case
      Case 97 To 122
        temp = text[i] + key
        If temp > 122 Then temp -= 26
          ' Assign the value back to its index in the string
          text[i] = temp
    End Select
  Next
End Sub

Sub Decrypt(text As String, key As Integer)
  Dim temp As Integer
  For i As Integer = 0 To Len(text) 
  ' get one char of the string
  Select Case As Const text[i] 
  Case 65 To 90    
    ' Shift and store in c as a placeholder 
    temp = text[i] - key
    If temp < 65 Then temp += 26
      text[i] = temp
  ' Check if char is lower case
  Case 97 To 122
    temp = text[i] - key
    If temp < 97 Then temp += 26
      ' Assign the value back to its index in the string
      text[i] = temp
  End Select
  Next
End Sub

Sub Solve(og As String, text As String)
  for i As Integer = 0 to 25
    ' Run the encrypt function 26 times and print each time
    text = og
    Encrypt text, i
    Print "Encrypted:" + str(i) + " " + og + " -> " + text
  Next
End Sub

Dim As String text = "HAL" 
Dim As String og = text
Dim As Integer offset = 6 
Dim As String Encrypted

Print "Original -> "; text
Encrypt text, offset
Print "Encrypted:" + str(offset) + " " + og + " -> " + text
Encrypted = text
Decrypt text, offset
Print "Decrypted:" + str(offset) + " " + Encrypted + " -> " + text
Print "SOLVE:"
Solve og, text
Sleep