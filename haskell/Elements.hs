{-| Element functions you can use in the templates.

-}
module Elements where

import Lucid.Base
import Lucid.Html5
import Types


blocks_ :: Monad m => [Attribute] -> HtmlT m a -> HtmlT m a
blocks_ attributes = with (makeElement "div") ([ class_ "blocks" ] ++ attributes)


blocksRow_ :: Monad m => [Attribute] -> HtmlT m a -> HtmlT m a
blocksRow_ attributes = with (makeElement "div") ([ class_ "blocks__row" ] ++ attributes)


container_ :: Monad m => [Attribute] -> HtmlT m a -> HtmlT m a
container_ attributes = with (makeElement "div") ([ class_ "container" ] ++ attributes)


markdown_ :: Monad m => [Attribute] -> HtmlT m a -> HtmlT m a
markdown_ _ = (makeElement "div")


use_ :: Html ()
use_ = makeElementNoEnd "use"
