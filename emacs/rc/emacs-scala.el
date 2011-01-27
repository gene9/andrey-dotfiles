(add-to-list 'load-path "~/emacs/scala-mode")
(require 'scala-mode-auto)

(add-to-list 'load-path "~/emacs/yasnippet-read-only")

;; does not work FIXME: to check why
;;(require 'yasnippet-bundle)

(require 'yasnippet)
(yas/initialize)
(setq yas/my-directory "~/emacs/yasnippet-read-only/snippets")
(yas/load-directory yas/my-directory)

;(add-hook 'scala-mode-hook
;            '(lambda ()
;               (yas/minor-mode-on)
;               ))

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))

;;(add-to-list 'load-path "~/emacs/ensime/elisp")
;;(require 'ensime)
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; ---
