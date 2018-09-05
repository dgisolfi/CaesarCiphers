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

procedure encrypt;
var
  str: string;
  og: string;
  i: Integer;
begin
    write('Please input a string to be encrypted => ');
    readln(str);
    og := str;

    for i := 1 to Length(str) do
        if Ord(str[i]) >= Ord('Y') then
            str[i] := Chr(Ord(str[i]) - 24)
        else
            str[i] := Chr(Ord(str[i]) + 2);
    writeln(og + ' -> ' + str);
end;

procedure decrypt;
var
  str: string;
  og: string;
  i: Integer;
begin
    write('Please input a string to be decrypted => ');
    readln(str);
    og := str;

    for i := 1 to Length(str) do
        if Ord(str[i]) >= Ord('Y') then
            str[i] := Chr(Ord(str[i]) + 24)
        else
            str[i] := Chr(Ord(str[i]) - 2);
    writeln(og + ' -> ' + str);
end;

procedure solve;
begin
    ClrScr;
end;

procedure main;
var 
action: string;
offset: Integer;
begin
    offset := 6;
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
                encrypt;
                writeln('Press Enter to Continue');
                readln;
            end;
        if (action = 'decrypt') then
            begin
                decrypt;
                writeln('Press Enter to Continue');
                readln;
            end;
        if (action = 'solve') then
            begin
                decrypt;
                writeln('Press Enter to Continue');
                readln;
            end;
    until (action = 'exit');
end;

var
    offset: Integer;
begin 
    ClrScr;
    intro;
    main;
end.