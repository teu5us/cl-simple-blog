(defsystem cl-simple-blog-test
  :author "Pavel Stepanov <paulkreuzmann@gmail.com>"
  :license "MIT"
  :description "Tests for cl-simple-blog."
  :depends-on (:cl-simple-blog
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "cl-simple-blog")))))
