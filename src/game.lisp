(in-package #:cl-raylib-demo)

(defvar *current-screen* :logo)

(defparameter *screen-width* 800)
(defparameter *screen-height* 450)

(defvar *trans-alpha* 0.0)
(defvar *on-transition-p* nil)
(defvar *trans-fade-out-p* nil)
(defvar *trans-from-screen* -1)
(defvar *trans-to-screen* -1)

(defun transition-to-screen (screen)
  (setq *on-transition-p* t
        *trans-fade-out-p* nil
        *trans-from-screen* *current-screen*
        *trans-to-screen* screen
        *trans-alpha* 0.0))

(defun update-transition ()
  (if (not *trans-fade-out-p*)
      ;; Fade in
      (progn
        (incf *trans-alpha* 0.05)
        (when (< 1.01 *trans-alpha*)
          (setq *trans-alpha* 1.0)
          (case *trans-from-screen*
            (:logo (unload-logo-screen)))
          (case *trans-to-screen*
            (:logo (init-logo-screen)))
          (setq *current-screen* *trans-to-screen*
                *trans-fade-out-p* t)))
      ;; Fade out
      (progn
        (decf *trans-alpha* 0.02)
        (when (< *trans-alpha* -0.01)
          (setq *trans-alpha* 0.0
                *trans-fade-out-p* nil
                *on-transition-p* nil
                *trans-from-screen* -1
                *trans-to-screen* -1)))))

(defun draw-transition ()
  (draw-rectangle 0
                  0
                  (get-screen-width)
                  (get-screen-height)
                  (fade +black+ *trans-alpha*)))

(defun update-draw-frame ()
  (if *on-transition-p*
      (update-transition)
      (case *current-screen*
        (:logo
         (update-logo-screen)
         (when (finish-logo-screen-p)
           (transition-to-screen :title)))))

    (with-drawing
      (clear-background +raywhite+)
      (case *current-screen*
        (:logo (draw-logo-screen)))

      (when *on-transition-p* (draw-transition))))

(defun main ()
  (with-window (*screen-width* *screen-height* "Demo")
    (init-logo-screen)
    (set-target-fps 60)

    ;; Main game loop
    (loop
      (if (window-should-close) (return))
      (update-draw-frame))

    (case *current-screen*
      (:logo (unload-logo-screen))))))

#+nil
(main)
