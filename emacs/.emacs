;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(set-face-font 'default "나눔고딕코딩-10")



(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)



;; (require 'php-mode)
;; ;; To use abbrev-mode, add lines like this:
;; (add-hook 'php-mode-hook
;; '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))
(load "php-mode")
(add-to-list 'auto-mode-alist
	     '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))



;; For C# tools
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(defun my-csharp-mode-fn()
  "function that runs when csharp-mode isinitialized for a buffer."
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-fn t)


;; CEDET
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "f:/emacs-23.2/site-lisp/cedet-1.0/common/cedet.el")


;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)



;; ----------------------------------------
;; ECB
;; ----------------------------------------
(add-to-list 'load-path
	     "f:/emacs-23.2/site-lisp/ecb-2.40/")
(require 'ecb-autoloads)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode nil)
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;----------------------------------------
;; YASnippet
;;----------------------------------------
(add-to-list 'load-path
	     "f:/emacs-23.2/site-lisp/yasnippet-0.6.1c")
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "f:/emacs-23.2/site-lisp/yasnippet-0.6.1c/snippets")


;;----------------------------------------
;; SCALA MODE
;;----------------------------------------
(add-to-list 'load-path
	     "f:/emacs-23.2/site-lisp/scala-mode")
(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
	  '(lambda ()
	     (yas/minor-mode-on)))

(setq yas/my-directory "f:/emacs-23.2/site-lisp/scala-mode/contrib/yasnippet/snippets")
(yas/load-directory yas/my-directory)



;;----------------------------------------
;; Erlang MODE
;;----------------------------------------
(add-to-list 'load-path
	     "F:/erlang/lib/tools-2.6.6.4/emacs")
(require 'erlang-start)

(add-to-list 'auto-mode-alist
	     '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist
	     '("\\.hrl?$" . erlang-mode))

(setq erlang-root-dir "F:/erlang")
(setq exec-path (cons "F:/erlang/bin"
		      exec-path))
(defun my-erlang-mode-hook()
  ;; when starting an Erlang shell in Emacs, default int
  ;; in the node name
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add Erlang functions to an imenu meu
  (imenu-add-to-menubar "imenu")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent))
(add-hook 'erlang-mode-hook
	  'my-erlang-mode-hook)

;;----------------------------------------
;; Erlang Distel Package
;;----------------------------------------
(add-to-list 'load-path
	     "F:/emacs-23.2/site-lisp/distel/elisp")
(require 'distel)
(distel-setup)

(defconst distel-shell-keys
  '(("\C-\M-i" erl-complete)
    ("\M-?" erl-complete)
    ("\M-." erl-find-source-under-point)
    ("\M-," erl-find-source-unwind)
    ("\M-*" erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
	  (lambda()
	    ;; add some Distel bindings to the Erlang shell
	    (dolist (spec distel-shell-keys)
	      (define-key erlang-shell-mode-map (car spec) (cadr spec)))))



;;----------------------------------------
;; EMACS JavaScript mode
;;----------------------------------------
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist
	     '("\\.js$" . js2-mode))


;;----------------------------------------
;; KEYBINDING for WINDOW SAVING
;;----------------------------------------
(global-set-key [(f1)] 'window-configuration-to-register)
(global-set-key [(f2)] 'jump-to-register)