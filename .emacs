;; Emacs customizations.

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; Guess style (from https://github.com/nschum/guess-style).
(add-to-list 'load-path "~/.emacs.d/lisp/guess-style")
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)

;; My favorite theme.
(load-file "~/.emacs.d/lisp/vmlaker-theme.el")

;; CMake mode.
(setq load-path (cons (expand-file-name "~/.emacs.d/lisp/cmake-mode") load-path))
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
(add-to-list 'load-path "~/.emacs.d/lisp/coffee-mode")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(require 'coffee-mode)

;; Jade mode.
(add-to-list 'load-path "~/.emacs.d/lisp/jade-mode")
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Typescript mode.
(add-to-list 'load-path "~/.emacs.d/lisp/typescript-mode")
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))

;; JSX mode.
(add-to-list 'load-path "~/.emacs.d/lisp/jsx-mode.el/src")
(require 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx$" . jsx-mode))
;; This was from JSX mode page, but no worky:
;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;;(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; YAML mode.
(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Stop using ESS because Emacs hangs on "enabling speedbar support"
;; for too long when starting up remotely with -nw arguments.
;; ESS.
;;(add-to-list 'load-path "~/.emacs.d/lisp/ESS/lisp")
;;(load "ess-site")

(setq typescript-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq scss-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq c-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 2))))
(setq objc-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 2))))

(setq js-indent-level 2)
(setq jsx-indent-level 2)

(add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, explicitly setting to 2.
	  (setq indent-tabs-mode nil)
          (set (make-local-variable 'sgml-basic-offset) 2)))

;;(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (guess-style-guess-all)
            (setq tab-width 4)
            (setq python-indent 4)))

;; Using this style mainly for indentation.
(setq c-default-style "linux"
      c-basic-offset 4)

(setq c-basic-offset 4)
(setq tab-width 4)

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
(setq line-number-display-limit nil)
(setq line-number-display-limit-width most-positive-fixnum)

;; Show column numbers.
(setq column-number-mode t)

;; scroll one line at a time (less "jumpy" than defaults)
   
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Set scroll bar on the left, for Emacs:
;(set-scroll-bar-mode 'left)

;; Set scroll bar on the left, for XEmacs:
;; (replace nil with t to place it to the left)
;(set-specifier scrollbar-on-left-p t)
;(set-specifier scrollbar-on-left-p nil)

;; A little bit larger font looks nicer.
(set-face-attribute 'default nil :height 90 :weight 'bold)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(vc-follow-symlinks t)
 '(c-basic-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
