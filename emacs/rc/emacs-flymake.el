(require 'flymake)

;; Erlang

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/bin/eflymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.erl\\'" flymake-erlang-init))

(add-hook 'find-file-hook 'flymake-find-file-hook)

;; do not use flymake for c, c++ and c#

(setq flymake-allowed-file-name-masks 
      (delete '("\\.c\\'" flymake-simple-make-init) 
              flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks 
      (delete '("\\.cpp\\'" flymake-simple-make-init) 
              flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks 
      (delete '("\\.cs\\'" flymake-simple-make-init) 
              flymake-allowed-file-name-masks))

;; ---

