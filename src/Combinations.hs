module Combinations where


-- returns all possible combinations of excluding or including an element in a list
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs

-- returns all possible ways of inserting a new element in a list
interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

-- returns all permutation of a list, which are given by all possible reorderings of the elements
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

-- returns all possible choices from a list, which are given by all possible way of selecting zero or more elements
-- in any order. it can be defined simply by considering all permutations of all subsequences
choices :: [a] -> [[a]]
choices = concat . map perms . subs