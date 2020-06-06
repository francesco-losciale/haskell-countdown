module Result where

import Expr
import Utils


type Result = (Expr,Int)

-- the expression is evaluated (using apply) only if the operator is valid on x and y

results :: [Int] -> [Result]
results [] = []
results [n] = [(Val n,n) | n > 0]
results ns = [res | (ls,rs) <- split ns, lx <- results ls, ry <- results rs, res <- combine' lx ry]

combine' :: Result -> Result -> [Result]
combine' (l,x) (r,y) = [(App o l r, apply o x y) | o <- ops, valid o x y]


-- as above, except that we use valid' here, which performs better exploiting the algebraic properties

results'' :: [Int] -> [Result]
results'' [] = []
results'' [n] = [(Val n,n) | n > 0]
results'' ns = [res | (ls,rs) <- split ns, lx <- results'' ls, ry <- results'' rs, res <- combine'' lx ry]

combine'' :: Result -> Result -> [Result]
combine'' (l,x) (r,y) = [(App o l r, apply o x y) | o <- ops, valid'' o x y]