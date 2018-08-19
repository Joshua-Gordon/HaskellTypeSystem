{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Boolean where

import Base

class Not b1 b | b1 -> b
instance Not False True
instance Not True False

class Or b1 b2 b | b1 b2 -> b
instance Or True True True
instance Or True False True
instance Or False True True
instance Or False False False

class And b1 b2 b | b1 b2 -> b
instance And True True True
instance And True False False
instance And False True False
instance And False False False
