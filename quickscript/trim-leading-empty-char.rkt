#lang racket/base
(require racket/class quickscript)

(define (trim-empty-char-leading-line text)
  (let* ([start (send text find-newline 'backward (send text get-start-position) 0)]
         [end (send text find-newline)]
         [line (send text get-text start end)])
    (cond
      [(regexp-match? #px"^\\s*$" line)
       (send text insert #\newline start end)]
      [else (send text insert (regexp-replace #px"^\\s*" line "") start end)])
    (send text set-position start)))

(define-script my-trim-leading-empty-char
  #:label "trim-leading-empty-char"
  #:shortcut #\\
  #:shortcut-prefix (option)
  #:output-to #f
  (λ (selection #:definitions text)
    (trim-empty-char-leading-line text)))
