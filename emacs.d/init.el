;; -*- mode: elisp -*-

;; INSTALL PACKAGES
;; -------------------

; all taken from https://realpython.com/blog/python/emacs-the-best-python-editor/

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy  ; basic python IDE functionality
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


(elpy-enable)

; sometimes emacs gets the wrong tab value
(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))


;; ORG MODE
;; -------------------

; loading org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)



;; BASIC CUSTOMIZATION
;; -------------------

(setq inhibit-splash-screen t) ; disable splash screen

; loading themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tomorrow-night-eighties t)

(global-visual-line-mode t) ; always use word wrap

; this shows where word wraps are so i can tell them from actual newlines
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(global-linum-mode t) ;; enable line numbers globally

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
