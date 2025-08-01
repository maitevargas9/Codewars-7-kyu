#|
Description

The first input array is the key to the correct answers to an exam, like ["a", "a", "b", "d"]. 
The second one contains a student's submitted answers.

The two arrays are not empty and are the same length. Return the score for this array of answers, 
giving +4 for each correct answer, -1 for each incorrect answer, and +0 for each blank answer, 
represented as an empty string (in C the space character is used).

If the score < 0, return 0.

For example:
   Correct answer    |    Student's answer   |   Result         
---------------------|-----------------------|-----------
["a", "a", "b", "b"]   ["a", "c", "b", "d"]  →     6
["a", "a", "c", "b"]   ["a", "a", "b", "" ]  →     7
["a", "a", "b", "c"]   ["a", "a", "b", "c"]  →     16
["b", "c", "b", "a"]   ["" , "a", "a", "c"]  →     0
|#

#lang racket

(provide check-exam)

(define (check-exam key answers)
  (max 0
    (for/sum [(k key) (a answers)]
       (cond
         [(and (char? k) (char? a) (char=? a k)) 4]
         [(and (string? k) (string? a) (string=? a k)) 4]
         [(and (string? a) (not (non-empty-string? a))) 0]
         [else -1]))))