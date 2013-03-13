(setq user-mail-address "stefan.strigler@erlang-solutions.com")

(defun disable-guru-mode ()
  (guru-mode -1))
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Show line at 80 char
(require 'fill-column-indicator)
(setq-default fill-column 80)
(setq-default fci-rule-width 1)
(setq-default fci-rule-color "#686868")
(add-hook 'erlang-mode-hook 'fci-mode)
(fci-mode)

;; dirty fix for having AC everywhere
;;(define-globalized-minor-mode real-global-auto-complete-mode
;;  auto-complete-mode (lambda ()
;;                       (if (not (minibufferp (current-buffer)))
;;                           (auto-complete-mode 1))
;;                       ))
;;(real-global-auto-complete-mode t)
;;(require 'auto-complete)


;; Erlang
;; (add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.8/emacs")
(setq erlang-root-dir "/usr/local/share")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)
(require 'erlang-eunit)

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;; when starting an Erlang shell in Emacs, default in the node name
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

;; EDTS
;; https://github.com/tjarvstrand/edts
(add-to-list 'load-path "~/.emacs.d/vendor/edts/")
(require 'edts-start)
(edts-man-set-root "/usr/local/Cellar/erlang/R15B03-1/share/man")

;; (defvar erlang-compile-extra-opts '((i . \"../include\") (i . \"../../../deps\")))
;; (require 'erlang-flymake)


;; http://www.emacswiki.org/emacs/FlymakeErlang
;; (defun flymake-erlang-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name temp-file
;;                                          (file-name-directory buffer-file-name))))
;;     (list "/Users/zeank/.emacs.d/personal/flymake_erlang_escript" (list local-file))))

;; (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

;; (defun get-erlang-app-dir ()
;;   (let* ((src-path (file-name-directory (buffer-file-name)))
;;          (pos (string-match "/src/" src-path)))
;;     (if pos
;;         (substring src-path 0 (+ 1 pos))
;;       src-path)))

;; (setq erlang-flymake-get-code-path-dirs-function
;;       (lambda ()
;;         (concat (get-erlang-app-dir) "ebin")))

;; (setq erlang-flymake-get-code-include-dirs-function
;;       (lambda ()
;;         (concat (get-erlang-app-dir) "include")))

;; The default setting is to warn for variables "exported" from case
;; expressions etc, which I consider superfluous. You can deactivate
;; such warnings with:
;; (eval-after-load "erlang-flymake"
;;   '(setq erlang-flymake-extra-opts
;;          (delete "+warn_export_vars" erlang-flymake-extra-opts)))

;; Distel
;; (let ((distel-dir "~/.emacs.d/vendor/distel/elisp"))
;;   (unless (member distel-dir load-path)
;;     ;; Add distel-dir to the end of load-path
;;     (setq load-path (append load-path (list distel-dir)))))

;; (require 'distel)
;; (distel-setup)

;; A number of the erlang-extended-mode key bindings are useful in the shell too
;; (defconst distel-shell-keys
;;   '(("\C-\M-i"   erl-complete)
;;     ("\M-?"      erl-complete)
;;     ("\M-."      erl-find-source-under-point)
;;     ("\M-,"      erl-find-source-unwind)
;;     ("\M-*"      erl-find-source-unwind)
;;     )
;;   "Additional keys to bind when in Erlang shell.")

;; (add-hook 'erlang-shell-mode-hook
;;           (lambda ()
;;             ;; add some Distel bindings to the Erlang shell
;;             (dolist (spec distel-shell-keys)
;;               (define-key erlang-(setq)hell-mode-map (car spec) (cadr spec)))))

;; JavaScript
;; flymake-node-jshint
(add-to-list 'load-path
              "~/.emacs.d/vendor/flymake-node-jshint")
(require 'flymake-node-jshint)
(add-hook 'js-mode-hook (lambda () (flymake-mode 1)))

;; Coffeescript
;; (add-to-list 'load-path
;;               "~/.emacs.d/coffee-mode")
;; (require 'coffee-mode)
;;(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
;;(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

;; Handlebars
;; (add-to-list 'load-path
;;               "~/.emacs.d/handlebars-mode")
;; (require 'handlebars-mode)

;; Python/Django
;; (add-to-list 'load-path
;;              "~/.emacs.d/python-mode")
;; (require 'ipython)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'python-mode-hook 'flymake-mode)

;; (add-to-list 'load-path
;;               "~/.emacs.d/yasnippet")
;; (require 'yasnippet)
;; (yas/global-mode 1)

;; (add-to-list 'load-path
;;               "~/.emacs.d/pony-mode")
;; (require 'pony-mode)

;; Make flymake display errors at minibuffer
;; http://stackoverflow.com/questions/5726988/flymake-complains-x-is-not-available-even-when-configured-not-to-use-x
;; (defun show-fly-err-at-point ()
;;   "If the cursor is sitting on a flymake error, display the message in the minibuffer"
;;   (interactive)
;;   (let ((line-no (line-number-at-pos)))
;;     (dolist (elem flymake-err-info)
;;       (if (eq (car elem) line-no)
;;           (let ((err (car (second elem))))
;;             (message "%s" (flymake-ler-text err)))))))

;; (defadvice flymake-goto-next-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))

;; (defadvice flymake-goto-prev-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))

;; (defadvice flymake-mode (before post-command-stuff activate compile)
;;   "Add functionality to the post command hook so that if the
;; cursor is sitting on a flymake error the error information is
;; displayed in the minibuffer (rather than having to mouse over
;; it)"
;;   (set (make-local-variable 'post-command-hook)
;;        (cons 'show-fly-err-at-point post-command-hook)))

;; XXXXXXXXXXXXXXXXXXXXX

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(set-face-attribute 'default nil :height 100)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(indent-tabs-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-supported-extension-expressions (quote (".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".[eh]rl" "css" "json" "xml" "jade" "config" "txt" "cfg" "")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Required for Skrill
(setq-default erlang-indent-level 2)
