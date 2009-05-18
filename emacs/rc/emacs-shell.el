
;; http://hocwp.free.fr/setup-lisp/_emacs
;; toggle Shell
(defun my-shell ()
  "Start a shell in the directory of current buffer"
  (interactive)
  (let ((my-file-dir (expand-file-name
		      (if (eq buffer-file-name nil)
			  default-directory
			(file-name-directory buffer-file-name)))))
    (switch-to-buffer my-file-dir)
    (shell my-file-dir)
    (ansi-color-for-comint-mode-on)))

;; ---
