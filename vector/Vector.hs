module Lib
    ( Vector (..), sumVec, subVec, multVec, integralDivVec, dotProduct, magnitude
    ) where

data Vector a = Vector2 { x :: a,
                          y :: a 
                        } |
                Vector3 { x :: a,
                          y :: a,
                          z :: a
                        }
    deriving (Show)

memberToMemberOperation :: Num a => (a -> a -> a) -> Vector a -> Vector a -> Vector a
memberToMemberOperation operation (Vector2 x1 y1) (Vector2 x2 y2) = 
    Vector2 (operation x1 x2) (operation y1 y2)
memberToMemberOperation operation (Vector3 x1 y1 z1) (Vector3 x2 y2 z2) = 
    Vector3 (operation x1 x2) (operation y1 y2) (operation z1 z2)

sumVec :: Num a => Vector a -> Vector a -> Vector a
sumVec v1 v2 = memberToMemberOperation (+) v1 v2 

subVec :: Num a => Vector a -> Vector a -> Vector a
subVec v1 v2 = memberToMemberOperation (-) v1 v2 

multVec :: Num a => Vector a -> Vector a -> Vector a
multVec v1 v2 = memberToMemberOperation (*) v1 v2

divVec :: Fractional a => Vector a -> Vector a -> Vector a
divVec v1 v2 = memberToMemberOperation (/) v1 v2

integralDivVec :: Integral a => Vector a -> Vector a -> Vector a
integralDivVec v1 v2 = memberToMemberOperation (div) v1 v2

dotProduct :: Num a => Vector a -> Vector a -> a
dotProduct (Vector2 x1 y1) (Vector2 x2 y2) = x1 * x2 + y1 * y2
dotProduct (Vector3 x1 y1 z1) (Vector3 x2 y2 z2) = x1 * x2 + y1 * y2 + z1 * z2

magnitude :: Floating a => Vector a -> a
magnitude v1 = sqrt $ dotProduct v1 v1
