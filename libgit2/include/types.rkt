#lang racket

(require ffi/unsafe
         "define.rkt")
(provide (all-defined-out))

(define _git_time_t _int64)
(define _git_off_t _int64)

(define _git_otype
  (_enum '(GIT_OBJ_ANY = -2
           GIT_OBJ_BAD
           GIT_OBJ_EXT1
           GIT_OBJ_COMMIT
           GIT_OBJ_TREE
           GIT_OBJ_BLOB
           GIT_OBJ_TAG
           GIT_OBJ__EXT2
           GIT_OBJ_OFS_DELTA
           GIT_OBJ_REF_DELTA)))

(define _git_branch_t
  (_enum '(GIT_BRANCH_LOCAL = 1
           GIT_BRANCH_REMOTE
           GIT_BRANCH_ALL)))

(define-cpointer-type _annotated_commit)
(define-cpointer-type _commit)
(define-cpointer-type _config)
(define-cpointer-type _config_backend)
(define-cpointer-type _blame)
(define-cpointer-type _blob)
(define-cpointer-type _diff)
(define-cpointer-type _index)
(define-cpointer-type _index_conflict_iterator)
(define-cpointer-type _merge_result)
(define-cpointer-type _note)
(define-cpointer-type _object)

(define GIT_OID_RAWSZ 20)
(define GIT_OID_HEXSZ (* GIT_OID_RAWSZ 2))
(define GIT_OID_MINPREFIXLEN 4)

(define-cstruct _git_oid
  ([id (_array _uint8 GIT_OID_RAWSZ)]))
(define _oid _git_oid-pointer)
(define _oid/null _git_oid-pointer/null)

(define-cpointer-type _odb)
(define-cpointer-type _odb_backend)
(define-cpointer-type _odb_object)
(define-cpointer-type _odb_stream)
(define-cpointer-type _odb_writepack)
(define-cpointer-type _packbuilder)
(define-cpointer-type _patch)
(define-cpointer-type _push)
(define-cpointer-type _rebase)
(define-cpointer-type _refdb)
(define-cpointer-type _refdb_backend)
(define-cpointer-type _reference)
(define-cpointer-type _reference_iterator)
(define-cpointer-type _reflog)
(define-cpointer-type _reflog_entry)
(define-cpointer-type _refspec)
(define-cpointer-type _remote)
(define-cpointer-type _remote_head)
(define-cpointer-type _repository)
(define-cpointer-type _revwalk)
(define-cpointer-type _submodule)
(define-cpointer-type _status_list)
(define-cpointer-type _transaction)
(define-cpointer-type _transport)
(define-cpointer-type _tag)
(define-cpointer-type _tree)
(define-cpointer-type _treebuilder)
(define-cpointer-type _tree_entry)
(define-cpointer-type _writestream)


(define-cstruct _git_time
  ([time _git_time_t]
   [offset _int]))

(define-cstruct _git_signature
  ([name _string]
   [email _string]
   [when _git_time]))
(define _signature _git_signature-pointer)
(define _signature/null _git_signature-pointer/null)

(define _git_ref_t
  (_enum '(GIT_REF_INVALID
           GIT_REF_OID
           GIT_REF_SYMBOLIC
           GIT_REF_LISTALL)))

(define _git_filemode_t
  (_enum '(GIT_FILEMODE_UNREADABLE = 0
           GIT_FILEMODE_TREE = #o0040000
           GIT_FILEMODE_BLOB = #o0100644
           GIT_FILEMODE_BLOB_EXECUTABLE = #o0100755
           GIT_FILEMODE_LINK = #o0120000
           GIT_FILEMODE_COMMIT = #o0160000)))

(define-cstruct _git_transfer_progress
  ([total_objects _uint]
   [indexed_objects _uint]
   [received_objects _uint]
   [local_objects _uint]
   [total_deltas _uint]
   [indexed_deltas _uint]
   [received_bytes _size]))

(define _git_transfer_progress_cb
  (_fun _git_transfer_progress-pointer _bytes -> _int))

(define _git_transport_message_cb
  (_fun _string _int _bytes -> _int))

(define _git_cert_t
  (_enum '(GIT_CERT_NONE
           GIT_CERT_X509
           GIT_CERT_HOSTKEY_LIBSSH2
           GIT_CERT_STRARRAY)))

(define-cstruct _git_cert
  ([cert_type _git_cert_t]))
(define _cert _git_cert-pointer)

(define _git_transport_certificate_check_cb
  (_fun _cert _int _string _bytes -> _int))

(define _git_submodule_update_t
  (_enum '(GIT_SUBMODULE_UPDATE_DEFAULT
           GIT_SUBMODULE_UPDATE_CHECKOUT
           GIT_SUBMODULE_UPDATE_REBASE
           GIT_SUBMODULE_UPDATE_MERGE
           GIT_SUBMODULE_UPDATE_NONE)))
(define _git_submodule_ignore_t
  (_enum '(GIT_SUBMODULE_IGNORE_UNSPECIFIED = -1
           GIT_SUBMODULE_IGNORE_NONE = 1
           GIT_SUBMODULE_IGNORE_UNTRACKED
           GIT_SUBMODULE_IGNORE_DIRTY
           GIT_SUBMODULE_IGNORE_ALL)))
(define _git_submodule_recurse_t
  (_enum '(GIT_SUBMODULE_RECURSE_NO
           GIT_SUBMODULE_RECURSE_YES
           GIT_SUBMODULE_RECURSE_ONDEMAND)))
