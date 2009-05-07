
(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path "~/.emacs.d/slime")

(require 'slime)
(slime-setup)

(add-hook 'lisp-mode-hook 
	  (lambda () 
	    (slime-mode t)))

(add-hook 'inferior-lisp-mode-hook 
	  (lambda () 
	    (inferior-slime-mode t)))

(add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))
(add-hook 'slime-connected-hook 'slime-ensure-typeout-frame)

;; http://bc.tech.coop/blog/070208.html

;; you can also specify different browsers to be used by storing a list of 
;; pairs (REGEXP . FUNCTION) in the browse-url-browser-function variable. 
;; In this case the function called will be the one associated with the 
;; first REGEXP which matches the current URL.

(setq browse-url-browser-function '(("hyperspec" . w3m-browse-url)
				    ("." . browse-url-firefox)))

;; http://play.org/links/lisp-setup

(setq hyperspec-path "~/lisp-dev/HyperSpec/")

;;
