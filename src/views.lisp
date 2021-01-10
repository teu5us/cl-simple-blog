(in-package :cl-user)
(defpackage cl-simple-blog.views
  (:use :cl :lucerne)
  (:export :app)
  (:documentation "Main cl-simple-blog code."))
(in-package :cl-simple-blog.views)
(annot:enable-annot-syntax)

;;; App

(defapp app
  :middlewares (clack.middleware.session:<clack-middleware-session>
                (clack.middleware.static:<clack-middleware-static>
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
