
;; Change font to lucida console and setup initial window size
(if (eq system-type 'windows-nt)    
	(add-to-list 'default-frame-alist '(font . "-*-Lucida Console-normal-r-*-*-12-108-*-*-c-*-*-ansi-")))

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 80))
;;(add-to-list 'default-frame-alist '(background-color . "grey92"))
(setq initial-frame-alist default-frame-alist)
(setq special-display-frame-alist default-frame-alist)

(if (eq system-type 'windows-nt)    
    (custom-set-faces
        '(default ((t (:inherit nil :stipple nil
                           :inverse-video nil 
                           :box nil :strike-through nil :overline nil 
                           :underline nil :slant normal :weight normal 
                           :height 90 :width normal :foundry "unknown" 
                           :family "Lucida Console"))))))

;; --
