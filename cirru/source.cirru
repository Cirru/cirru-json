
map
  :number 1
  :string :2
  :null #null
  :bool #false
  :lambda #lambda

  :array $ array 1 2 3
  :mixed-arrat $ array 1 :2 3

  :empty-map $ map
  :map $ map (:a 1)
  :map2 $ map $ :a 2
  :nested-map $ map
    :a $ array 1 2 3
    :b $ map (:a 2) (:b 3)