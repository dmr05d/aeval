(declare-rel inv (Int Int))
(declare-var x Int)
(declare-var x1 Int)
(declare-var y Int)
(declare-var y1 Int)
(declare-var z Int)

(declare-rel fail ())

(rule (=> (> x y) (inv x y)))

(rule (=> 
    (and 
        (inv x y)
        (> x y)
        (= x1 (- x 1))
        (or (= y1 (- y 1)) (= y1 y))
    )
    (inv x1 y1)
  )
)

(rule (=> (and (inv x y) (> x y)) fail))

(query fail :print-certificate true)
