module Level04.Types.Topic (
  Topic,
  mkTopic,
  getTopic,
) where

import Data.Aeson (ToJSON)
import Data.Functor.Contravariant (contramap)
import Data.Text (Text)

import Level04.Types.Error (Error (EmptyTopic), nonEmptyText)
import Data.Aeson.Types (ToJSON(toJSON))

newtype Topic = Topic Text
  deriving (Show)

mkTopic ::
  Text ->
  Either Error Topic
mkTopic =
  nonEmptyText Topic EmptyTopic

getTopic ::
  Topic ->
  Text
getTopic (Topic t) =
  t

--implement ToJSON Topic
-- Se : https://hackage.haskell.org/package/aeson-2.1.1.0/docs/Data-Aeson.html

-- Maybe ToRow or/and ToField?

instance ToJSON Topic where
  toJSON (Topic text) = toJSON text
