(declare-rel inv (Int Int Int) )
(declare-var a Int)
(declare-var a1 Int)
(declare-var b Int)
(declare-var b1 Int)
(declare-var q Int)
(declare-var q1 Int)

(rule 
	(=> 
		(and 
			(<= -524287 q)
			(>= q 524287)
			(<= -524287 a)
			(>= a 524287)
			(<= -524287 b)
			(>= b 524287)
		)
		(inv a b q)
	)
)
(rule 
    (=>
        (and 
            (inv a b q)
            (> q 0)
            (= q1 (+ q a -1))
            (= a1 (- (* 3 a) (* 4 b) ))
            (= b1 (+ (* 4 a) (* 3 b) ))
        )  
        (inv a1 b1 q1)
    )
)
