(define absolute ( lambda (x)
	(cond   (( < x 0) ( -  x))
		(( = x 0) 0)
		((> x 0) x)
		)
	)
)


