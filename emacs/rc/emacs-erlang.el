
;;(if (eq system-type 'windows-nt)
    (add-to-list 'load-path "D:/as/erlang/lib/tools-2.6.5.1/emacs")
    (add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.2/emacs")
;;)

(add-to-list 'load-path "~/emacs/distel/elisp")

(require 'distel)
(distel-setup)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(flymake-errline ((((class color)) (:background "DarkRed"))))
  '(flymake-warnline ((((class color)) (:background "LightBlue4")))))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
    (lambda ()
	   ;; when starting an Erlang shell in Emacs, default in the node name
	   (setq inferior-erlang-machine-options '("-sname" "emacs" "-mnesia" "dir" "'/home/mnesia'"))
	   ;; add Erlang functions to an imenu menu
	   (imenu-add-to-menubar "imenu")))

;; ---
