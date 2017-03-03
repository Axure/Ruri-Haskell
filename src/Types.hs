module Types where

import Data.Map

data RuriType = RuriNil | RuriFalse | RuriTrue 
            | RuriNumber Int | RuriString String 
            | RuriList [RuriType] | RuriVector [RuriType] | RuriHashMap (Map String RuriType) 
            | RuriAtom

ruriEquals:: RuriType -> RuriType -> Bool
ruriEquals RuriNil RuriNil = True
ruriEquals RuriFalse RuriFalse = True
ruriEquals RuriTrue RuriTrue = True
ruriEquals (RuriNumber a) (RuriNumber b) = a == b
ruriEquals (RuriString a) (RuriString b) = a == b
ruriEquals (RuriList a) (RuriList b) = a == b
ruriEquals (RuriVector a) (RuriVector b) = a == b
ruriEquals a b = case (a) of
    RuriHashMap _ -> case (b) of
        RuriHashMap _ -> a == b
        _ -> False
    _ -> False

instance Eq RuriType where
    a == b = ruriEquals a b
