module Main where

import Solution
import Expr
import Combinations

main :: IO ()
main = do
        putStrLn $ show (App Add (Val 1) (App Mul (Val 2) (Val 3)))
        putStrLn $ show (eval (App Add (Val 2) (Val 3)))
        putStrLn $ show (eval (App Sub (Val 2) (Val 3)))
        putStrLn $ show $ subs [1,2,3]
        putStrLn $ show $ interleave 1 [2,3,4]
        putStrLn $ show $ perms [1,2,3]
        putStrLn $ show $ choices [1,2,3]

-- $ stack build
-- $ stack exec haskell-main-exe
