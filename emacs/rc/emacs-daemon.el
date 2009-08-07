
;;
;; http://emacs-fu.blogspot.com/2009/03/windows-and-daemons.html
;;

(defun my-done ()
  (interactive)                                                                                     
;;  (server-edit)
  (make-frame-invisible nil t))                                                                     

(if (memq window-system '(win32 w32))
    (global-set-key (kbd "C-x C-c") 'my-done)
)

;; ---
