#!r6rs

(import (rnrs (6))
        (src chez util))

; (define-generator (parse-calories)
;   (cond ((eof-object? (peek-char)) #f)
;         ((char=? (peek-char) #\newline) #f)
;         (else (yield (read)))))

(define-generator (parse-sums)
  (yield 1) (yield 2) 3)

(run
 (lambda ()
   (let ((g (parse-sums)))
     (list (g) (g) (g)))))
