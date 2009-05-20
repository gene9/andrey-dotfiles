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

(setq flymake-allowed-file-name-masks 
  '(
    ("\\.xml\\'" flymake-xml-init)
    ("\\.html?\\'" flymake-xml-init)
    ("\\.p[ml]\\'" flymake-perl-init)
    ("\\.php[345]?\\'" flymake-php-init)
    ;;("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
    ;;("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
    ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
    ("\\.tex\\'" flymake-simple-tex-init)
    ;;("\\.idl\\'" flymake-simple-make-init)
    ;; ("\\.cpp\\'" 1)
    ;; ("\\.java\\'" 3)
    ;; ("\\.h\\'" 2 ("\\.cpp\\'" "\\.c\\'")
    ;; ("[ \t]*#[ \t]*include[ \t]*\"\\([\w0-9/\\_\.]*[/\\]*\\)\\(%s\\)\"" 1 2))
    ;; ("\\.idl\\'" 1)
    ;; ("\\.odl\\'" 1)
    ;; ("[0-9]+\\.tex\\'" 2 ("\\.tex\\'")
    ;; ("[ \t]*\\input[ \t]*{\\(.*\\)\\(%s\\)}" 1 2 ))
    ;; ("\\.tex\\'" 1)
    ))

;; ---

