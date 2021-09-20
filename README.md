# haskell-polybius-square

This Haskell app implements the encoding and decoding of a String using the Polybius Square cipher, using a 5x5 table to map characters to numbers based on their position on the table.

https://en.wikipedia.org/wiki/Polybius_square

Dependencies:
- `ghc version 8.6.5`: `sudo apt install haskell-platform`
- `cabal version 2.4.0.0`: `sudo apt install haskell-platform`
- `split version 0.2.3.3`: `cabal install split` or `cabal run` automatically installs it.

To compile and run on Linux: `cabal run` or `./run.sh`
