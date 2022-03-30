import Control.Exception (evaluate)
import Data.Int (Int64)
import Data.Time
import Data.Time.Clock.POSIX (utcTimeToPOSIXSeconds)

msSinceEpoch :: UTCTime -> Int64
msSinceEpoch = floor . (1000 *) . nominalDiffTimeToSeconds . utcTimeToPOSIXSeconds

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

n :: Int
n = 40

main :: IO ()
main = do
  x <- getCurrentTime
  r <- evaluate $ fib n
  y <- getCurrentTime
  putStrLn $ "fib(" <> show n <> ") = " <> show r
  putStrLn $ "time    = " <> show (msSinceEpoch y - msSinceEpoch x) <> " milliseconds"
