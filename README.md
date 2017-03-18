# describe

Describe Haskell code using template Haskell

## Example

The main use-case is figuring out how GHC parses infix operators:

``` haskell
 :describe x <$> y <*> z <* p <|> k
(((x Data.Functor.<$> y) GHC.Base.<*> z) GHC.Base.<* p) GHC.Base.<|> k
```

Tada!

## Setup

Install the package by running `sh global-install.sh`.

Add the following to your `~/.ghci` or just run it in your current session:

``` haskell
:set -package describe
import Describe
:set -XTemplateHaskell
:def describe \e -> return ("$(describe [| " ++ e ++ " |])")
```

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
