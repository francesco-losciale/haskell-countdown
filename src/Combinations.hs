module Combinations where


-- returns all possible combinations of excluding or including an element in a list
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss where yss = subs xs
-- subs [1,2,3] = yss ++ map (1:) yss where yss = subs [2,3]
-- subs [2,3] = yss ++ map (2:) yss where yss = subs [3]
-- subs [3] = yss ++ map (3:) yss where yss = subs []
-- subs [3] = yss ++ map (3:) yss where yss = [[]]
-- subs [3] = [[]] ++ map (3:) [[]]
-- subs [3] = [[]] ++ [[3]]
-- subs [3] = [[],[3]]
-- subs [2,3] = yss ++ map (2:) yss where yss = subs [3]
-- subs [2,3] = yss ++ map (2:) yss where yss = [[],[3]]
-- subs [2,3] = [[],[3]] ++ map (2:) [[],[3]]
-- subs [2,3] = [[],[3]] ++ [[2],[2,3]]
-- subs [2,3] = [[],[3],[2],[2,3]]
-- subs [1,2,3] = yss ++ map (1:) yss where yss = subs [2,3]
-- subs [1,2,3] = yss ++ map (1:) yss where yss = [[],[3],[2],[2,3]]
-- subs [1,2,3] = [[],[3],[2],[2,3]] ++ map (1:) [[],[3],[2],[2,3]]
-- subs [1,2,3] = [[],[3],[2],[2,3]] ++ [[1],[1,3],[1,2],[1,2,3]]
-- subs [1,2,3] = [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]


-- returns all possible ways of inserting a new element in a list
interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)
-- interleave 1 [2,3,4] = (x:y:ys) : map (y:) (interleave x ys)
-- interleave 1 (2:[3,4]) = (1:2:[3,4]) : map (2:) (interleave 1 [3,4])
-- interleave 1 [3,4] = (x:y:ys) : map (y:) (interleave x ys)
-- interleave 1 3:[4] = (1:3:[4]]) : map (3:) (interleave 1 [4])
-- interleave 1 [4] = (x:y:ys) : map (y:) (interleave x ys)
-- interleave 1 4:[] = (1:4:[]) : map (4:) (interleave 1 [])
-- interleave 1 4:[] = (1:4:[]) : map (4:) [[1]]
-- interleave 1 4:[] = (1:4:[]) : [[4,1]]
-- interleave 1 4:[] = [1,4] : [[4,1]]
-- interleave 1 4:[] = [[1,4],[4,1]]
-- interleave 1 3:[4] = (1:3:[4]]) : map (3:) (interleave 1 [4])
-- interleave 1 3:[4] = (1:3:[4]]) : map (3:) (interleave 1 4:[])
-- interleave 1 3:[4] = (1:3:[4]]) : map (3:) [[1,4],[4,1]]
-- interleave 1 3:[4] = (1:3:[4]]) : [[3,1,4],[3,4,1]]
-- interleave 1 3:[4] = [1,3,4] : [[3,1,4],[3,4,1]]
-- interleave 1 3:[4] = [[1,3,4],[3,1,4],[3,4,1]]
-- interleave 1 (2:[3,4]) = (1:2:[3,4]) : map (2:) (interleave 1 [3,4])
-- interleave 1 (2:[3,4]) = (1:2:[3,4]) : map (2:) [[1,3,4],[3,1,4],[3,4,1]]
-- interleave 1 (2:[3,4]) = (1:2:[3,4]) : [[2,1,3,4],[2,3,1,4],[2,3,4,1]]
-- interleave 1 (2:[3,4]) = [1,2,3,4] : [[2,1,3,4],[2,3,1,4],[2,3,4,1]]
-- interleave 1 (2:[3,4]) = [[1,2,3,4],[2,1,3,4],[2,3,1,4],[2,3,4,1]]
-- interleave 1 [2,3,4] = [[1,2,3,4],[2,1,3,4],[2,3,1,4],[2,3,4,1]]



-- returns all permutation of a list, which are given by all possible reordering of the elements
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))
-- perms [1,2,3] = concat (map (interleave x) (perms xs))
-- perms 1:[2,3] = concat (map (interleave 1) (perms [2,3]))
-- perms [2,3] = concat (map (interleave x) (perms xs))
-- perms 2:[3] = concat (map (interleave 2) (perms [3]))
-- perms [3] = concat (map (interleave x) (perms xs))
-- perms 3:[] = concat (map (interleave 3) (perms []))
-- perms 3:[] = concat (map (interleave 3) [[]])
-- perms 3:[] = concat (map (interleave 3) [[]])
-- perms 3:[] = concat [[[3]]]
-- perms 3:[] = [[3]]
-- perms 2:[3] = concat (map (interleave 2) (perms [3]))
-- perms 2:[3] = concat (map (interleave 2) [[3]])
-- perms 2:[3] = concat (map (interleave 2) [[3]])
-- perms 2:[3] = concat [[[2,3],[3,2]]]
-- perms 2:[3] = [[2,3],[3,2]]
-- perms 1:[2,3] = concat (map (interleave 1) (perms [2,3]))
-- perms 1:[2,3] = concat (map (interleave 1) [[2,3],[3,2]])
-- perms 1:[2,3] = concat [[[1,2,3],[2,1,3],[2,3,1]],[[1,3,2],[3,1,2],[3,2,1]]]
-- perms 1:[2,3] = [[1,2,3],[2,1,3],[2,3,1]],[[1,3,2],[3,1,2],[3,2,1]]
-- perms [1,2,3] = [[1,2,3],[2,1,3],[2,3,1]],[[1,3,2],[3,1,2],[3,2,1]]



-- returns all possible choices from a list, which are given by all possible way of selecting zero or more elements
-- in any order. it can be defined simply by considering all permutations of all subsequences
choices :: [a] -> [[a]]
choices = concat . map perms . subs
-- choices [1,2,3] = concat . map perms . subs [1,2,3]
-- choices [1,2,3] = concat . map perms [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
-- choices [1,2,3] = concat [[[]],[[3]],[[2]],[[2,3],[3,2]],[[1]],[[1,3],[3,1]],[[1,2],[2,1]],[[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]]
-- choices [1,2,3] = [[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]