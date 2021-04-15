#lang slideshow


(define (pyramid s1)
  (vc-append s1  (hc-append s1 s1))
  )
;(pyramid (circle 3))

; known as a Sierpinski triangle
(define (nested-pyramids s1 n)
  (if (zero? n)
    (pyramid s1) ;Get to the bottom of the recusion
    (let
        ([p (nested-pyramids s1 (- n 1))])  ;Recursively call nested-pyramids
        (vc-append p (hc-append p p))  ;draw the pyramid of pyramids as you unwind the recusive stack
      )
    )
  )
; Test cases
(nested-pyramids (circle 10) 1)
(nested-pyramids (circle 10) 2)
(nested-pyramids (circle 10) 3)
(nested-pyramids (circle 10) 4)
