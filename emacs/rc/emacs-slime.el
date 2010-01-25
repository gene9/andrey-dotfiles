
(require 'inf-lisp)
(setq inferior-lisp-program "sbcl")
(setq slime-net-coding-system 'utf-8-unix)

(setq slime-default-lisp 'sbcl)

(add-to-list 'load-path "~/emacs/slime")
(add-to-list 'load-path "~/emacs/slime/contrib")

(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook
          (lambda ()
            (slime-mode t)))

(add-hook 'inferior-lisp-mode-hook
          (lambda ()
            (inferior-slime-mode t)))

(add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))

(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-fancy slime-asdf slime-banner slime-fuzzy slime-autodoc slime-repl))
     (define-key global-map (kbd "<f9>") 'slime-selector)
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
     (setq slime-lisp-implementations
           `((clojure ("clj-cmd") :init swank-clojure-init)
             (sbcl ("sbcl"))
             ,@slime-lisp-implementations))
     ))

;; http://davidhilton.wordpress.com/2008/11/25/a-little-clojure/
;;(add-hook ’slime-connected-hook ’slime-redirect-inferior-output)

;; http://bc.tech.coop/blog/081120.html
(add-hook 'slime-connected-hook (lambda ()
				  (interactive)
				  (slime-redirect-inferior-output)))

(global-set-key [f5] 'slime)
(global-set-key [(control f11)] 'slime-selector)

;; ---

