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

procedure encrypt(var offset: Integer);
var
  Str: string;
  Arr: array of Char;
  i: Integer;
  Len: Integer;
begin
    ClrScr;
    write('Please input a string to be encrypted => ');
    readln(Str);
    Len := Length(Str);
    SetLength(arr, Len);
    for i := 1 to Len do
        Arr[i - 1] := Str[i];
    writeln(offset);

end;

procedure decrypt;
begin
    ClrScr;
end;

procedure solve;
begin
    ClrScr;
end;

procedure main;
var action: string;
begin
    offset := 6;
    repeat
        ClrScr;
        writeln('Run "help" for a list of possible commands');
        write('What would you like to do => ');
        readln(action);
        if (action = 'help') then
            begin
                help;
                readln;
            end;
        if (action = 'encrypt') then
            begin
                encrypt(offset);
                readln;
            end;
        if (action = 'decrypt') then
            begin
                decrypt;
                readln;
            end;
        if (action = 'solve') then
            begin
                decrypt;
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