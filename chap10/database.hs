module Database where 

    import Data.Time
    import Data.List

    data DatabaseItem = DbString String
                      | DbNumber Integer
                      | DbDate   UTCTime
                      deriving (Eq, Ord, Show)

    theDatabase :: [DatabaseItem] 
    theDatabase =
        [ DbDate (UTCTime
        (fromGregorian 1911 5 1)
        (secondsToDiffTime 34123)) 
        , DbNumber 9001
        , DbNumber 1021
        , DbString "Hello, world!"
        , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
        ]

    filterDbDate :: [DatabaseItem] -> [UTCTime]
    filterDbDate = foldr f []
        where f (DbDate a) b = a : b
              f _ b = b

    filterDbNumber :: [DatabaseItem] -> [Integer]
    filterDbNumber = foldr f []
        where f (DbNumber a) b = a : b
              f _ b = b

    mostRecent :: [DatabaseItem] -> UTCTime 
    mostRecent = maximum . filterDbDate

    sumDb :: [DatabaseItem] -> Integer
    sumDb = sum . filterDbNumber

    -- Need average
    average xs = realToFrac (sum xs) / genericLength xs 

    avgDb :: [DatabaseItem] -> Double 
    avgDb = average . filterDbNumber

    