build:
	sbcl --load cl-raylib-demo.asd \
	     --eval '(ql:quickload :cl-raylib-demo)' \
	     --eval '(use-package :cl-raylib-demo)' \
	     --eval "(sb-ext:save-lisp-and-die #p\"cl-raylib-demo\" :toplevel #'main :executable t)"
