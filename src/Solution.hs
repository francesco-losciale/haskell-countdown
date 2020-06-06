module Solution where

import Expr
import Combinations

-- given a list of numbers and a target number, check if an expression in input is a valid solution,
-- 1. check that the numbers used in the expressions as a list are contained in all the possible choices of the numbers given in input
-- 2. check the result of eval against the target
solution :: Expr -> [Int] -> Int -> Bool
solution expr numbers target = elem (values expr) (choices numbers) && eval expr == [target]

