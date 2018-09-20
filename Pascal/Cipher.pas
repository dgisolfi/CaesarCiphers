// Daniel Nicolas Gisolfi
// 2018-09-03
program Cipher;
uses Crt;

// Define procedures
procedure intro;
begin
    writeln('**Welcome to the Pascal Ceaser Cipher**');
end;

procedure help;
begin
    ClrScr;
    writeln('Pascal Ceaser Cipher Help');
    writeln('The following are all possible commands: ');
    writeln('> help');
    writeln('> encrypt');
    writeln('> decrypt');
    writeln('> solve[break]');
    writeln('> exit');
end;

function encrypt(var str: string; var offset: Integer): string;
var
  i: Integer;
begin
    // each character is incremented 6 characters within ASCII
    for i := 1 to Length(str) do
        // check if value of current char is any lower or uppercase char
        case str[i] of
            'A'..'Z': str[i] := chr(ord('A') + (ord(str[i]) - ord('A') + offset) mod 26);
            'a'..'z': str[i] := chr(ord('a') + (ord(str[i]) - ord('a') + offset) mod 26);
        end;
        encrypt := str;
end;

function decrypt(var str: string; var offset: Integer): string;
var
  i: Integer;
begin
    // each character is unincremented 6 characters within ASCII
    for i := 1 to Length(str) do
        // check if value of current char is any lower or uppercase char
        case str[i] of
            'A'..'Z': str[i] := chr(ord('A') + (ord(str[i]) - ord('A') - offset + 26) mod 26);
            'a'..'z': str[i] := chr(ord('a') + (ord(str[i]) - ord('a') - offset + 26) mod 26);
        end;
    decrypt := str;
end;

procedure main;
var 
action: string;
offset: Integer;
str: string;
og: string;
i: Integer;
maxShift: Integer;

begin
    // defualt value for key
    offset := 10;
    repeat
        writeln('Run "help" for a list of possible commands');
        write('What would you like to do => ');
        readln(action);
        if (action = 'help') then
            begin
                help;
                writeln('Press Enter to Continue');
                readln;
                ClrScr;
            end;
        if (action = 'encrypt') then
            begin
                // request input to be encrypted
                write('Please input a string to be encrypted => ');
                readln(str);
                og := str;
                // request the desired key for encryption
                write('Please input the key to be used => ');
                readln(offset);
              
                // show original vs result
                writeln(og + ' -> ' + encrypt(str, offset));
                writeln('Press Enter to Continue');
                readln;
            end;
        if (action = 'decrypt') then
            begin
                // request input to be encrypted
                write('Please input a string to be decrypted => ');
                readln(str);
                og := str;
                // request the desired key for decryption
                write('Please input the key to be used => ');
                readln(offset);
              
                // show original vs result
                writeln(og + ' -> ' + decrypt(str, offset));
                writeln('Press Enter to Continue');
                readln;
            end;
        
        if (action = 'solve') then
            begin
                // request input to be encrypted
                write('Please input a string to be solved for => ');
                readln(str);
                og := str;
                // request the desired key for decryption
                write('Please input the Max Shift Value => ');
                readln(offset);
                maxShift:= offset;


                for i := 0 to maxShift do
                    begin
                        offset := i;
                        str := og;
                        writeln('Caesar ', offset, ' -> ' + encrypt(str, offset));
                    end;

                writeln('Press Enter to Continue');
                readln;
            end;

    until (action = 'exit');
end;

begin 
    ClrScr;
    intro;
    main;
end.
