(declare-rel inv (Int Int))
(declare-var x Int)
(declare-var x1 Int)
(declare-var y Int)
(declare-var y1 Int)
(declare-rel fail ())

(rule (inv x y ))

; needs two refinements

(rule (=> 
    (and 
        (inv x y )
        (> x 0)
        (> y 0)
        (or (and (= x1 (- x 1)) (= y1 (+ y 1)))
            (and (= x1 (+ x 1)) (= y1 (- y 1))))
    )
    (inv x1 y1 )
  )
)

(rule (=> (and (inv x y ) (> x 0) (> y 0)) fail))

(query fail :print-certificate true)
