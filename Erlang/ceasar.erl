-module(ceasar).
-export([main/0, offset/2, key/1, encrypt/2, decrypt/2]).

offset(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
offset(Char, _Key) ->
  Char.
 
%% key: normalize key.
key(Key) when Key < 0 ->
  26 + Key rem 26;
key(Key) when Key > 25 ->
  Key rem 26;
key(Key) ->
  Key.

encrypt(Str, Key) ->
  encrypted = lists:map(fun(Char) -> offset(Char, Key) end, Str),
  io:format("Encrypted => ~s~n", [encrypted]).

decrypt(Str, Key) ->
  decrypted = lists:map(fun(Char) -> offset(Char, Key) end, Str),
  io:format("Decrypted => ~s~n", [decrypted]).
 
main() ->
  OG = "fucker",
  Key = 6,
  Encode = key(Key),
  Decode = key(-Key),

  Encrypted = lists:map(fun(Char) -> offset(Char, Encode) end, OG),
  Decrypted = lists:map(fun(Char) -> offset(Char, Decode) end, encrypted),

  io:format("Plaintext => ~s~n", [OG]),
  io:format("Encrypted => ~s~n", [Encrypted]),
  io:format("Decrypted => ~s~n", [Decrypted]).