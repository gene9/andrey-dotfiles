
(require 'cc-mode)

(defun my-c-mode-common-hook ()
        (setq tab-width 4)
        (c-set-style "stroustrup")
        (local-set-key "\C-c:" 'uncomment-region)
        (local-set-key "\C-c;" 'comment-region)
        (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
        (setq indent-tabs-mode f))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; --
