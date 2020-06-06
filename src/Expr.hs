module Expr where


data Op = Add | Sub | Mul | Div

instance Show Op where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

valid'' :: Op -> Int -> Int -> Bool
valid'' Add x y = x <= y
valid'' Sub x y = x > y
valid'' Mul x y = x /= 1 && y /= 1 && x <= y
valid'' Div x y = y /= 1 && x `mod` y == 0

apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y


data Expr = Val Int | App Op Expr Expr

instance Show Expr where
    show (Val n)    = show n
    show (App op left right) = brak left ++ show op ++ brak right
                               where
                                brak (Val n) = show n
                                brak expr    = "(" ++ show expr ++ ")"

-- given an expression, returns all the numbers used in it
values :: Expr -> [Int]
values (Val n) = [n]
values (App _ left right) = values left ++ values right

-- given an expression, evaluate it and return the result
eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App op left right) = [apply op x y | x <- eval left,
                                           y <- eval right,
                                           valid op x y]