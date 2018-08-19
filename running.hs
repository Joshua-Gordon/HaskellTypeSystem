{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

import Base

class MultipleOfThree n t | n -> t
instance MultipleOfThree N0 True
instance MultipleOfThree N1 False
instance MultipleOfThree N2 False
instance MultipleOfThree n t => MultipleOfThree (Succ (Succ (Succ n))) t

class MultipleOfFive n t | n -> t
instance MultipleOfFive N0 True
instance MultipleOfFive N1 False
instance MultipleOfFive N2 False
instance MultipleOfFive N3 False
instance MultipleOfFive N4 False
instance MultipleOfFive n t => MultipleOfFive (Succ (Succ (Succ (Succ (Succ n))))) t

class ToFizzBuzz n t1 t2 fb | n t1 t2 -> fb
instance ToFizzBuzz n True True FizzBuzz
instance ToFizzBuzz n True False Buzz
instance ToFizzBuzz n False True Fizz
instance ToFizzBuzz n False False n

data Fizz
data Buzz
data FizzBuzz

class AddToList n list list' | n list -> list'
instance AddToList N0 l l
instance (MultipleOfFive n t,
          MultipleOfThree n t',
          ToFizzBuzz n t t' out,
          AddToList n list (Cons out list')) => AddToList (Succ n) list list'

type Input = N15
class Answer o where
  solution :: Input -> o
instance (AddToList Input ans o) => Answer ans
