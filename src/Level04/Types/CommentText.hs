{-# LANGUAGE DeriveGeneric #-}

module Level04.Types.CommentText (
  CommentText,
  mkCommentText,
  getCommentText,
) where

import Level04.Types.Error (
  Error (EmptyCommentText),
  nonEmptyText,
 )

import Data.Functor.Contravariant (contramap)
import Data.Text (Text)
import Data.Aeson (ToJSON)
import Data.Aeson.Types (ToJSON(toJSON))

newtype CommentText = CommentText Text
  deriving (Show)

mkCommentText ::
  Text ->
  Either Error CommentText
mkCommentText =
  nonEmptyText CommentText EmptyCommentText

getCommentText ::
  CommentText ->
  Text
getCommentText (CommentText t) =
  t

--implement ToJSON CommentText

instance ToJSON CommentText where
  toJSON (CommentText text) = toJSON text
