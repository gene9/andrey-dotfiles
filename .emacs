;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Jordan Ritter's dot-emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Notes:
;;; To tab over entire blocks, set-mark, move cursor, C-x tab
;;; Indent-Region: C-M-\
;;;

;; Before we start setting colors, we have to tell Emacs to always
;; syntax-hightlight everything to its fullest extent, and don't wait
;; to fontify (do it immediately).
;;

;; See if we're on MS Windows
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))

(load "~/emacs/color-theme.el")
(load "~/emacs/cua-emul.el")
;;(load "~/emacs/erc/erc-compat.el")
;;(load "~/emacs/erc/erc.el")

;;(if mswindows-p
    (add-to-list 'load-path "e:/home/andrey/emacs/slime")
    (add-to-list 'load-path "e:/home/andrey/emacs/erc")
;;)

(require 'color-theme)
(require 'recentf)
(require 'slime)
(require 'easymenu)
(require 'erc)

;; ERC
(easy-menu-add-item  nil '("tools")
      ["IRC" erc-select t])

;; Slime stuff

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(if mswindows-p
    (setq inferior-lisp-program "d:/as/sbcl-0.9.12/src/runtime/sbcl.exe")
)

(slime-setup)
 
;;(slime-multiprocessing t)

;; Misc
(setq inhibit-startup-message t)        ;no splash screen
(setq ls-lisp-dirs-first t)             ;display dirs first in dired
(global-font-lock-mode t)               ;colorize all buffers
(recentf-mode 1)                        ;recently edited files in menu

;; Set buffer behaviour
(setq next-line-add-newlines nil)
(setq scroll-step 1)
(setq scroll-conservatively 5)

;; Conventional mouse/arrow movement & selection
(pc-selection-mode)                 
(delete-selection-mode t)      

;; Colors
(color-theme-calm-forest)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size nil)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 0)

;; Basic Color Settings.  These define entire faces themselves, but
;; we'll override individual settings next.  Below are some color
;; combinations I liked.. note that the following font-lock*face
;; definitions are tuned to the current fg/bg color combination, and
;; so you may want to disable all the face definitions if you change
;; the overriding fg/bg colors.
;;

;fg "grey30", bg "antique white" -> jpr5's original colors
;fg: lightgray, bg: darkblue
;fg: darkslateblue, bg: floral white
;fg: floral white, bg: slategray4
;fg: black, bg: pale goldenrod
;fg: grey30, bg: lightyellow2
;fg: lightyellow2, bg: black
;fg: black, bg: lightyellow2 * 
;fg: black, bg: lightcyan1  ** 
;fg: black, bg: azure1 **

    (progn
        (set-background-color "gray23")       ;; easy on eyes
;        (set-background-color "white smoke")  ;; high contrast
        (set-foreground-color "white smoke")
        (set-cursor-color "Yellow")
        (set-border-color "DarkSlateGray"))

;; Explicitly set colors (faces) of individual objects.  If you like
;; the colors the schemes above give you, then just comment out this
;; entire section.
;;

;; AS
;;(set-face-foreground 'font-lock-comment-face       "SkyBlue1")

;;(set-face-foreground 'font-lock-string-face    "LightPink2")

;;(set-face-foreground 'font-lock-doc-face           "dark slate grey")

;;(set-face-foreground 'font-lock-type-face          "forest green")
;;(set-face-foreground 'font-lock-variable-name-face "dark golden rod")
;; (set-face-foreground 'font-lock-function-name-face "gold3")
;;(set-face-foreground 'font-lock-keyword-face       "blue")
;;(set-face-foreground 'font-lock-builtin-face       "gold3")
;;(set-face-foreground 'font-lock-constant-face      "slateblue3")

;;    (set-face-background 'region                   "dark grey")

;;    (progn
;;        (set-face-foreground 'modeline             "black")
;;        (set-face-background 'modeline             "grey100"))

;(set-face-foreground 'bold "red")
;(set-face-foreground 'italic "yellow")
;(set-face-background 'highlight "grey") 

;; Get rid of all those annoying things that get in our way.
;;

(setq inhibit-startup-message t)
;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Some defaults about ourselves.
;;

(setq user-full-name "Andrey Sidorenko")
(setq user-mail-address "a@127.0.0.1")
(setq mail-host-address '"127.0.0.1")

;; Global KeyMappings
;;

(global-set-key [delete]      'delete-char)
(global-set-key [kp-delete]   'delete-char)
(global-set-key "\C-h"        'delete-backward-char)
(global-set-key "\C-xC"       'compile)
(global-set-key "\C-c\C-c"    'eval-buffer)
(global-set-key "\C-x\C-x"    'end-of-buffer)
(global-set-key "\C-x\C-p"    'beginning-of-buffer)
(global-set-key "\M-r"        'revert-buffer)
(global-set-key "\M-g"        'goto-line)

;;  If we're in X, disable usual C-z behaviour (minimize/background),
;; and replace it with an actual shell launch.
;;

(if (eq window-system 'x)
    (progn (global-set-key "\C-z" 'shell)))

;; Some good settings: visible bell instead of beep, show line and
;; column #, show hilighting when selecting a region, raise the cut
;; buffer size from 20 KiB to 64KB, always add a final newline if
;; there isn't one, don't auto-create newlines when you go past the
;; end of the file, change the yes-or-no prompt to a simple single
;; ``y'' or ``n''.
;;

(setq visible-bell t)
(setq line-number-mode t)
(setq column-number-mode t) 
(setq transient-mark-mode t)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq x-cut-buffer-max 65536)
(fset 'yes-or-no-p 'y-or-n-p)

;; Play with the cursor.  Amazingly, this doesn't seem to do what it
;; should when in non-X mode.  :-(
;; 

    (progn
      (blink-cursor-mode nil)
      (setq default-frame-alist
         '((cursor-type . bar))))

;; Instead of default-mode being lisp, make it text.  Uncomment the
;; other option to force auto-fill for everything (sometimes not good
;; when programming, though -- depends on how you write codex).
;; 

(setq default-major-mode 'text-mode)
;(setq-default auto-fill-function 'do-auto-fill)

;; Some basic C/C++ settings around parenthesis and how Emacs indents
;; various syntactic structures.  Also, highlight certain keywords
;; differently.
;;

(setq c-basic-indent 4)
(show-paren-mode t)

(add-hook 'c-mode-common-hook
    (lambda ()
        (setq c-basic-offset 4)
        (setq indent-tabs-mode nil)
        (c-set-offset 'case-label '+)
        (c-set-offset 'substatement-open 0)))

(font-lock-add-keywords 'perl-mode
    '(("\\<\\(FIXME\\):" 1 font-lock-warning-face t)
      ("\\<\\(WARNING\\):" 1 font-lock-warning-face t)
      ("\\<\\(NOTE\\):" 1 font-lock-warning-face t)
      ("\\<\\(IMPORTANT\\):" 1 font-lock-warning-face t)
      ("\\<\\(TODO\\):" 1 font-lock-warning-face t))
)

(font-lock-add-keywords 'c-mode
    '(("\\<\\(FIXME\\):" 1 font-lock-warning-face t)
      ("\\<\\(WARNING\\):" 1 font-lock-warning-face t)
      ("\\<\\(NOTE\\):" 1 font-lock-warning-face t)
      ("\\<\\(IMPORTANT\\):" 1 font-lock-warning-face t)
      ("\\<\\(TODO\\):" 1 font-lock-warning-face t))
)

(font-lock-add-keywords 'c++-mode
    '(("\\<\\(FIXME\\):" 1 font-lock-warning-face t)
      ("\\<\\(WARNING\\):" 1 font-lock-warning-face t)
      ("\\<\\(NOTE\\):" 1 font-lock-warning-face t)
      ("\\<\\(IMPORTANT\\):" 1 font-lock-warning-face t)
      ("\\<\\(TODO\\):" 1 font-lock-warning-face t))
)

;; TAB settings
;;
;; Set some basic requirements around input (width 4, don't use tabs), 
;; but then also define some magic that will replace tabs if we happen
;; to save a file that has tabs inadvertently added to it.
;;

(setq tab-width 4)
(setq indent-tabs-mode nil) 

(defun any-mode-untabify ()
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward "[ \t]+$" nil t)
            (delete-region (match-beginning 0) (match-end 0)))
        (goto-char (point-min))
        (if (search-forward "\t" nil t)
            (untabify (1- (point)) (point-max))))
    nil)

(add-hook 'text-mode-hook
    '(lambda ()
        (make-local-variable 'write-contents-hooks)
        (add-hook 'write-contents-hooks 'any-mode-untabify)))

(add-hook 'perl-mode-hook
    '(lambda ()
        (make-local-variable 'write-contents-hooks)
        (add-hook 'write-contents-hooks 'any-mode-untabify)))

(add-hook 'c-mode-hook
    '(lambda ()
        (make-local-variable 'write-contents-hooks)
        (add-hook 'write-contents-hooks 'any-mode-untabify)))

(add-hook 'c++-mode-hook
    '(lambda ()
        (make-local-variable 'write-contents-hooks)
        (add-hook 'write-contents-hooks 'any-mode-untabify)))

(add-hook 'latex-mode-hook
    '(lambda ()
        (make-local-variable 'write-contents-hooks)
        (add-hook 'write-contents-hooks 'any-mode-untabify)))

;;
;; Some useful LaTeX keybindings/settings.
;;
 
(add-hook 'latex-mode-hook 
 '(lambda () 
    (setq tex-dvi-view-command "xdvi *")
    (setq tex-output-extension ".dvi")
    (setq tex-default-mode 'latex-mode)
    (define-key latex-mode-map "\C-c\C-c" 'tex-file)
    (define-key latex-mode-map "\C-c\C-v" 'tex-view)
  )
)

;; Special Display Buffers -- if enabled, whatever buffers match names
;; in this list are created as separate windows (frames), instead of
;; splitting the current buffer.
;;

;(setq special-display-buffer-names
;      '("*Completions*" "*grep*" "*tex-shell*"))

;; And finally Emacs custom settings.
;;

(require 'paren)
(show-paren-mode t)

(defun color-theme-as ()
  (interactive)
  (color-theme-install
   '(color-theme-as
     (
      )

     (show-paren-match-face ((t (:background "brown"))))
     (show-paren-mismatch-face ((t (:foreground "white" :background "purple")))))))

(color-theme-as)

(custom-set-variables
 ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 ;;'(blink-cursor nil)
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(compilation-scroll-output t)
)

;; make buffer list better
(global-set-key [(control x) (control b)] 'electric-buffer-list)

;; Shortcuts to common functions
(global-set-key [(control c) (a)] 'mark-whole-buffer)
(global-set-key [(control c) (g)] 'goto-line)   

(global-set-key [(f2)] 'save-buffer)   

(progn
    (require 'cua-emul)
    (setq cua-emul-force t)
    (turn-on-cua-emul-mode))

;; EOF
