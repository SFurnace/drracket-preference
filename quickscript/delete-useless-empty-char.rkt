#lang racket/base
(require racket/class quickscript)

(define-script delete-useless-empty-char
  #:label "delete-useless-empty-char"
  #:shortcut #\\
  #:shortcut-prefix (option)
  #:output-to #f
  (λ (selection #:definitions text #:interactions i)
    (define content (send text get-text))
    (define positions (regexp-match-positions* #px"(?-s:[[:blank:]]+$)" content))
    
    (when positions
      (for ([p (in-list (reverse positions))])
        (let ([s (car p)]
              [e (cdr p)])
          (send text delete s e))))))
