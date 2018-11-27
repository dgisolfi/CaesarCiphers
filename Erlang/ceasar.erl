-module(ceasar).
% Define all functions and how many parama they take
-export([main/0, offset/2, encrypt/2, decrypt/2, solve/3]).

% offset a single char by the key, if the key is out of range
% just return back the given char
offset(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
offset(Char, _Key) ->
  Char.
 
% Using Basically what I learned from ML, conver the string to chars
% and using map pass each element of the list to the offset function 
% one at a time.
encrypt(Str, Key) ->
  lists:map(fun(Char) -> offset(Char, Key) end, Str).

% negate the key and call encrypt
decrypt(Str, Key) ->
  encrypt(Str, -Key).

% Base case -> if the limit has been reached stop looping...
solve(Str, Cur, Lim) when Cur == Lim+1 ->
  io:fwrite("Done\n");
% Otherwise call encrypt, print the result and keep looping
solve(Str, Cur, Lim) ->
  C = Cur + 1,
  Encrypted = encrypt(Str, Cur),
  io:format("Ceasar ~p: ~s~n", [Cur ,Encrypted]),
  solve(Str, C, Lim).
 
main() ->
  OG = "HAL",
  Key = 6,

  Encrypted = encrypt(OG, Key),
  Decrypted = decrypt(Encrypted, Key),

  % Printing stuff is quite ugly :(
  io:format("Original  ---> ~s~n", [OG]),
  io:format("Encrypted ---> ~s~n", [Encrypted]),
  io:format("Decrypted ---> ~s~n", [Decrypted]),
  solve(OG, 0, 26).