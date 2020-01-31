#lang s-exp framework/keybinding-lang

(define (command-bind key command)
  (keybinding
   key
   (λ (editor evt)
     (send (send editor get-keymap) call-function
           command editor evt #t))))

(keybinding "c:space" (λ (editor event) (send editor auto-complete)))
(keybinding "c:l"     (λ (editor event) (send editor insert "λ")))
(command-bind "?:a:semicolon" "uncomment")
(command-bind "d:semicolon" "comment-out")
