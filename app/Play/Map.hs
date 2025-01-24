module Play.Map (findInPhoneBook) where

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing

findInPhoneBook :: String -> Maybe String
findInPhoneBook = flip findKey phoneBook
  where
    phoneBook =
        [ ("mari", "555-2938")
        , ("carol", "452-2928")
        , ("patrícia", "493-2928")
        , ("luciana", "205-2928")
        , ("aline", "939-8282")
        , ("camila", "853-2492")
        ]

--

type ContactName = String
type ContactNumber = String
type Contact = (ContactName,ContactNumber)
type PhoneBook = [Contact]

findInAPhoneBook:: ContactName -> PhoneBook -> Maybe ContactNumber
findInAPhoneBook = findKey 