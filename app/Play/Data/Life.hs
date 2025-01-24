module Play.Data.Life (
    Emprego(..), 
    Humor(..), 
    --Conhecimento(..), 
    empregoToHumor, 
    humorToConhecimento, 
    conhecimentoToNota 
) where

data Emprego = Estagio | Junior | Senior deriving (Show,Eq)
data Humor = Tranquilo | Cansado | Estressado deriving (Show,Eq)
data Conhecimento = Iniciante | Experiente deriving (Show,Eq)

empregoToHumor::Emprego->Humor
empregoToHumor Estagio = Tranquilo
empregoToHumor Junior = Cansado
empregoToHumor Senior = Estressado

humorToConhecimento::Humor->Conhecimento
humorToConhecimento Tranquilo = Iniciante
humorToConhecimento Cansado = Iniciante
humorToConhecimento Estressado = Experiente

conhecimentoToNota::Conhecimento->Integer
conhecimentoToNota Iniciante = 6
conhecimentoToNota Experiente = 10