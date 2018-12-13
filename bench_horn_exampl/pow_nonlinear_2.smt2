(declare-rel ImportInt (Int Int Int Int))
(declare-rel ExportInt (Int Int Int Int))
(declare-rel Inverse (Int Int Int Int))
(declare-rel InverseLoop (Int Int Int Int Int Int Int))
(declare-rel Exp2 (Int Int))
(declare-rel fail ())
(declare-rel Bad ())
(declare-var pow Int)
(declare-var prev_pow Int)
(declare-var out Int)
(declare-var out0 Int)
(declare-var prev_out Int)
(declare-var r Int)
(declare-var log_r Int)
(declare-var modulus Int)
(declare-var r_mod_modulus Int)
(declare-var n Int)
(declare-var log_sum Int)
(declare-var log_sum_p Int)
(declare-var x Int)
(declare-var y Int)
(declare-var x_p Int)
(declare-var y_p Int)
(declare-var x_pp Int)
(declare-var y_pp Int)
(declare-var out_x Int)
(declare-var out_y Int)
(declare-var inv_r Int)
(declare-var cond Bool)
(declare-var inv_modulus Int)


(rule (=> (= pow 0) (Exp2 pow 1)))
(rule (=> (and (> pow 0) (= prev_pow (- pow 1)) (Exp2 prev_pow prev_out) (= out (* 2 prev_out))) (Exp2 pow out)))

(rule (=>
  (and (Exp2 log_r r) (= r_mod_modulus (mod r modulus)) (= out (mod (* (mod n modulus) r_mod_modulus) modulus)))
  (ImportInt n log_r modulus out))) 

(rule (=> (= log_sum 0) (InverseLoop log_sum modulus r x y x y)))
(rule (=>
  (and (> log_sum 0) (= log_sum_p (- log_sum 1))
       (= cond (not (= (mod x 2) 0)))
       (= x_p (ite cond (+ x modulus) x))
       (= y_p (ite cond (+ y (* 2 r)) y))
       (= x_pp (div x_p 2)) (= y_pp (div y_p 2))
       (InverseLoop log_sum_p modulus r x_pp y_pp out_x out_y))
  (InverseLoop log_sum modulus r x y out_x out_y)))
(rule (=>
  (and (= log_sum (+ log_r 1))
       (Exp2 log_r r)
       (= x 1)
       (= y 0)
       (InverseLoop log_sum modulus r x y out_x out_y)
       (= out (* 2 out_x)))
  (Inverse log_r modulus out out_y)))

(rule (=>
  (and (Inverse log_r modulus inv_r inv_modulus) (= out (mod (* n inv_r) modulus)))
  (ExportInt n log_r modulus out)))

(rule (=> (and (ImportInt 20 10 997 out) (ExportInt out 10 997 out0) (not (= out0 20))) fail))

(query fail)
