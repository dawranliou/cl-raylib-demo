(in-package #:cl-raylib-demo)

(defvar *frame-counter* 0)
(defvar *finish-screen* 0)

(defun init-title-screen ()
  (setq *frame-counter* 0
        *finish-screen* 0))

(defun update-title-screen ()
  (when (is-key-pressed +key-enter+)
    (setq *finish-screen* 2)))

(defun draw-title-screen ()
  (draw-rectangle 0 0 (get-screen-width) (get-screen-height) +green+)
  (draw-text "TITLE SCREEN" 20 10 20 +darkgreen+)
  (draw-text "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN" 120 220 20 +darkgreen+))

(defun unload-title-screen ())

(defun finish-title-screen ()
  *finish-screen*)

