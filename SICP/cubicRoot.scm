 
(define (square x) (* x x)) 

(define (cube-root-iter guess prev-guess x) 
	(if (good-enough? guess prev-guess) 
		guess 
		(cube-root-iter (improve guess x) guess x))) 

(define (improve guess x) 
	(average3 (/ x (square guess))  guess guess)) 

(define (average3 x y z ) 
	(/ (+ x y z) 3)) 

(define (good-enough? guess prev-guess) 
	(< (abs (- guess prev-guess)) (abs (* guess 0.0001)))) 

(define (cube-root x) 
	(cube-root-iter 1.0 0.0 x)) 
(define (cube-root x) 
	((if (< x 0) - +)(cube-root-iter (improve 1.0 (abs x)) 1 (abs x)))) 