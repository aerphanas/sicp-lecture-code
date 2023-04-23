module Main where

squarel :: Num a => a -> a
squarel x = x * x

averagel :: Fractional a => a -> a -> a
averagel x y = (x + y) / 2

meanSquarel :: Fractional a => a -> a -> a
meanSquarel x y = averagel (squarel x) (squarel y)

absl :: (Ord t, Num t) => t -> t
absl n
    | n < 0     = -n
    | otherwise = n

improvel :: Fractional a => a -> a -> a
improvel guess x = averagel guess (x / guess)

goodEnough :: (Ord a, Fractional a) => a -> a -> Bool
goodEnough guess x = absl (squarel guess - x) < 0.001

tryl :: (Ord t, Fractional t) => t -> t -> t
tryl guess x
  | goodEnough guess x = guess
  | otherwise = tryl (improvel guess x) x

sqrtl :: Double -> Double
sqrtl = tryl 1

main :: IO ()
main = (print . sqrtl) 10
