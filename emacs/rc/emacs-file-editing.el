
;; Enable backup files.
(setq make-backup-files t)

(setq make-backup-files nil)

(setq version-control 'never)

(setq backup-by-copying t   
	backup-directory-alist   '(("." . "~/.emacs_backups"))  
	delete-old-versions t 
	kept-new-versions 6 
	kept-old-versions 2
	version-control t)  

;; ---
