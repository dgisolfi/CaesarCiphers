program Cipher
    ! Defualt Value
    integer, parameter :: offset = 10
    character(*), parameter :: str = ""
    ! WRITE(*,*) 'Input a string =>' 
    read(*), str
    PRINT *, str


!   character(43) :: message = "The five boxing wizards jump quickly"
 



!   write(*, "(2a)") "Original message  = ", message
!   call encrypt(message)
!   write(*, "(2a)") "Encrypted message = ", message
!   call decrypt(message)
!   write(*, "(2a)") "Decrypted message = ", message
 
contains
 
subroutine encrypt(str)
  character(*), intent(inout) :: str
  integer :: i
 
  do i = 1, len(str)
    select case(str(i:i))
      case ('A':'Z')
        str(i:i) = achar(modulo(iachar(str(i:i)) - 65 + offset, 26) + 65)
      case ('a':'z')
        str(i:i) = achar(modulo(iachar(str(i:i)) - 97 + offset, 26) + 97)
    end select
  end do
end subroutine
 
subroutine decrypt(str)
  character(*), intent(inout) :: str
  integer :: i
 
  do i = 1, len(str)
    select case(str(i:i))
      case ('A':'Z')
        str(i:i) = achar(modulo(iachar(str(i:i)) - 65 - offset, 26) + 65)
      case ('a':'z')
        str(i:i) = achar(modulo(iachar(str(i:i)) - 97 - offset, 26) + 97)
    end select
  end do
end subroutine

subroutine solve(str)
  character(*), intent(inout) :: str
  integer :: i

end subroutine
 
end program Cipher