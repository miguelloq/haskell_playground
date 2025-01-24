module Play.TypeLevel where

data Nat = Zero | Add1 Nat deriving (Show,Eq)

inc::Nat->Nat
inc Zero = Add1 Zero
inc a@(Add1 _) = Add1 a

gen::Int->Nat
gen 0 = Zero
gen n = Add1 . gen $ (n - 1)