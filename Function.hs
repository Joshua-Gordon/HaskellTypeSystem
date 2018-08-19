{-# OPTIONS_GHC -fno-warn-missing-methods #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Function where

import Base

class Apply f x y | f x -> y

class Map f xs ys | f xs -> ys
instance Map f Nil Nil
instance (Apply f x y, Map f xs ys) => Map f (Cons x xs) (Cons y ys)

class AppendIf pred x ys r | pred x ys -> r
instance AppendIf True x ys (Cons x ys)
instance AppendIf False x ys ys

class Filter f xs ys | f xs -> ys
instance Filter f Nil Nil
instance (Apply f x t,
          Filter f x ys,
          AppendIf t x ys r)
          => Filter f (Cons x xs) r
