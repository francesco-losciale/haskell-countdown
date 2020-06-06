module Solution where

import Utils
import Expr
import Combinations
import Result

-- given a list of numbers and a target number, check if an expression in input is a valid solution,
-- 1. check that the numbers used in the expressions as a list are contained in all
--      the possible choices of the numbers given in input
-- 2. check the result of eval against the target
solution :: Expr -> [Int] -> Int -> Bool
solution expr numbers target = elem (values expr) (choices numbers) && eval expr == [target]


-- all possible expressions that solve an instance of the countdown problem, by first generating
-- all expressions over each choice from the given list of numbers, and then selecting
-- those expressions that successfully evaluate to give the target
solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]


-- same as previous version, the validation of the operation has been moved at the moment of the
-- construction of the expression, in the combine' function
solutions' ns n = [e | ns' <- choices ns, (e,m) <- results ns', m == n]