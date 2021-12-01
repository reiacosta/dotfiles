; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; suppress annoying defaults
(setq inhibit-startup-message t)

; packages
(load "package")
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


(defun ensure-package-installed (&rest packages)
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (progn
         (package-refresh-contents)
         (package-install package))))
   packages))

(ensure-package-installed 'cider
                          'clojure-mode
                          'paredit
                          'go-mode)

; whitespace
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
