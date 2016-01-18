(define pi (* 4 (atan 1)))

(define (sample_gaussian mean variance)
  (lambda ()
    (define norm (/ 1.0 2.0))
    (define u (- 1.0 (* (random 1.0) norm)))
    (define v (* (random 1.0) norm))
    (define z (* (sqrt (* -2.0 (log u))) (cos (* 2.0 pi v))))
    (+ mean (* (sqrt variance) z)))
)

(define (line m b noise) (lambda (t) (+ (* m t) b (noise))))

(define g (sample_gaussian 0 0.01))

(define l (line 2 .25 g))

(define (create_vector start stop increment)
  (if (> start stop) ’()
      (cons (list start (l start))
      (create_vector (+ start increment) stop increment))))

(define v (create_vector -1 1 0.01))

define (sum-x m)
  (if (eqv? m '()) 0
      (+ (caar m) (sum-x (cdr m)))))

(define (sum-y m)
  (if (eqv? m '()) 0
      (+ (cadar m) (sum-y (cdr m)))))

(define (sum-sqd-x m)
  (if (eqv? m '()) 0
      (+ (* (caar m) (caar m)) (sum-sqd-x (cdr m)))))

(define (sum-xy m)
  (if (eqv? m '()) 0
      (+ (* (caar m) (cadar m)) (sum-xy (cdr m)))))

(define (b m) (/ (- (sum-xy m) (/ (* (sum-x m) (sum-y m)) (length m)))
                 (- (sum-sqd-x m) (/ (* (sum-x m) (sum-x m)) (length m)))))


(define (mean-x m)
  (/ (sum-x m) (length m)))

(define (mean-y m)
  (/ (sum-y m) (length m)))

(define (a m) (- (mean-y m) (* (b m) (mean-x m))))

(define xwin (make-graphics-device 'x))


(define (plot v)
  (graphics-operation xwin 'fill-circle (car v) (cadr v) 0.01)
  () )

(define (do-plot m)
  (if (eqv? m '()) '()

  (begin (plot (car m)) (do-plot (cdr m)))))


(define (do-line m)
  (graphics-draw-line xwin -1 (+ (a m) (* (b m) -1)) 1 (+ (a m) (* (b m) 1))))

(do-plot v)

(do-line v)