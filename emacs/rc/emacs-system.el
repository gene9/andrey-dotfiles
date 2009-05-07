
(defun system-type-is-linux ()
  (string-equal system-type "gnu/linux")
)

(defun system-type-is-windows ()
  (memq window-system '(win32 w32))
)

;; ---
