{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Base where

nil = undefined

data Nil
data Cons x xs

data True
data False
data N0
data Succ n

type N1 = Succ N0
type N2 = Succ N1
type N3 = Succ N2
type N4 = Succ N3
type N5 = Succ N4
type N6 = Succ N5
type N7 = Succ N6
type N8 = Succ N7
type N9 = Succ N8
type N10 = Succ N9
type N11 = Succ N10
type N12 = Succ N11
type N13 = Succ N12
type N14 = Succ N13
type N15 = Succ N14
type N16 = Succ N15
type N17 = Succ N16
type N18 = Succ N17
type N19 = Succ N18
type N20 = Succ N19
