
;; Change font to lucida console and setup initial window size
(add-to-list 'default-frame-alist '(font . "-*-Lucida Console-normal-r-*-*-12-108-*-*-c-*-*-ansi-"))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 80))
;;(add-to-list 'default-frame-alist '(background-color . "grey92"))
(setq initial-frame-alist default-frame-alist)
(setq special-display-frame-alist default-frame-alist)

