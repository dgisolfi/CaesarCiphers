# CaesarCiphersCMPT331
All Caesar Cipher programs for Theory of Programming CMPT331

All compiling is done in Docker containers, for development environments for all the used languages here visit [LanguageDevEnvironments](https://github.com/dgisolfi/LanguageDevEnvironments). Logs and Commentary are available for each Language completed. All logs and program files are found in their respective folders.

## Caesar Ciphers

All Ciphers will have the ability to do the following:

**encrypt** a string using a Caesar cipher.

**decrypt** a string using a Caesar cipher.

**solve** (break) a Caesar cipher.

## Running Ciphers

To run any of the caser ciphers the makefile included in the directory can be used. in the same directory as the makefile use the following format to execute a command:`make LanguageName`

Example: `make basic`

The result will be a volume mounted container with all necessary files for the cipher program. To use any of the programs first `cd` into the proper directory and then follow the guides for each language compiler found [LanguageDevEnvironments](https://github.com/dgisolfi/LanguageDevEnvironments) run the programs.