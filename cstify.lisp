(cl:in-package #:concrete-syntax-tree)

;;; Handles NIL terminating a proper list as well as any other atom in
;;; case of a dotted list.
(defmethod cstify ((thing t))
  (make-instance 'atom-cst :raw thing))

(defmethod cstify ((thing cl:cons))
  (make-instance 'cons-cst :first (cstify (cl:car thing))
                           :rest (cstify (cl:cdr thing))
                           :raw thing))
