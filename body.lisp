(cl:in-package #:concrete-syntax-tree)

(defmethod separate-ordinary-body ((body atom-cst) &key (listify-body t))
  (declare (ignore listify-body))
  (assert (null body))
  (values '() '()))

(defmethod separate-ordinary-body ((body cons-cst) &key (listify-body t))
  (loop with declarations = '()
        for remaining = body then (rest remaining)
        until (or (null remaining)
                  (atom (first remaining))
                  (not (eq (raw (first (first remaining))) 'declare)))
        do (push (first remaining) declarations)
        finally (return (values (reverse declarations)
                                (if listify-body
                                    (listify remaining)
                                    remaining)))))

(defmethod separate-function-body ((body atom-cst) &key (listify-body t))
  (declare (ignore listify-body))
  (assert (null body))
  (values '() '()))

(defmethod separate-function-body ((body cons-cst) &key (listify-body t))
  (loop with declarations = '()
        with documentation = nil
        for remaining = body then (rest remaining)
        until (or (null remaining)
                  (and (atom (first remaining))
                       (not (stringp (raw (first remaining)))))
                  (and (stringp (raw (first remaining)))
                       (or (not (cl:null documentation))
                           ;; if a string is the last form, it's not a docstring
                           (null (rest remaining))))
                  (and (consp (first remaining))
                       (not (eq (raw (first (first remaining))) 'declare))))
        do (if (stringp (raw (first remaining)))
               (setf documentation (first remaining))
               (push (first remaining) declarations))
        finally (return (values (reverse declarations)
                                documentation
                                (if listify-body
                                    (listify remaining)
                                    remaining)))))
