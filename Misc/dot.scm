(define (dot a b)
         (if (or (null? a) (null? b)) 0
             (+ (* (car a) (car b)) (dot (cdr a) (cdr b)))))
