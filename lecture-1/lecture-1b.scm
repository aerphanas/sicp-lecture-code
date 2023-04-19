#!/usr/env -S chicken-csi -ss


(define (sq x)
  (* x x))

;; sum of square
(define (sos x y)
  (+ (sq x) (sq y)))

;;; Linear Iteration
;; time = O(n)
;; space = O(1)
(define (add-rec1 x y)
  (if (= x 0)
      y
      (add-rec1 (sub1 x) (add1 y))))

;;; Linear Recursion
;; time = O(n)
;; space = O(n)
(define (add-rec2 x y)
  (if (= x 0)
      y
      (add1 (add-rec2 (sub1 x) y))))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
	 (fib (- n 2)))))

(define (main args))
