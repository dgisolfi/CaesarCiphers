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
    writeln('> quit');
end;

procedure encrypt;
begin
    ClrScr;

end;

procedure decrypt;
begin
    ClrScr;

end;

procedure solve;
begin
    ClrScr;

end;

procedure quit;
begin
    ClrScr;
    writeln('Goodbye');
    Halt (1);
end;

procedure main;
var action: string;
begin
    ClrScr;
    writeln('Run "help" for a list of possible commands');
    write('What would you like to do => ');
    readln(action);
    if (action = 'help') then
        help;
        main;
    // else if (action = 'encrypt') then
    //     encrypt;
    //     main;
    // if (action = 'decrypt') then
    //     decrypt;
    //     main;
    // if (action = 'solve') then
    //     solve;
    //     main;
    // if (action = 'quit') then
    //     quit;
end;

begin
    ClrScr;
    intro;
    main;
end.