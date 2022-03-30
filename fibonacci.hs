import Data.Time
import Data.Time.Clock.POSIX ( utcTimeToPOSIXSeconds )
import Data.Int

msSinceEpoch :: UTCTime -> Int64
msSinceEpoch = floor . (1000 *) . nominalDiffTimeToSeconds . utcTimeToPOSIXSeconds

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = do
  x <- getCurrentTime
  _ <- print $ fib 40
  y <- getCurrentTime
  putStrLn $ show (msSinceEpoch y - msSinceEpoch x) <> "ms"
