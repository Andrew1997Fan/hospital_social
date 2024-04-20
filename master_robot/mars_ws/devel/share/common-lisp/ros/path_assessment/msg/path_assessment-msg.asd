
(cl:in-package :asdf)

(defsystem "path_assessment-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Assessment" :depends-on ("_package_Assessment"))
    (:file "_package_Assessment" :depends-on ("_package"))
  ))