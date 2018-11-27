-module(ceasar).
-export([main/0, offset/2, key/1, encrypt/2, decrypt/2, solve/3]).

offset(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
offset(Char, _Key) ->
  Char.
 
% key: normalize key.
key(Key) when Key < 0 ->
  26 + Key rem 26;
key(Key) when Key > 25 ->
  Key rem 26;
key(Key) ->
  Key.

encrypt(Str, Key) ->
  [lists:map(fun(Char) -> offset(Char, Key) end, Str)].

decrypt(Str, Key) ->
  % Key = key(-k),
  encrypt(Str, -Key).

solve(Str, Cur, Lim) ->
  c = cur + 1,
  encrypted = encrypt(Str, Cur),
  io:format("Ceasar :~s~n", [encrypted]),
  if 
    cur == Lim -> 
      io:fwrite("Done"); 
    true -> 
      solve(Str, c, Lim);
  end.

 
main() ->
  OG = "HAL",
  Key = 6,
  % Encode = key(Key),
  % Decode = key(-Key),

  Encrypted = encrypt(OG, Key),
  Decrypted = decrypt(Encrypted, Key),

  io:format("Original  ---> ~s~n", [OG]),
  io:format("Encrypted ---> ~s~n", [Encrypted]),
  io:format("Decrypted ---> ~s~n", [Decrypted]),
  solve(OG, 0, 26).