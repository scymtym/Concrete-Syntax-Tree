(cl:in-package #:concrete-syntax-tree)

;;; Handles NIL terminating a proper list as well as any other atom in
;;; case of a dotted list.
(defmethod cstify ((list t))
  (make-instance 'atom-cst :raw list))

(defmethod cstify ((list cl:cons))
  (make-instance 'cons-cst
                 :first (cl:car list)
                 :rest (cstify (cdr list))
                 :raw list #+no (cl:cons (raw (car list)) (raw rest))
                 ))
