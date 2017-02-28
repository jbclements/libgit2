#lang racket

(require ffi/unsafe
         "define.rkt"
         "types.rkt"
         "merge.rkt"
         "checkout.rkt")
(provide (all-defined-out))


(define-cstruct _git_cherrypick_opts
  ([version _uint]
   [mainline _uint]
   [merge_opts _git_merge_opts]
   [checkout_opts _git_checkout_opts]))

(define-libgit2 git_cherrypick_init_options
  (_fun _git_cherrypick_opts-pointer _uint -> _int))
(define-libgit2 git_cherrypick_commit
  (_fun (_cpointer _index) _repository _commit _commit _uint _git_merge_opts-pointer -> _int))
(define-libgit2 git_cherrypick
  (_fun _repository _commit _git_cherrypick_opts-pointer -> _int))
