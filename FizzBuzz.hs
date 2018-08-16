{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

nil = undefined

data Nil
data Cons x xs

data True
data False
data Z
data S n

type N0 = Z
type N1 = S N0
type N2 = S N1
type N3 = S N2
type N4 = S N3
type N5 = S N4
type N6 = S N5
type N7 = S N6
type N8 = S N7
type N9 = S N8
type N10 = S N9
type N11 = S N10
type N12 = S N11
type N13 = S N12
type N14 = S N13
type N15 = S N14
type N16 = S N15
type N17 = S N16
type N18 = S N17
type N19 = S N18
type N20 = S N19

class MultipleOfThree n t | n -> t
instance MultipleOfThree Z True
instance MultipleOfThree N1 False
instance MultipleOfThree N2 False
instance MultipleOfThree n t => MultipleOfThree (S (S (S n))) t

class MultipleOfFive n t | n -> t
instance MultipleOfFive Z True
instance MultipleOfFive N1 False
instance MultipleOfFive N2 False
instance MultipleOfFive N3 False
instance MultipleOfFive N4 False
instance MultipleOfFive n t => MultipleOfFive (S (S (S (S (S n))))) t

class ToFizzBuzz n t1 t2 fb | n t1 t2 -> fb
instance ToFizzBuzz n True True FizzBuzz
instance ToFizzBuzz n True False Buzz
instance ToFizzBuzz n False True Fizz
instance ToFizzBuzz n False False n

data Fizz
data Buzz
data FizzBuzz

class AddToList n list list' | n list -> list' where
  solution :: n -> list -> list'
instance AddToList Z l l where solution = nil
instance (MultipleOfFive n t,
          MultipleOfThree n t',
          ToFizzBuzz n t t' out,
          AddToList n list (Cons out list')) => AddToList (S n) list list'
