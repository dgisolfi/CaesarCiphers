' ENCRYPT '

dim shared user_input as string

' Define how many times the ciper will shit the alphabet '
dim shared key as integer
key = 6

' dim shared alpha as string "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

' Declare all subs '
declare sub main
declare sub help_screen
declare sub encrypt
declare sub decrypt
declare sub solve
declare sub quit

declare sub split

' INTRO '
print "**Welcome to the BASIC Ceaser Cipher**"

sub main
    dim action as string

    cls
  
    ' while
    print "Run 'help' for a list of possible commands"
    input "What would you like to do => " , action

    if action = "help" then
        print "**calling help screen**" + !"\n"
        help_screen
    elseif LCase(action) = "encrypt" then
        encrypt
    elseif LCase(action) = "quit" then
        quit
    else
        print "not a valid command"
        main
    end if 
end sub

sub help_screen
    cls
    print "BASIC Ceaser Cipher Help"
    print "The following are all possible commands: "
    print "> help" + !"\n" + "> encrypt" + !"\n" + "> decrypt" + !"\n" + "> solve[break]" + !"\n" + "> quit"
    print !"\n" + "press enter to get back to main"
    sleep
    main
end sub

sub encrypt
    cls
    dim result as string

    Request user input'
    input "Please input a string to be encrypted => " , user_input
    print len(user_input)
    ' for i as integer = 0 to (len(user_input) - 1)
    dim x as integer
    x =  Asc(user_input) + 1
    print x
    result = Chr(x) 
    print result
    ' next
    sleep
    main

end sub

sub decrypt
    cls
    'Request user input'
    input "Please input a string to be decrypted => " , user_input
    sleep

end sub

sub solve
    cls
    'Request user input'
    input "Please input a string to be solve => " , user_input
    sleep

end sub

sub quit
    print "Goodbye"
    sleep
end sub 

main