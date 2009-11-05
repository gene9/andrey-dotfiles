;; http://bc.tech.coop/blog/070208.html

;; you can also specify different browsers to be used by storing a list of 
;; pairs (REGEXP . FUNCTION) in the browse-url-browser-function variable. 
;; In this case the function called will be the one associated with the 
;; first REGEXP which matches the current URL.

;;(setq browse-url-browser-function '(("hyperspec" . w3m-browse-url)
(setq browse-url-browser-function '(("hyperspec" . browse-url-firefox)
				    ("." . browse-url-firefox)))

;; http://play.org/links/lisp-setup
(let ((fname "~/lisp-dev/HyperSpec"))
  (when (file-accessible-directory-p fname)
    (setq hyperspec-path fname)))

;; ---
