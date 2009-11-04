;; .emacs

(load "~/emacs/rc/emacs-system.el")
(load "~/emacs/rc/emacs-misc.el")

(load "~/emacs/rc/emacs-colors.el")
(load "~/emacs/rc/emacs-fonts.el")
(load "~/emacs/rc/emacs-erlang.el")
(load "~/emacs/rc/emacs-mouse.el")
(load "~/emacs/rc/emacs-decoration.el")
(load "~/emacs/rc/emacs-flymake.el")
(load "~/emacs/rc/emacs-lisp.el")
(load "~/emacs/rc/emacs-factor.el")
(load "~/emacs/rc/emacs-completion.el")
(load "~/emacs/rc/emacs-c-c++.el")
(load "~/emacs/rc/emacs-cedet.el")
(load "~/emacs/rc/emacs-ecb.el")
(load "~/emacs/rc/emacs-recentf.el")
(load "~/emacs/rc/emacs-shell.el")
(load "~/emacs/rc/emacs-ocaml.el")
(load "~/emacs/rc/emacs-scala.el")
(load "~/emacs/rc/emacs-csharp.el")
(load "~/emacs/rc/emacs-clojure.el")
(load "~/emacs/rc/emacs-slime.el")

(load "~/emacs/rc/emacs-daemon.el")

(load "~/emacs/rc/emacs-file-editing.el")

;; have to be last one
(load "~/emacs/rc/emacs-keyboard.el")

(let ((fname (concat "~/emacs/rc/emacs-rc-local-" (system-name) ".el")))
    (when (file-exists-p fname)
        (load fname)))

;;(require 'recentf)
;;(require 'slime)
;;(require 'easymenu)
;;(require 'erc)

;; enable visual feedback on selections
;;(setq transient-mark-mode t)

;; default to better frame titles
;;(setq frame-title-format
;;      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
;;(setq diff-switches "-u")

;; Misc
;;(setq inhibit-startup-message t) ;no splash screen
;;(setq ls-lisp-dirs-first t) ;display dirs first in dired
;;(global-font-lock-mode t) ;colorize all buffers
;;(recentf-mode 1)

;; Conventional mouse/arrow movement & selection
;;(pc-selection-mode)
;;(delete-selection-mode t)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; ---
