
;; Set up recentf so I can get a list of recent files when I start
(recentf-mode 1)

(setq recentf-arrange-by-rules-min-items 0
      recentf-arrange-by-rule-others nil

;;      recentf-arrange-rules 
;;      '(("Elisp files (%d)" ".\\.el$"
;;	 "^\\.?emacs-") 
;;	("Java files (%d)" ".\\.java$")
;;	("C/C++ files (%d)" ".\\.c\\(pp\\)?$")
;;	("C/C++ include files (%d)" ".\\.h$")
;;	("Configuration files (%d)" "rc$\\|/\\.")
;;	("Ada files (%d)" ".\\.ad[sb]$")
;;	("TeX/LaTeX files (%d)" ".\\.\\(tex\\|bib\\)$")
;;	("Scripts (%d)" ".\\.\\(sh\\|pl\\)$")
;;	("Documentation (%d)" "/doc/")
;;	)
      recentf-max-saved-items 50
      recentf-max-menu-items  30
      recentf-menu-path nil
      recentf-exclude '(".emacs-customize$"
			".newsrc"
			".etags$"
			".emacs.bmk$"
			".bbdb$"
			".log$"
			"c:/VSTS200*"
			"d:/as/projects/boost_*"
			".ede$"
			"^/tmp/")
;;      recentf-menu-filter 'recentf-arrange-by-rule
      recentf-menu-title "Recentf"
      )

(recentf-open-files nil "*Recent Files*")
;;(setq recentf-max-saved-items 1200)

;; ---
