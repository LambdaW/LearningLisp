(define factorial
	(lambda(n)
		(if (= n 0)
			1
			(* n (factorial (- n 1))))))

(define choose 
	(lambda (n k)
		(/(factorial n) (* (factorial (- n k)) (factorial k)))
		))

#|  You will usually need to increase the stack calls size
#|  --stack 

(choose 5 52)

#| Knowing the likelihood of having a flush hand

( / (choose 5 73) (choose 13 4) ) 

