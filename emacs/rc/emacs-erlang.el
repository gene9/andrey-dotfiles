
;;(if (eq system-type 'windows-nt)
    (add-to-list 'load-path "D:/as/erlang/lib/tools-2.6.6.1/emacs")
    (add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.6.1/emacs")
;;)

(setq erlang-root-dir "/usr/lib/erlang")

(add-to-list 'load-path "~/emacs/distel/elisp")

(require 'distel)
(distel-setup)

(custom-set-faces
  '(flymake-errline ((((class color)) (:background "DarkRed"))))
  '(flymake-warnline ((((class color)) (:background "LightBlue4")))))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;; Some Erlang customizations
(defun andrey/erlang-mode-hook ()
   ;; when starting an Erlang shell in Emacs, default in the node name
   (setq inferior-erlang-machine-options '("-sname" "emacs" "-mnesia" "dir" "'/home/mnesia'"))
   ;; add Erlang functions to an imenu menu
   (imenu-add-to-menubar "imenu"))

(add-hook 'erlang-mode-hook 'andrey/erlang-mode-hook)

;; ---
