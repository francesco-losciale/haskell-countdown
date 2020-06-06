module Utils where

import Expr

ops :: [Op]
ops = [Add,Sub,Mul,Div]

-- auxiliary function to combine all possible four operators of the pair expressions
combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]


-- given a list, returns all possible ways to split the list in two so that appending the
-- result would return the original list, preserving the order
split :: [a] -> [([a],[a])]
split [] = []
split [_] = []
split (x:xs) = ([x],xs) : [(x:ls,rs) | (ls,rs) <- split xs]
-- split [1,2,3] = ([x],xs) : [(x:ls,rs) | (ls,rs) <- split xs]
-- split 1:[2,3] = ([x],xs) : [(x:ls,rs) | (ls,rs) <- split xs]
-- split 1:[2,3] = ([1],[2,3]) : [(1:ls,rs) | (ls,rs) <- split [2,3]]
-- split [2,3] = ([x],xs) : [(x:ls,rs) | (ls,rs) <- split xs]
-- split 2:[3] = ([2],xs) : [(2:ls,rs) | (ls,rs) <- split [3]]
-- split 2:[3] = ([2],xs) : [(2:ls,rs) | (ls,rs) <- []]
-- split 2:[3] = ([2],xs) : []
-- split 2:[3] = ([2],[3]) : []
-- split 2:[3] = [([2],[3])]
-- split 1:[2,3] = ([1],[2,3]) : [(1:ls,rs) | (ls,rs) <- split [2,3]]
-- split 1:[2,3] = ([1],[2,3]) : [(1:ls,rs) | (ls,rs) <- [([2],[3])]]
-- split 1:[2,3] = ([1],[2,3]) : [(1:[2],[3]) | ([2],[3]) <- [([2],[3])]]
-- split 1:[2,3] = ([1],[2,3]) : [(1:[2],[3])]
-- split 1:[2,3] = ([1],[2,3]) : [([1,2],[3])]
-- split 1:[2,3] = [([1],[2,3]),([1,2],[3])]
-- split [1,2,3] = [([1],[2,3]),([1,2],[3])]


-- returns all possible expressions that can be combined starting from the list of Int in input
exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls,rs) <- split ns, l <- exprs ls, r <- exprs rs, e <- combine l r]
-- exprs [1,2] = [e | (ls,rs) <- split ns, l <- exprs ls, r <- exprs rs, e <- combine l r]
-- exprs [1,2] = [e | (ls,rs) <- split [1,2], l <- exprs ls, r <- exprs rs, e <- combine l r]
-- exprs [1,2] = [e | ([1],[2]) <- split [1,2], l <- exprs ls, r <- exprs rs, e <- combine l r]
-- exprs [1,2] = [e | ([1],[2]) <- split [1,2], l <- exprs [1], r <- exprs [2], e <- combine l r]
-- exprs [1,2] = [e | e <- combine (Val 1) (Val 2)]
-- exprs [1,2] = [1+2,1-2,1*2,1/2]