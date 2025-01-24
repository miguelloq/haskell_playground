module Play.Data.Book where

{-
    data Flexibilidade = Rigido |  Pouco |  Flexivel deriving (Show,Eq,Ord, Bounded, Enum)

    Show: Permite transformar o tipo em String, logo printar
    
    Eq: Permite usar o operador == e a função elem, 
            porém os tipos de dados tem que fazer parte de Eq tambem
    Ex: Rigido == Pouco -> False

    Ord: Permite usar operadores <,>,<=,>= e compare, 
            ordem importa na declaracao de valores
    Ex: Rigido > Pouco = False , Pouco > Rigido = True, Rigido `compare` Pouco = LT
    
    Bounded: Permite usar a função minBound e maxBound, 
            ordem importa na declaracao de valores
    Ex: minBound :: Flexibilidade = Rigido, maxBound :: Flexibilidade = Flexivel

    Enum: Permite usar a função succ, pred e fazer lista de intervalores,
            caso não tenha vai dar Exception,ordem importa na declaracao de valores 
    Ex: succ Rigido = Pouco , pred Flexivel = Pouco , pred Rigido = throw Exception , 
            [Rigido..Flexivel] = [Rigido,Pouco,Flexivel]
    
    
-}

--Tipos com construtor de valor nomeado
data Car = Car {
        company::String,
        model::String,
        year::Int
} deriving (Show)

--Voce pode fazer destruring para pegar os nomes
name::Car->String
name (Car{company=company,model=m}) = "Meu carro se chama " ++ company ++ " " ++ m
{- -}

--Usando foldr para criar uma List hand-made
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq)
gen::[a]->List a
gen = foldr Cons Empty

--Voce pode fazer pattern matching com os valores do construtor de valor 
foo::List a->String
foo Empty = "Ta vazia"
foo (Cons a Empty) = "Tem um elemento"
foo _ = "Tem mais de 1 elemento"