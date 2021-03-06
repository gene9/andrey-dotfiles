
;; company-mode

(add-to-list 'load-path "~/emacs/company")
(autoload 'company-mode "company" nil t)

(require 'company)

;; FIXME: does not work - to check
;;(require 'company-bundled-completions)
;;(company-install-bundled-completions-rules)

(add-to-list 'load-path "~/emacs/auto-complete")
(require 'auto-complete)

(global-auto-complete-mode t)           ; enable global-mode
(setq ac-auto-start nil)                  ; do not automatically start
(setq ac-dwim t)                        ; do what i mean
(setq ac-override-local-map nil)        ; don't override local map

(setq ac-modes
      '(emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode
                        c-mode cc-mode c++-mode java-mode
                        perl-mode cperl-mode python-mode ruby-mode
                        ecmascript-mode javascript-mode php-mode css-mode
                        makefile-mode sh-mode fortran-mode f90-mode ada-mode
                        xml-mode sgml-mode
                        haskell-mode literate-haskell-mode
                        emms-tag-editor-mode
                        asm-mode
                        org-mode))

;; The sources for common all mode.
(custom-set-variables
 '(ac-sources
   '(
     ;; ac-source-yasnippet   ;this source need file `auto-complete-yasnippet.el'
     ;; ac-source-semantic    ;this source need file `auto-complete-semantic.el'
     ac-source-imenu
     ac-source-abbrev
     ac-source-words-in-buffer
     ac-source-files-in-current-dir
     ac-source-filename
     )))

;; ---
