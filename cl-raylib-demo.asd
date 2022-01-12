(in-package #:cl-user)

(defpackage #:cl-raylib-demo-asd
  (:use :cl :asdf))

(in-package #:cl-raylib-demo-asd)

(asdf:defsystem #:cl-raylib-demo
  :description "A demo game powered by raylib"
  :author "Daw-Ran Liou <hi@dawranliou.com>"
  :license  "MIT"
  :version "0.0.1"
  :depends-on (:cl-raylib)
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "screen-logo")
               (:file "screen-title")
               (:file "game")))
