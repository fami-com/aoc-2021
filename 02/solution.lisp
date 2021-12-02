(in-package #:aoc-2021-02)

(defparameter *input-pathname* #.(make-pathname :name "input"
                                                :type "txt"
                                                :defaults (or *compile-file-pathname*
                                                              *load-truename*)))

(defun run-part1 ()
  (with-open-file (f *input-pathname*)
    (loop :with direction := nil
          :with amount := nil
          :with horizontal := 0
          :with vertical := 0
          :for pos := 0
          :for line := (read-line f nil nil)
          :while line
          :do (multiple-value-setq (direction pos) (read-from-string line))
              (setq amount (read-from-string line nil nil :start pos))
          :if (eq direction 'forward)
            :do (incf horizontal amount)
          :else :if (eq direction 'up)
            :do (decf vertical amount)
          :else :if (eq direction 'down)
            :do (incf vertical amount)
          :finally (return (* horizontal vertical)))))

#|
(run-part1)
|#

(defun run-part2 ()
  (with-open-file (f *input-pathname*)
    (loop :with direction := nil
          :with amount := nil
          :with horizontal := 0
          :with vertical := 0
          :with aim := 0
          :for pos := 0
          :for line := (read-line f nil nil)
          :while line
          :do (multiple-value-setq (direction pos) (read-from-string line))
              (setq amount (read-from-string line nil nil :start pos))
          :if (eq direction 'forward)
            :do (incf horizontal amount)
                (incf vertical (* amount aim))
          :else :if (eq direction 'up)
            :do (decf aim amount)
          :else :if (eq direction 'down)
            :do (incf aim amount)
          :finally (return (* horizontal vertical)))))

#|
(run-part2)
|#
