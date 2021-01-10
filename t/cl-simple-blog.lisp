(in-package :cl-user)
(defpackage cl-simple-blog-test
  (:use :cl :fiveam))
(in-package :cl-simple-blog-test)

(def-suite tests
  :description "cl-simple-blog tests.")
(in-suite tests)

(test simple-test
  (is
   (equal 1 1))
  (is-true
   (and t t)))

(run! 'tests)
