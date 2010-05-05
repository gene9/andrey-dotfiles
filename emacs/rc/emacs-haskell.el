(add-to-list 'load-path "~/emacs/haskell-mode")
(load "~/emacs/haskell-mode/haskell-site-file.el")
(load "~/emacs/hs-lint/hs-lint.el")

(add-to-list 'auto-mode-alist '("\\.hsc$" . haskell-mode))

(custom-set-variables
 '(haskell-program-name "ghci")
 '(inferior-haskell-wait-and-jump t)
 '(hs-lint-replace-with-suggestions t)
 )

;;(require 'hs-lint)

(defun andrey/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
;;  (turn-on-haskell-ghci)
  (turn-on-eldoc-mode)
  (turn-on-haskell-indentation)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-cl" 'hs-lint)
  (local-set-key "\C-ch" 'haskell-hoogle)
  (local-set-key "\C-c\C-h" 'haskell-hayoo)
  (setq tab-width 4)
;;  (turn-on-haskell-simple-indent)
  (setq haskell-font-lock-symbols t))

;;(add-hook 'haskell-mode-hook 'alexott/common-hook)
;;(add-hook 'haskell-mode-hook 'alexott/show-prog-keywords)
(add-hook 'haskell-mode-hook 'andrey/haskell-mode-hook)

(add-to-list 'exec-path "~/.cabal/bin")

