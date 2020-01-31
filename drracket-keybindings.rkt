#lang s-exp framework/keybinding-lang

;; Helper
(define (keymap-command-bind key command)
  (keybinding key (λ (editor evt)
                    (send (send editor get-keymap) call-function
                          command editor evt #t))))

(define (editor-method-bind key method . args)
  (keybinding key (λ (editor evt)
                    (apply dynamic-send editor method args))))

;; Bindings
(editor-method-bind "c:space" 'auto-complete)
(editor-method-bind "c:l" 'insert "λ")
(keymap-command-bind "?:a:semicolon" "uncomment")
(keymap-command-bind "d:semicolon" "comment-out")
