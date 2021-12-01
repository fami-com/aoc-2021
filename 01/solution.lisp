(in-package #:aoc-2021-01)

(defparameter *input-pathname* #.(make-pathname :name "input"
                                                :type "txt"
                                                :defaults (or *compile-file-pathname*
                                                              *load-truename*)))

(defun run-part1 ()
  (with-open-file (f *input-pathname*)
    (loop :for line := (read-line f nil nil)
          :while line
          :for value1 := (read-from-string (string-trim '(#\CR #\LF) line))
          :and value2 := value1
          :when value2
            :count (> value1 value2))))

#|
(run-part1)
|#

(defun run-part2 ()
  (with-open-file (f *input-pathname*)
    (loop :with val1 := nil
          :with val2 := nil
          :with val3 := nil
          :with sum := nil
          :with old-sum := nil
          :for line := (read-line f nil nil)
          :while line
          :do (shiftf val3 val2 val1 (read-from-string (string-trim '(#\CR #\LF) line)))
          :when (and val3 val2 val1)
            :do (shiftf old-sum sum (+ val1 val2 val3))
          :when (and old-sum sum)
            :count (> sum old-sum))))

#|
(run-part2)
|#
