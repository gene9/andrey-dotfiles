
(require 'cc-mode)

;; http://www.emacswiki.org/emacs/IndentingC

(defun my-c-mode-common-hook ()
        (setq tab-width 4)
        (setq c-basic-offset 4)
        (c-set-offset 'substatement-open 0)
        (c-set-style "stroustrup")
        (c-toggle-auto-hungry-state 0) ;; Whenever you type certain characters, a newline will NOT be inserted automatically.
        (local-set-key "\C-c:" 'uncomment-region)
        (local-set-key "\C-c;" 'comment-region)
        (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\):" 1 font-lock-warning-face t)))
        (setq indent-tabs-mode f))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; --
