# Erlang Log

### 2018-11-24
* I have so many questions for Joe Armstrong, here are a few...
  * Why on earth would you force variables to start with Uppercase characters?
  * Why would you not implement better errors for detecting variables with lowercase characters?
  * Why the commas? I'm not a fan of semicolons but I have to admit they look better than commas.
* Instead of telling you that you've used a lowercase variables erlang just mentions that the left and right side of the assignment does not match, which leads one to believe you're returning the wrong type rather than just breaking syntax with your variable name.
* I'm not a fan of the almost assumed return value in many of these languages like Erlang and ML, instead of saying return you just kinda leave it there, it's not very readable.
* The only thing I have working is a function to offset the char given a key, progress but not much...

### 2018-11-27

* I'm back with a vengeance!
* I have the encrypt function working now at least, this compiler is very paticular, some of the code was only working in main and not encrypt
* Also decrypt is done cuz passing a negative key is easy
* Finally its time for solve, gonna do it recursively again to embrace function programming(also I figured the logic of it out back in the Haskell one so I'm just kind rewriting the same function)
* Trying to have an if check in the Solve function for my base case, it will not compile here it is...

```erlang
% I put this snippet in as this is not how the final version looks
solve(Str, Cur, Lim) ->
  C = Cur + 1,
  Encrypted = encrypt(Str, Cur),
  io:format("Ceasar ~p: ~s~n", [Cur ,Encrypted]),
  if
      Cur == Lim -> 
        io:fwrite("Done\n");
      ture ->  
          solve(Str, C, Lim);
  end.
```


* So looking at this above snippet there should be no error, this is a simple if expression, the true acts as an else clause. However this will not compile, I used multiple resources to find this syntax, why doesnt it work?
* The reason I later found out is that apparantly the conditions must return a value(neither does) as well as that each return value must be of the same type. This limits if expressions so much that I just refused to use them.
* The solution I found was to use what I can only describe as function cases. (also used in the offset function)
* Erlang may be powerful, but I would need a very good reason to use it at all.

