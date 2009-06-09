
;; mouse popup menus
(global-set-key [(mouse-3)] 'mouse-major-mode-menu)
(global-set-key [(shift mouse-3)] 'mouse-buffer-menu)

;; scroll 1 line per wheel click
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))) 

;; do not increase speed of scrolling
(setq mouse-wheel-progressive-speed nil)

;; ---
