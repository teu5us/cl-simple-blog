(defsystem cl-simple-blog
  :author "Pavel Stepanov <paulkreuzmann@gmail.com>"
  :maintainer "Pavel Stepanov <paulkreuzmann@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/Teu5us/cl-simple-blog"
  :bug-tracker "https://github.com/Teu5us/cl-simple-blog/issues"
  :source-control (:git "git@github.com:Teu5us/cl-simple-blog.git")
  :depends-on (:lucerne
               :lucerne
               :lucerne-auth)
  :components ((:module "assets"
                :components
                ((:module "css"
                  :components
                  ((:static-file "style.css")))
                 (:module "js"
                  :components
                  ((:static-file "scripts.js")))))
               (:module "src"
                :serial t
                :components
                ((:file "models")
                 (:file "views"))))
  :description "A simple blog to practice CL"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op cl-simple-blog-test))))
