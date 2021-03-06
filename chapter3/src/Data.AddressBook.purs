module Data.AddressBook where

import Prelude
import Control.Plus (empty)
import Data.List (List(..), filter, head)
import Data.Maybe (Maybe)

type Entry
  = { firstName :: String
    , lastName :: String
    , address :: Address
    }

type Address
  = { street :: String
    , city :: String
    , state :: String
    }

type AddressBook
  = List Entry

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <> entry.firstName <> ": " <> showAddress entry.address

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ", " <> addr.state

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry book = Cons entry book -- same as "insertEntry entry = Cons entry", same as "insertEntry = Cons"

-- findEntry :: String -> String -> AddressBook -> Maybe Entry
-- findEntry firstName lastName book = head (filter filterEntry book)
--   where
--   filterEntry :: Entry -> Boolean
--   filterEntry entry = entry.firstName == firstName && entry.lastName == lastName
findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head <<< filter filterEntry -- use function composition
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

address = { street: "123 Fake St.", city: "Faketown", state: "CA" }

entry = { firstName: "John", lastName: "Smith", address: address }

book = insertEntry entry emptyBook
