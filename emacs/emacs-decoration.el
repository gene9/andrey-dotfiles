
;; set default frame size
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 80))

;; disable verbose dialog answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Set up layout-restore
(add-to-list 'load-path "~/.emacs.d/layout-restore")
(require 'layout-restore)

;; Set up recentf so I can get a list of recent files when I start
(recentf-mode 1)
(recentf-open-files nil "*Recent Files*")
(setq recentf-max-saved-items 1200)

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

