(cl:in-package #:concrete-syntax-tree)

(define-condition structure-mismatch-error (cst-error)
  ((%pattern :initarg :pattern :reader pattern)
   (%whole-cst :initarg :whole-cst :reader whole-cst)))

(define-condition null-structure-mismatch-error (structure-mismatch-error
                                                 null-cst-required)
  ())

(define-condition cons-structure-mismatch-error (structure-mismatch-error
                                                 cons-cst-required)
  ())
