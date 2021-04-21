#lang slideshow

(define (permutations size)
  (let ((elements (list #t #f)))
  (if (zero? size)
      '(())
      (append-map (lambda (p)
                    (map (lambda (e) (cons e p)) elements))
                  (permutations (sub1 size))))))

; P => Q
(define (implies P Q)
  (or (not P)
      Q))

; P => (Q => R)
(define (expr1 P Q R)
  (implies P (implies Q R)))

; Q => (P => R)
(define (expr2 Q P R)
  (implies Q (implies P R)))

; R => (Q => P)
(define (expr3 R Q P)
  (implies R (implies Q P)))

; P => Q
(define (expr4 P Q)
  (implies P Q))

; ~Q => ~P
(define (expr5 P Q)
  (implies (not Q)(not P)))

; P ^ (R ^ Q)
(define (expr6 P R Q)
  (and P (and R Q)))

; P v (R v Q)
(define (expr7 P R Q)
  (or P (or R Q)))

; (P ^ R) v (Q ^ S)
(define (expr8 P R Q S)
  (or (and R P) (and Q S)))

; (P ^ R) ^ (S v ~Q)
(define (expr9 P R S Q)
  (and (and P R)
       (or S (not Q))))

(define (truth-table expr)
  (map (lambda (z)
         (apply expr z))
         (permutations (procedure-arity expr))))

; equivalent function
(define (equivalent? exprA exprB)
  (equal? (truth-table exprA) (truth-table exprB)))
