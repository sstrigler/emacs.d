(setq user-mail-address "stefan@strigler.de")

(setq prelude-guru nil)

;; (defun disable-guru-mode ()
;;   (guru-mode -1))
;; (add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t)

;; Show line at 80 char
;(require 'fill-column-indicator)
;(setq-default fill-column 80)
;(setq-default fci-rule-width 1)
;(setq-default fci-rule-color "#686868")
;(add-hook 'erlang-mode-hook 'fci-mode)
;(fci-mode)

;; delete line does not affect the kill ring
;; taken from https://github.com/haspok/.emacs.d/blob/master/modules/keys.el
(defun delete-line ()
  (interactive)
  (delete-region
   (progn (beginning-of-line 1) (point))
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(global-set-key (kbd "<C-S-backspace>") 'delete-line)

;; dirty fix for having AC everywhere
;;(define-globalized-minor-mode real-global-auto-complete-mode
;; auto-complete-mode (lambda ()
;;                      (if (not (minibufferp (current-buffer)))
;;                          (auto-complete-mode 1))
;;                      ))
;;(real-global-auto-complete-mode t)
;;(require 'auto-complete)

(setq prelude-flyspell nil)

(setq magit-push-always-verify nil)

(global-flycheck-mode -1)
(setq tramp-use-ssh-controlmaster-options "")

(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Erlang
;; (add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.8/emacs")
;(setq erlang-root-dir "/usr/local/share")
;(setq exec-path (cons "/usr/local/bin" exec-path))
;(require 'erlang-start)
;(require 'erlang-eunit)

;; EDTS
;; https://github.com/tjarvstrand/edts

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-hook 'after-init-hook 'edts-after-init-hook)
(defun edts-after-init-hook ()
  (require 'edts-start))

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; (add-to-list 'load-path
;;              "/usr/local/lib/erlang/lib/wrangler-1.2.0/elisp")
;; (require 'wrangler)

;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;;(set-face-attribute 'default nil :height 100)

(setq erlang-indent-level 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c4465c56ee0cac519dd6ab6249c7fd5bb2c7f7f78ba2875d28a50d3c20a59473" default)))
 '(edts-man-root "/Users/zeank/.emacs.d/edts/doc/18.1")
 '(fci-rule-color "#383838")
 '(indent-tabs-mode nil)
 '(jabber-account-list (quote (("zeank@jwchat.org"))))
 '(jabber-alert-presence-hooks nil)
 '(jabber-auto-reconnect t)
 '(jabber-mode-line-mode t)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-supported-extension-expressions
   (quote
    (".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".[eh]rl" "css" "json" "xml" "jade" "config" "txt" "cfg" "")))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
