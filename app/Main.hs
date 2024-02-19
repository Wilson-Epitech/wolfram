module Main (main) where

import Lib
import System.Environment

-- data Conf = Rule(Maybe int) | Start | Lines | Window | Move (Maybe int)

-- defaultConf :: Conf
-- defaultConf = Conf {
--     Rule = Nothing,
--     Start = 0,
--     Lines = Nothing,
--     Window = 80,
--     Move = Nothing
-- }

-- getOpts :: Conf -> [String] -> Maybe Conf
-- getOpts = Conf {
--      Rule = ,
--      Start = ,
--      Lines = ,
--      Window = ,
--      Move = ,
-- }

findCharValue :: Char -> Char -> Char -> Char
findCharValue c1 c2 c3
    | c1 == '*' && c2 == '*' && c3 == '*' = ' '  
    | c1 == '*' && c2 == '*' && c3 == ' ' = ' '  
    | c1 == '*' && c2 == ' ' && c3 == '*' = ' ' 
    | c1 == ' ' && c2 == ' ' && c3 == ' ' = ' '
    | c1 == '*' && c2 == ' ' && c3 == ' ' = '*'
    | c1 == ' ' && c2 == '*' && c3 == '*' = '*'
    | otherwise = '*'

writeFirstLine:: IO()
writeFirstLine = putStrLn "  *  "

main :: IO [()]
main = do
     writeFirstLine
     args <- getArgs
     mapM putStrLn args

