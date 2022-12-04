module Main where

import System.IO
import Test.Parsing qualified as Parsing
import Test.Tasty

main :: IO ()
main = do
  hSetBuffering stdout LineBuffering
  defaultMain $ testGroup "MiniML Tests" specs

specs :: [TestTree]
specs =
  [ Parsing.spec
  ]
