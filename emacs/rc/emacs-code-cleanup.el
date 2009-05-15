
;; clean trailing whitespaces automatically
(setq my-trailing-whitespace-modes '(c++-mode
                                     c-mode
                                     haskell-mode
                                     emacs-lisp-mode
                                     lisp-mode
                                     scheme-mode))

(defun my-trailing-whitespace-hook ()
  (when (member major-mode my-trailing-whitespace-modes)
    (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'my-trailing-whitespace-hook)

;; ---

