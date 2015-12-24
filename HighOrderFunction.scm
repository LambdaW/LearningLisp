(define gauss-sum
		(lambda(n) 
			(/( * n (+ n 1))2)
			)
		)


(define factorial
	(lambda(n)
		(if (= n 0)
			1
			(* n (factorial (- n 1))))))


#| Here in the following function, we use a high-order function
#| Having a function as argument, and another function as return 


(define (accumulate  f)
    (lambda (n) 
        (if (equal? f *) (factorial n)
        (gauss-sum n)
        )))



