# describe

Describe Haskell code in GHCi

## Example

The main use-case is figuring out how infix operators are parsed:

``` haskell
> :describe x <$> y <|> h <* p <*> k
(x Data.Functor.<$> y) GHC.Base.<|> ((h GHC.Base.<* p) GHC.Base.<*> k)
```

Tada!

## Setup (Linux, macOS)

Install the package by running:

    git clone https://github.com/commercialhaskell/describe.git
    cd describe
    sh global-install.sh # requires stack

## Setup (Windows)

From a PowerShell terminal, install the package by running:

    git clone https://github.com/commercialhaskell/describe.git
    cd describe
    .\global-install.ps1 # requires stack

## Pitfalls

If you use something out of scope, you'll see

    <<Non-variable/constructor in infix context>>

Just import the right thing and try again:

``` haskell
> :describe x <$> y <*> z <* p <|> k
(((x Data.Functor.<$> y) GHC.Base.<*> z) GHC.Base.<* p) <<Non-variable/constructor in infix context>> k
> import Control.Applicative
> :describe x <$> y <*> z <* p <|> k
(((x Data.Functor.<$> y) GHC.Base.<*> z) GHC.Base.<* p) GHC.Base.<|> k
```
