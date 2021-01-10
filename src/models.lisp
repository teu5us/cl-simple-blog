(in-package :cl-user)
(defpackage cl-simple-blog.models
  (:use :cl :lucerne)
  (:export #:user #:user-name #:user-full-name #:user-password)
  (:export #:post #:post-title #:post-text)
  (:export #:add-user #:add-post)
  (:documentation "Models for cl-simple-blog."))
(in-package :cl-simple-blog.models)

;;; Storage

(defparameter *users* (make-hash-table :test #'equal))

(defparameter *posts* (list))

;;; Models

(defclass user ()
  ((username :accessor user-username
             :initarg :username
             :type string)
   (full-name :accessor user-full-name
              :initarg :full-name
              :type string)
   (email :accessor user-email
          :initarg :email
          :type string)
   (password :accessor user-password
             :initarg :password
             :type string))
  (:documentation "User model."))

(defmethod print-object ((object user) stream)
  (with-slots (username full-name email) object
    (format stream "USER:~%~2TUsername: ~A~%~2TFull Name: ~A~%~2TEmail: ~A~%"
            username full-name email)))

(defclass post ()
  ((title :accessor post-title
          :initarg :title
          :type string)
   (text :accessor post-text
         :initarg :text
         :type string))
  (:documentation "Post model."))

(defmethod print-object ((object post) stream)
  (with-slots (title text) object
    (format stream "POST~%~0:T>>>>~%~0:TTitle: ~A~%~0:TText: ~A~%~0:T>>>>~%"
            title text)))

;;; Functions

(defun add-user (&key username full-name email password)
  "Add new user.
TODO: check if user exists
TODO: ensure password is long enough
TODO: check email"
  (setf (gethash username *users*)
        (make-instance 'user
                        :username username
                        :full-name full-name
                        :email email
                        :password (cl-pass:hash password))))

(defun add-post (&key title text)
  "Add new post."
  (push (make-instance 'post :title title :text text) *posts*))
