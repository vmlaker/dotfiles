;; Emacs customizations.

(add-to-list 'load-path "~/.emacs.d/")

;; My favorite theme.
(load-file "~/.emacs.d/vmlaker-theme.el")

;; CMake mode.
(setq load-path (cons (expand-file-name "~/.emacs.d/cmake-mode") load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;; Sassy CSS mode.
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; Markdown mode.
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Enable SCons to use Python mode.
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
 (setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

(setq tab-width 4)
;;(require 'php-mode)

;; CoffeeScript mode.
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(require 'coffee-mode)

;; Jade mode.
(add-to-list 'load-path "~/.emacs.d/jade-mode")
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; YAML mode.
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq scss-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))

(setq c-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq objc-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

;; Using this style mainly for indentation.
(setq c-default-style "linux"
      c-basic-offset 4)

(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(setq cssm-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))

;; This cures the delay when setting the font.
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; Remove toolbar.
(if window-system
    (tool-bar-mode 0))

;; Show line numbers.
(setq line-number-mode t)

;; Show column numbers.
(setq column-number-mode t)

;; Use temporary files directory.
(defvar user-temporary-file-directory
  "~/.emacs-autosaves/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; A little bit larger font looks nicer.
(set-face-attribute 'default nil :height 110)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(vc-follow-symlinks t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
