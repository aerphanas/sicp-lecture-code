#!/usr/bin/env -S chicken-csi -ss

;;; to fend an approximatin to √x
;; - make a guess guess
;; - improve the guess by averaging g and x/g
;; - keep improving the guess until it is good enough
;; - use 1 as an initial guess

(define (squarel x)
  (* x x))

(define (averagel x y)
  (/ (+ x y) 2))

(define (mean-squarel x y)
  (averagel (squarel x)
	    (squarel y)))

(define (absl x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))


(define (improvel guess x)
  (averagel guess (/ x guess)))

(define (good-enoughl? guess x)
  (< (absl (- (squarel guess) x))
     .001))

(define (tryl guess x)
  (if (good-enoughl? guess x)
      guess
      (tryl (improvel guess x) x)))

(define (sqrtl x)
  (tryl 1 x))

(define (main args)
  (print (sqrtl 10.0)))
