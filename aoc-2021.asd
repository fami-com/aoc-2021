;;;; aoc-2021.asd

(asdf:defsystem #:aoc-2021
  :description "My AoC 2021 solutions in Common Lisp"
  :author "Volodymyr Ivanov <me@funcall.me>"
  :license "Public Domain"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria)
  :components ((:file "packages")
               (:module "01"
                :depends-on ("packages")
                :components
                ((:file "solution")
                 (:static-file "input.txt")))
               (:module "02"
                :depends-on ("packages")
                :components
                ((:file "solution")
                 (:static-file "input.txt")))))
