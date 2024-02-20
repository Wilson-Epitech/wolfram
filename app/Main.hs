--
-- WOLFRAM PROJECT, 2024
-- Epitech
-- File description:
-- Main
--

import System.Environment (getArgs)

data Conf = Conf {
    rule :: Maybe Int,
    start :: Int,
    nblines :: Maybe Int,
    window :: Int,
    move :: Maybe Int
} deriving Show

defaultConf :: Conf
defaultConf = Conf {
    rule = Nothing,
    start = 0,
    nblines = Nothing,
    window = 80,
    move = Nothing
}

getOpts :: Conf -> [String] -> Conf
getOpts conf [] = conf
getOpts conf ("--rule":valuerule:rest)
    = getOpts conf {rule = Just (read valuerule)} rest
getOpts conf ("--start":valuestart:rest)
    = getOpts conf {start = read valuestart} rest
getOpts conf ("--lines":valuelines:rest)
    = getOpts conf {nblines = Just (read valuelines)} rest
getOpts conf ("--window":valuewindow:rest)
    = getOpts conf {window = read valuewindow} rest
getOpts conf ("--move":valuemove:rest)
    = getOpts conf {move = Just (read valuemove)} rest
getOpts conf _ = conf

rule30 :: Char -> Char -> Char -> Char
rule30 '*' '*' '*' = ' '
rule30 '*' '*' ' ' = ' '
rule30 '*' ' ' '*' = ' '
rule30 ' ' ' ' ' ' = ' '
rule30 '*' ' ' ' ' = '*'
rule30 ' ' '*' '*' = '*'
rule30 ' ' '*' ' ' = '*'
rule30 ' ' ' ' '*' = '*'
rule30 _ _ _ = ' '

rule90 :: Char -> Char -> Char -> Char
rule90 '*' '*' '*' = ' '
rule90 '*' '*' ' ' = '*'
rule90 '*' ' ' '*' = ' '
rule90 '*' ' ' ' ' = '*'
rule90 ' ' '*' '*' = '*'
rule90 ' ' '*' ' ' = ' '
rule90 ' ' ' ' '*' = '*'
rule90 ' ' ' ' ' ' = ' '
rule90 _ _ _ = ' '

rule110 :: Char -> Char -> Char -> Char
rule110 '*' '*' '*' = ' '
rule110 '*' '*' ' ' = '*'
rule110 '*' ' ' '*' = '*'
rule110 '*' ' ' ' ' = ' '
rule110 ' ' '*' '*' = '*'
rule110 ' ' '*' ' ' = '*'
rule110 ' ' ' ' '*' = '*'
rule110 ' ' ' ' ' ' = ' '
rule110 _ _ _ = ' '

algoRule :: String -> String
algoRule (x:y:z:rest) = rule30 x y z : algoRule (y:z:rest)
algoRule _ = []

nextLine :: String -> String
nextLine line = ' ' : algoRule line ++ " "

repeatLines :: String -> Int -> [String]
repeatLines _ 0 = []
repeatLines line n = line : repeatLines (nextLine line) (n-1)

main :: IO ()
main = do
    args <- getArgs
    let conf = getOpts defaultConf args
    --putStrLn $ show conf
    let firstLine = "         *          "
    let lines = repeatLines firstLine 10
    mapM_ putStrLn lines