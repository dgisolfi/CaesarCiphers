program Cipher
  implicit none
  ! define a defualt value for the key
  integer :: offset = 10    

  ! Input string to be encrypted 
  character(3) :: str = 'HAL'
  character(3) :: og = ''
  character(3) :: encrypted = ''
  og = str

  write(*, '(2a)') 'Original string  = '//og
  
  ! Call the encrypt and concat using `//` <= why would they choose that!
  call encrypt(str, offset)
  write(*, '(2a)') 'Encrypt: '//og//' => '//str
  ! Store the encrypted value
  encrypted = str
  ! Repeat the proccess for decryption 
  call decrypt(str, offset)
  write(*, '(2a)') 'Decrypted: '//encrypted//' => '//str

  ! encrypt for [0,26]
  call solve(str, og)
  
 
contains
 
subroutine encrypt(text, shift)
  character(*), intent(inout) :: text
  integer :: shift
  integer :: i

  ! do loop, iterate through the string
  do i = 1, len(text)
    select case(text(i:i))
      case ('A':'Z')
        ! use ascii code and add the shift....thank you stack overflow
        text(i:i) = achar(modulo(iachar(text(i:i)) - 65 + shift, 26) + 65)
      case ('a':'z')
        ! do the same for lowercase leters
        text(i:i) = achar(modulo(iachar(text(i:i)) - 97 + shift, 26) + 97)
    end select
  end do
end subroutine
 
subroutine decrypt(text, shift)
  character(*), intent(inout) :: text
  integer :: shift
  integer :: i
 
  do i = 1, len(text)
    select case(text(i:i))
      case ('A':'Z')
        ! subtract the same shift interval
        text(i:i) = achar(modulo(iachar(text(i:i)) - 65 - shift, 26) + 65)
      case ('a':'z')
        ! do the same for the lil letters
        text(i:i) = achar(modulo(iachar(text(i:i)) - 97 - shift, 26) + 97)
    end select
  end do
end subroutine

subroutine solve(text, og)
  character(*), intent(inout) :: text
  character(*), intent(inout) :: og
  character(4) :: key
  integer :: i
  
  ! The easy part.....call encrypt 27 times
  do i = 0, 26
    text = og
    call encrypt(text, i)
    ! convert int to string.....I miss .lower()
    write(key, '(I2)') i 
    ! trim the key because it gets weird otherwise
    write(*, '(2a)') 'Key:'//trim(key)//' => '//text
  end do
end subroutine
 
end program Cipher