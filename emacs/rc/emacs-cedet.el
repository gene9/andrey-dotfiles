
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

(custom-set-faces
 '(ecb-analyse-bucket-node-face ((((class color) (background dark)) nil)))
 '(ecb-bucket-node-face ((((class color) (background dark)) (:inherit ecb-default-general-face))))
 '(ecb-history-bucket-node-face ((((class color) (background dark)) nil)))
 '(ecb-history-indirect-buffer-face ((((class color) (background dark)) (:inherit ecb-history-general-face))))
 '(ecb-mode-line-win-nr-face ((((class color) (background dark)) nil)))
 '(ecb-source-read-only-face ((((class color) (background dark)) (:inherit ecb-default-general-face))))
 '(semantic-tag-boundary-face ((((class color) (background dark)) nil))))

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
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file
             "d:/as/projects/boost-1_38_0/boost/config.hpp")

  (let ((fname "D:/as/projects/boost_1_38_0"))
    (when (file-accessible-directory-p fname)
      (semantic-add-system-include fname 'c++-mode))))

(if (eq system-type 'windows-nt)
  (let ((fname "C:/VS2008-TS/VC/include"))
    (when (file-accessible-directory-p fname)
      (semantic-add-system-include fname 'c++-mode))))

;; ---
