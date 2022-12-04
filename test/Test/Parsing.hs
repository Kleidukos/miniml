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
  assertBool "Type of the declaration" $
    decl.mTypeSignature
      == Just
        ( TVar
            (Range{start = AlexPn 19 1 20, stop = AlexPn 22 1 23})
            ( Name
                { range = Range{start = AlexPn 19 1 20, stop = AlexPn 22 1 23}
                , content = "int"
                }
            )
        )
