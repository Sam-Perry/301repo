#lang slideshow


(define (pyramid s1)
  (define two-s (hc-append s1 s1))
  (vc-append s1 two-s)
  )
(pyramid (circle 10))

(define (nested-pyramid s1 d)
  [ d (pyramid s1)]
  )

(nested-pyramid (circle 10) 2)

