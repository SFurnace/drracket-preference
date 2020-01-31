#lang racket/base
(require racket/class quickscript)

(define (trim-empty-char-whole-file text)
  (let* ([content (send text get-text)]
         [positions (regexp-match-positions* #px"(?-s:[[:blank:]]+$)" content)])
    (when positions
      (for ([p (in-list (reverse positions))])
        (let ([s (car p)]
              [e (cdr p)])
          (send text delete s e))))))

(define-script my-trim-useless-empty-char
  #:label "trim-useless-empty-char"
  #:output-to #f
  (λ (selection #:definitions text)
    (trim-empty-char-whole-file text)))
