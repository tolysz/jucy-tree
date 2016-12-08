module Main where

import Codec.Picture
import qualified Data.Vector.Storable as V

main = do
--   Right im <- fmap convertRGB8 <$> readImage "tree.jpg"
  Right im <- fmap convertRGB8 <$> readImage "tree2.png"
  let
    xx = imageWidth im
    yy = imageHeight im
    vim = imageData im
    pat x y = vim V.! (3 * (y * xx + x))
    zoomX = 5
    zoomY = 5
  putStrLn $ unlines [[toStar (pat x y)| x <- [0,zoomX..xx -1 ]]| y <-[0,zoomY..yy -1 ]]

toStar x = if x < 127 then '*' else ' '
