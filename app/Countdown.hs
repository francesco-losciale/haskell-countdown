module Countdown where

import Solution
import Expr
import Combinations

main :: IO ()
main = print (solutions'' [1,3,7,10,25,50] 765)

-- $ stack build ------- check out the specific ghc switch -main-is added in .cabal file
-- $ stack exec haskell-countdown-exe