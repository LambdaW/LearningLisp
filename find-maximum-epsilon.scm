(define double
	(lambda (x)
		(* 2 x)
		))

(define bigger
	(lambda (x y)
		( if (> x y) x
			y)))



(define ( find-maximum-epsilon f low high acc)
		(if (= low high) (f low) 
		(bigger (f low) (find-maximum-epsilon f  (+ low 1)  high  acc )))) 



	(find-maximum-epsilon (lambda (x) (*  -1.5 (double x))) 10 20 1)