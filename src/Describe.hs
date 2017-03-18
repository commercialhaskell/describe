{-# LANGUAGE TemplateHaskell #-}

-- | Describe Haskell code.

module Describe where

import Language.Haskell.TH

-- | Describe a quoted thing.
describe :: Q Exp -> Q Exp
describe m = do
  e <- m
  [|putStrLn $(stringE (pprint e))|]
