(declare-fun $desiredSpeed$2 () Real)
(declare-fun $OK$2 () Bool)

(assert (and (= $OK$2 true) (= $desiredSpeed$2 15.0)))
(check-sat)
