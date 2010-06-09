 ;; .emacs

(load "~/emacs/rc/emacs-system.el")
(load "~/emacs/rc/emacs-misc.el")

(load "~/emacs/rc/emacs-tabbar.el")
(load "~/emacs/rc/emacs-colors.el")
(load "~/emacs/rc/emacs-fonts.el")
(load "~/emacs/rc/emacs-erlang.el")
(load "~/emacs/rc/emacs-javascript.el")
(load "~/emacs/rc/emacs-mouse.el")
(load "~/emacs/rc/emacs-decoration.el")
(load "~/emacs/rc/emacs-flymake.el")
(load "~/emacs/rc/emacs-lisp.el")
(load "~/emacs/rc/emacs-factor.el")
(load "~/emacs/rc/emacs-completion.el")
(load "~/emacs/rc/emacs-c-c++.el")

(cond 
    ((and (= emacs-major-version 23) (>= emacs-minor-version 2)))
        (t)
    (t
        (load "~/emacs/rc/emacs-cedet.el")
        (load "~/emacs/rc/emacs-ecb.el")))


(load "~/emacs/rc/emacs-recentf.el")
(load "~/emacs/rc/emacs-shell.el")
(load "~/emacs/rc/emacs-ocaml.el")
(load "~/emacs/rc/emacs-haskell.el")
(load "~/emacs/rc/emacs-scala.el")
(load "~/emacs/rc/emacs-csharp.el")
(load "~/emacs/rc/emacs-clojure.el")
(load "~/emacs/rc/emacs-slime.el")
(load "~/emacs/rc/emacs-browser.el")
(load "~/emacs/rc/emacs-w3m.el")

(load "~/emacs/rc/emacs-daemon.el")

(load "~/emacs/rc/emacs-file-editing.el")

(load "~/emacs/rc/emacs-pretty-lambda.el")

;; have to be last one
(load "~/emacs/rc/emacs-keyboard.el")

(let ((fname (concat "~/emacs/rc/emacs-rc-local-" (system-name) ".el")))
    (when (file-exists-p fname)
        (load fname)))

;; Local Variables:
;; no-byte-compile: t
;; End: 

;; ---
