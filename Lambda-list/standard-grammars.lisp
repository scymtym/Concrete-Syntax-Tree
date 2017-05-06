(cl:in-package #:concrete-syntax-tree)

(defparameter required-parameters
  '((required-parameters <-
     (* required-parameter))))

(defparameter ordinay-optional-parameters
  '((optional-parameters <-
     keyword-optional
     (* ordinary-optional-parameter))))

(defparameter rest-parameter
  '((rest-parameter <-
     keyword-rest
     variable)))

(defparameter key-parameters
  '((key-parameters <-
     keyword-key
     (* key-parameter)
     (? key-allow-other-keys))))

(defparameter ordinary-lambda-list
  '((lambda-list <-
     (? required-parameters)
     (? optional-parameters)
     (? rest-parameter)
     (? key-parameters))))
