map (a 1)
  b $ string "number 2"
  c $ string 2
  c2 $ string 2
  d $ array 1 2 3
  d2 $ array 1 2 3
  d3 $ array 1 2 3
  d4
    array (string 1) 2
  e $ map
  e2
    map $ a 1
  e3
    map $ a 2
  e4
    map
      a $ array 1 2 3
      b
        map (a 2) $ b 3