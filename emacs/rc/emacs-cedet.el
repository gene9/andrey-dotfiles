
(load-file "~/emacs/cedet/common/cedet.el")
(global-ede-mode t)
(global-srecode-minor-mode 1)  

(require 'semantic-lex-spp)

(require 'semantic-decorate-include)

;; gcc setup
;;(if (not (eq system-type 'windows-nt))
(require 'semantic-gcc)

;; smart completions
(require 'semantic-ia)

(require 'semanticdb-global)

(require 'semanticdb-ectag)

(require 'eassist)

;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-gaudy-code-helpers)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;;(semantic-load-enable-primary-exuberent-ctags-support)

;;(custom-set-variables
;; '(semantic-tag-boundary-face ((((class color) (background dark)) nil))))

;;(setq semantic-idle-scheduler-idle-time 1)
;;(global-semantic-idle-scheduler-mode)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))
;;(global-semantic-folding-mode 1)

(require 'imenu)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(if (eq system-type 'windows-nt)
  (let ((fname "D:/as/projects/boost_1_38_0"))
    (when (file-accessible-directory-p fname)
      (semantic-add-system-include fname 'c++-mode))))

(if (eq system-type 'windows-nt)
  (let ((fname "C:/VS2008-TS/VC/include"))
    (when (file-accessible-directory-p fname)
      (semantic-add-system-include fname 'c++-mode))))

;; ---
