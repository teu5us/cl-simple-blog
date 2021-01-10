(in-package :cl-user)
(defpackage cl-simple-blog
  (:use :cl :lucerne)
  (:export :app)
  (:documentation "Main cl-simple-blog code."))
(in-package :cl-simple-blog)
(annot:enable-annot-syntax)

;;; App

(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (asdf:system-relative-pathname :cl-simple-blog #p"assets/")
                 :path "/static/")))

;;; Templates

(djula:add-template-directory
 (asdf:system-relative-pathname :cl-simple-blog #p"templates/"))

(defparameter +index+ (djula:compile-template* "index.html"))

;;; Views

@route app "/"
(defview index ()
  (render-template (+index+)))
