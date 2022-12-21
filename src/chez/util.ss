#!r6rs

(library (src chez util)
  (export run define-generator yield)
  (import (rnrs (6))
          (only (chezscheme) fprintf with-implicit))

(define (usage-and-exit code)
  (let ((port (if (zero? code) (standard-output-port) (standard-error-port))))
    (fprintf port "Usage: ~a INPUT_FILE" (car (command-line)))
    (exit code)))

(define (run f)
  (let ((args (cdr (command-line))))
    (cond ((not (= (length args) 1))
           (usage-and-exit 1))
          ((member (car args) '("help" "-h", "--help"))
           (usage-and-exit 0))
          (else
           (with-input-from-file
            (car args)
            (lambda ()
              (for-each
               (lambda (n) (display n) (newline))
               (f))))))))

(define (generator f)
  (let ((return #f) (resume #f))
    (lambda ()
      (call/cc
        (lambda (cc)
          (set! return cc)
          (if resume
              (resume #f)
              (f (lambda (value)
                   (call/cc
                    (lambda (r)
                      (set! resume r)
                      (return value)))))))))))

(define-syntax (define-generator x)
  (syntax-case x (yield)
    ((k (name args ...) body ...)
     (with-implicit (k yield)
       #'(define (name args ...)
           (generator (lambda (yield) body ...)))))))

(define-syntax (yield x)
  (syntax-violation #f "incorrect usage of yield keyword" x))


) ; end of library
