;; -*- mode: elisp -*-
(setq inhibit-splash-screen t) ; disable splash screen

; loading org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


; loading themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tomorrow-night-eighties t)

;; -*- visual line wrap setting -*-

; in Visual Line mode C-a, C-e, and C-k only apply to the visual lines
; this purports to return to their original behavior but seems to get ignored
; (setq line-move-visual nil)

(global-visual-line-mode t) ;always use word wrap

; this shows where word wraps are so i can tell them from actual newlines
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
