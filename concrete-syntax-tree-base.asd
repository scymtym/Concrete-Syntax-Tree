(cl:in-package #:asdf-user)

;;;; A CONCRETE SYNTAX TREE (or CST for short) is a representation of
;;;; a Common Lisp expression such that the source location of each
;;;; object in the expression can be associated with that object.
;;;;
;;;; This system contains functions for manipulating such
;;;; representations in various ways.
;;;;
;;;; Notice that there is obviously no way to distinguish between a
;;;; CST and a Common Lisp expression that happens to be an atom in
;;;; the form of a CST.  Client code that uses functions of this
;;;; system must therefore be sure that CSTs are being used.

(defsystem :concrete-syntax-tree-base
  :depends-on (:acclimation)
  :serial t
  :components
  ((:file "packages")
   (:file "generic-functions")
   (:file "cst")
   (:file "cons-cst")
   (:file "listify")
   (:file "cstify")
   (:file "cst-from-expression")
   (:file "reconstruct")
   (:file "declarations")
   (:file "body")
   (:file "list-structure")
   (:file "bindings")
   (:file "conditions")

   (:file "condition-reporters-english")))
