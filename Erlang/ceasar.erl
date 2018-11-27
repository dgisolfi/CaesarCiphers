-module(ceasar).
-export([main/0, offset/2, encrypt/2, decrypt/2]).

offset(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
offset(Char, _Key) ->
  Char.
 
encrypt(Str, Key) ->
  lists:map(fun(Char) -> offset(Char, Key) end, Str).

decrypt(Str, Key) ->
  encrypt(Str, Key).
 
main() ->
  OG = "HAL",
  Key = 6,

  Encrypted = encrypt(OG, Key),
  Decrypted = decrypt(Encrypted, -Key),

  io:format("Original  ---> ~s~n", [OG]),
  io:format("Encrypted ---> ~s~n", [Encrypted]),
  io:format("Decrypted ---> ~s~n", [Decrypted]).
  % solve(OG, 0, 26).