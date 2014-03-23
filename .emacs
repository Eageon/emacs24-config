

(set-frame-font "Ubuntu Mono-16")

;;(setq-default cursor-type 'bar)



(require 'cedet)
(require 'eieio)
(require 'eieio-speedbar)
(require 'ede/source)
(require 'ede/base)
(require 'ede/auto)
(require 'srecode)
(require 'semantic)

(setq my-emacs-lisps-path "/home/leageon/.emacs.d/")
(add-to-list 'load-path 
	"/home/leageon/.emacs.d/")
(require 'my-subdirs)
(add-to-list 'load-path
	"/home/leageon/.emacs.d/my-lisps")
(require 'ahei-misc)


(global-ede-mode t)
(global-srecode-minor-mode 1)
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion


(my-add-subdirs-to-load-path "/home/leageon/.emacs.d/elpa")
;;(add-to-list 'load-path 
;;  "/home/leageon/.emacs.d/elpa/yasnippet-20140106.1009")
(require 'yasnippet)
(yas-global-mode 1)


;;(add-to-list 'load-path
;;	"/home/leageon/.emacs.d/elpa/popup-20131230.544")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-clang-flags (quote ("-I/usr/include" "-I/usr/local/include" "-I/usr/include/c++/4.8" "-I/usr/include/clang/3.4/include" "-I." "-I./include" "-I../include")))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-theme-load-path (quote ("~/.emacs.d/themes" custom-theme-directory t)))
 '(desktop-after-read-hook (quote (list-buffers)))
 '(desktop-save (quote ask))
 '(desktop-save-hook nil)
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/leageon/build/emacs-clang-complete-async/src" "/home/leageon/build/FileSystem" "/home/leageon/build/filesystem" "/home/leageon/build/matrix")))
 '(electric-indent-mode t)
 '(electric-layout-mode t)
 '(font-use-system-font nil)
 '(haskell-indent-spaces 2)
 '(haskell-mode-hook (quote (imenu-add-menubar-index turn-on-haskell-doc)))
 '(icomplete-mode t)
 '(icomplete-show-key-bindings t)
 '(line-number-mode t)
 '(lisp-mode-hook (quote (imenu-add-menubar-index)))
 '(next-line-add-newlines t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(scroll-bar-mode nil)
 '(semantic-c-dependency-system-include-path (quote ("/usr/local/include" "/usr/include")))
 '(semantic-default-c-path (quote ("/usr/include" "/usr/local/include" "/usr/include/c++/4.6")))
 '(semantic-default-submodes (quote (global-semantic-highlight-func-mode global-semantic-stickyfunc-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode global-semantic-idle-local-symbol-highlight-mode global-semantic-show-parser-state-mode)))
 '(semantic-mode t)
 '(semanticdb-project-roots (quote ("/home/leageon/build/FileSystem")))
 '(standard-indent 4)
 '(tool-bar-mode t)
 '(tool-bar-style (quote text))
 '(tramp-default-method "ssh")
 '(tramp-default-proxies-alist nil)
 '(tramp-default-user-alist (quote (("\\`smb\\'" nil nil) ("\\`\\(?:fcp\\|krlogin\\|r\\(?:cp\\|emcp\\|sh\\)\\|telnet\\)\\'" nil "leageon") ("\\`\\(?:ksu\\|su\\(?:do\\)?\\)\\'" nil "root") ("\\`\\(?:socks\\|tunnel\\)\\'" nil "leageon") ("\\`synce\\'" nil nil))))
 '(tramp-verbose 3)
 '(visible-cursor t)
 '(w3m-command "/usr/bin/w3m")
 '(w3m-fb-mode t)
 '(w3m-home-page "www.google.com")
 '(w3m-use-favicon nil))

(load "ede/loaddefs" nil 'nomessage)

(declare-function ede-commit-project "ede/custom")
(declare-function ede-convert-path "ede/files")
(declare-function ede-directory-get-open-project "ede/files")
(declare-function ede-directory-get-toplevel-open-project "ede/files")
(declare-function ede-directory-project-p "ede/files")
(declare-function ede-find-subproject-for-directory "ede/files")
(declare-function ede-project-directory-remove-hash "ede/files")
(declare-function ede-toplevel "ede/base")
(declare-function ede-toplevel-project "ede/files")
(declare-function ede-up-directory "ede/files")
(declare-function semantic-lex-make-spp-table "semantic/lex-spp")

(defconst ede-version "1.2"
  "Current version of the Emacs EDE.")

;;(add-to-list 'load-path
;;	     "/home/leageon/.emacs.d/elpa/ecb-20131116.1319")
(require 'ecb-autoloads)

;;(add-to-list 'load-path
;;	     "/home/leageon/.emacs.d/elpa/auto-complete-20131128.233")
(require 'auto-complete)
(require 'auto-complete-config)
;;(ac-config-default)

(require 'xcscope)

;;(require 'auto-complete-settings)

(require 'auto-complete-clang)

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

;;(add-hook 'c-mode-hook
;;	  (lambda ()
;;	    (add-to-list 'ac-sources 'ac-source-c-headers)
;;              (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))


;;使用易码肆24内嵌的功能：
(require 'electric)
;;编辑时智能缩进，类似于C-j的效果——这个C-j中，zencoding和electric-pair-mode冲突
;;(electric-indent-mode t)
;;系统本身内置的智能自动补全括号
(electric-pair-mode t)
;;特定条件下插入新行
;;(electric-layout-mode t)

;;(defun my-auto-pairs ()
;;   	(interactive)
;;   	(make-local-variable 'skeleton-pair-alist)
;;   	(setq skeleton-pair-alist  '(
;;     	(?` ?` _ "''")
;;     	(?\(  _ ")")
;;     	(?\[  _ "]")
;;     	(?{ > \n > _ \n ?} >)))
;;   	(setq skeleton-pair t)
;;   	(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;  	(local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;   	(local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
;;   	(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)) 
;;(add-hook 'c-mode-hook 'my-auto-pairs)
;;(add-hook 'c++mode-hook 'my-auto-pairs)
;;(add-hook 'emacs-lisp-mode-hook 'my-auto-pairs)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:inherit popup-face))))
 '(ac-clang-candidate-face ((t (:inherit popup-face))))
 '(ac-clang-selection-face ((t (:inherit popup-menu-selection-face))))
 '(border ((t nil)))
 '(cursor ((t (:background "dark goldenrod"))))
 '(diredp-compressed-file-suffix ((t (:foreground "Blue"))))
 '(scroll-bar ((t (:background "black" :foreground "black")))))


(tool-bar-mode 0)

(add-to-list 'load-path 
  "/home/leageon/.emacs.d")

(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-agent-file-name "/usr/local/bin/ibus-el-agent")
(ibus-define-common-key ?\C-\s nil)
(ibus-define-common-key ?\C-/ nil)
(ibus-define-common-key ?\C-\; nil)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(setq c-default-style "linux"
          c-basic-offset 4)

;;;;;;;;;;;;
;; Scheme 
;;;;;;;;;;;

(require 'cmuscheme)
(setq scheme-program-name "petite")         ;; 如果用 Petite 就改成 "petite"


;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))


(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))


(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))


(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
  (lambda ()
    (paredit-mode 1)
    (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
    (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))



(require 'undo-tree)
(global-undo-tree-mode)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))




(show-paren-mode t)

(require 'dired-details)
(dired-details-install)

(require 'dired-details+)

(require 'dired-single)

(defun my-dired-init ()
        "Bunch of stuff to run for dired, either immediately or when it's
         loaded."
        ;; <add other stuff here>
	(define-key dired-mode-map [return] 'dired-single-buffer)
        (define-key dired-mode-map [down-mouse-1] 'dired-single-buffer-mouse)
        (define-key dired-mode-map "^"
      	(function
	 (lambda nil (interactive) (dired-single-buffer "..")))))

      ;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
      	;; we're good to go; just add our bindings
      	(my-dired-init)
        ;; it's not loaded yet, so add our bindings to the load-hook
        (add-hook 'dired-load-hook 'my-dired-init))

;;(require 'dired+)
;;(toggle-diredp-find-file-reuse-dir 1)
(tooltip-mode 0)

;;(require 'tramp)
;;(add-to-list 'tramp-default-proxies-alist 
;;             '("\\`asterisk\\'" 
;;               "\\`root\\'" 
;;               "/ssh:jxy132330@cs2.utdallas.edu:"))

(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) ; the default is 500
(setq cider-repl-history-file "~/cider/history")













