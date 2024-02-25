--
-- WOLFRAM PROJECT, 2024
-- Epitech
-- File description:
-- Main
--

import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode(ExitFailure))

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

algoRule :: Maybe Int -> String -> String
algoRule (Just 30) (x:y:z:rest)
    = rule30 x y z : algoRule (Just 30) (y:z:rest)
algoRule (Just 90) (x:y:z:rest)
    = rule90 x y z : algoRule (Just 90) (y:z:rest)
algoRule (Just 110) (x:y:z:rest)
    = rule110 x y z : algoRule (Just 110) (y:z:rest)
algoRule _ _ = []

nextLine ::  Maybe Int -> String -> String
nextLine valueRule line = ' ' : algoRule valueRule line ++ " "

repeatLines ::  Maybe Int -> String -> Maybe Int -> [String]
repeatLines _ _ (Just 0) = []
repeatLines valueRule line (Just n) =
    line : repeatLines valueRule (nextLine valueRule line) (Just (n-1))

createLineOdd :: Int -> String
createLineOdd wdwsize =
    replicate ((wdwsize - 1) `div` 2) ' '
    ++ "*" ++ replicate ((wdwsize - 1) `div` 2) ' '

createLinePair :: Int -> String
createLinePair wdwsize =
    replicate (wdwsize `div` 2) ' '
    ++ "*" ++ replicate (wdwsize `div` 2 - 1) ' '

main :: IO ()
main = do
    args <- getArgs
    if null args
        then do
        exitWith (ExitFailure 84)
        else do
            let conf = getOpts defaultConf args
            --putStrLn $ show conf
            let firstLine = if window conf `mod` 2 == 0
                then createLinePair (window conf)
                else createLineOdd (window conf)
            let line = repeatLines (rule conf) firstLine (nblines conf)
            mapM_ putStrLn line