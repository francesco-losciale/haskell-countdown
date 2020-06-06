module Solution where

import Expr
import Combinations

-- given a list of numbers and a target number, check if an expression in input is a valid solution,
-- 1. check that the numbers used in the expressions as a list are contained in all the possible choices of the numbers given in input
-- 2. check the result of eval against the target
solution :: Expr -> [Int] -> Int -> Bool
solution expr numbers target = elem (values expr) (choices numbers) && eval expr == [target]


--brute force solution

-- given a list, returns all possible ways to split the list in two so that appending the result would return the original list, preserving the order
split :: [a] -> [([a],[a])]
split [] = []
split [_] = []
split (x:xs) = ([x],xs) : [(x:ls,rs) | (ls,rs) <- split xs]


-- returns all possible expressions whose list of values is precisely a given list
exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls,rs) <- split ns,
                l <- exprs ls,
                r <- exprs rs,
                e <- combine l r]

-- auxiliary function to combine all possible four operators of the pair expressions
combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [Add,Sub,Mul,Div]

-- all possible expressions that solve an instance of the countdown problem, by first generating
-- all expressions over each choice from the given list of numbers, and then selecting
-- those expressions that successfully evaluate to give the target
solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]
