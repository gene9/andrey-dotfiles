(add-to-list 'load-path "~/emacs/clojure-mode")
(add-to-list 'load-path "~/emacs/swank-clojure/src/emacs")

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;;(require 'clojure-mode)

(defun alexott/clojure-mode-hook ()
  "Hook for Clojure mode"
  )
(add-hook 'clojure-mode-hook 'alexott/clojure-mode-hook)

(setq swank-clojure-jar-path "~/emacs/clojure/clojure.jar"
      swank-clojure-extra-classpaths (list
				      "~/emacs/swank-clojure/src/main/clojure"
				      "~/emacs/clojure-contrib"
				      ))

(setq clojure-home (concat (expand-file-name "~") "/emacs/clojure/"))

(setq other-jar "")

(setq clj
              (concat "java "
;;                      "-server "
                      "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888 "
                      "-cp "
                      (concat clojure-home "clojure.jar:")
                      (concat clojure-home "clojure-contrib.jar:")
                      (concat clojure-home "swank-clojure.jar:")
                      other-jar
                      " clojure.lang.Repl"))

;;(setq swank-clojure-binary clj)

(require 'swank-clojure-autoload)

;; slime
;;(eval-after-load "slime"
;;  '(progn (slime-setup '(slime-repl))))

;;(add-to-list 'load-path "~/opt/slime")
;;(require 'slime)
;;(slime-setup)

 