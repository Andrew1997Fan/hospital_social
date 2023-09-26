
(cl:in-package :asdf)

(defsystem "detection_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :detection_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection2DTrig" :depends-on ("_package_Detection2DTrig"))
    (:file "_package_Detection2DTrig" :depends-on ("_package"))
  ))