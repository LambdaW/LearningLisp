(define average( lambda ( x y) (/ ( + x y) 2)))

(define square ( lambda (x) (* x x )))

(define mean-average
	(lambda (x y) 
		(average (square x) (square y))))

