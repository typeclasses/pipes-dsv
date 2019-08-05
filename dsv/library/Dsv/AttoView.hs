module Dsv.AttoView
  ( attoByteStringView
  ) where

import Dsv.AttoParser
import Dsv.ByteString
import Dsv.Validation
import Dsv.ViewType

-- attoparsec
import qualified Data.Attoparsec.ByteString as A

attoByteStringView :: e -> AttoParser a -> View e ByteString a
attoByteStringView e p =
  View $ \bs ->
    case A.parseOnly (p <* A.endOfInput) bs of
      Left _ -> Failure e
      Right x -> Success x
