
;; load cursor handling stuff
;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
(add-to-list 'load-path "~/emacs/cursor-chg")
(require 'cursor-chg)
(toggle-cursor-type-when-idle 0) ; Turn off cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;; set default frame size
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 80))

;; disable verbose dialog answers
(fset 'yes-or-no-p 'y-or-n-p)

;; do not wrap lines
(set-default 'truncate-lines t)

;; remove toolbar
(tool-bar-mode -1)

;; remove scrollbar
(scroll-bar-mode -1)

;; turn off the annoying alarm bell
(setq ring-bell-function 'ignore)

;; Disable the splash screen
(setq inhibit-splash-screen t)

;; Do not show initial scratch
(custom-set-variables
  '(initial-scratch-message nil))

;; --
