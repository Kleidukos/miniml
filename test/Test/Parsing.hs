module Test.Parsing where

import Test.Tasty
import Test.Tasty.HUnit

import Lexer
import Parser

spec :: TestTree
spec =
  testGroup
    "Parsing tests"
    [ testCase "Parse simple declaration" parseDecl
    ]

parseDecl :: Assertion
parseDecl = do
  let Right [decl] = runAlex "let id (x : int) : int = x" parseMiniML
  assertBool "Name of the declaration" (decl.name.content == "id")
