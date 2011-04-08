
(autoload 'cc-mode "cc-mode")

;; http://www.emacswiki.org/emacs/IndentingC

(defun my-c-mode-common-hook ()
        (setq tab-width 4)
        (setq c-basic-offset 4)
        (c-set-offset 'substatement-open 0)
        (c-set-style "stroustrup")
        (c-toggle-auto-hungry-state -1)
        (local-set-key "\C-c:" 'uncomment-region)
        (local-set-key "\C-c;" 'comment-region)
        (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
        (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-to-list 'auto-mode-alist '("\\.ipp?$" . c++-mode))

;; --
