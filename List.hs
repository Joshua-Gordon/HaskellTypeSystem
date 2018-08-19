{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module List where

import Base
import Letters

class Head list x | list -> x
instance Head Nil Nil
instance Head (Cons x xs) x

class Tail list xs | list -> xs
instance Tail Nil Nil
instance Tail (Cons x xs) xs

class Length list n | list -> n
instance Length Nil N0
instance (Length xs n) => Length (Cons x xs) (Succ n)

class Append a b c | a b -> c
instance Append Nil x x
instance (Append as bs cs) => Append (Cons a as) bs (Cons a cs)
