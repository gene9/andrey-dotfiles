;; ========== Line by line scrolling ==========
;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; Enable pc selection mode
(pc-selection-mode)
(pc-bindings-mode)

;; pc-selection-mode breaks M-del, but redefinition of M-del does not work
;;(global-set-key [(meta del)] 'backward-kill-word)
;; this one works
(global-set-key "\M-\d" 'backward-kill-word)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Set tab width to 4
(setq tab-width 4)

;; Switch to other window using C-TAB
(global-set-key [(control tab)] 'other-window)

;; Goto line # (A-F8)
(global-set-key [(meta f8)] 'goto-line)

;; Search (f7)
(global-set-key [(f7)] 'isearch-forward)

;; Search and replace (C-F7)
(global-set-key [(control f7)] 'query-replace)

;; Kill current buffer (C-F4)
(global-set-key [(control f4)] 'kill-buffer)

;; Undo (C-Z)
;;(global-set-key [(control z)] 'undo)

;; Vim-like shorcut for completion (C-n)
;;(global-set-key (kbd "C-n") 'hippie-expand)

;; Vim-like shorcut for completion (C-n/C-p)
;;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;;(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; Copy to clipboard (C-y)
(global-set-key (kbd "C-y") 'clipboard-kill-ring-save)

;; Paste from clipboard (C-p)
(global-set-key (kbd "C-p") 'clipboard-yank)

;; Cut and put into clipboard (C-X)
(global-set-key (kbd "C-S-x") 'clipboard-kill-region)

;; home/end - goto beginning/end of the string
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line) 

;; bookmarks, does not work: starts with non-prefix key...
;;(define-key global-map (kbd "\C-k k") 'bookmark-set)
;;(define-key global-map (kbd "\C-k b") 'bookmark-jump)

;; ---
