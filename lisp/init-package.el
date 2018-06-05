;;加载插件前的初始化 -------------------------------------------------------------

(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (progn
     (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
       (setq exec-path-from-shell-arguments '("-l")))

     (exec-path-from-shell-initialize)
     )
  )

(package-initialize)

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

(defvar my/packages '(
                ;; --- Auto-completion ---
                company
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                smartparens
                highlight-indent-guides
                ;;highlight-indentation
                ;; --- Major Mode ---
                ;;js2-mode
                ;; --- Minor Mode ---
                ;;nodejs-repl
                exec-path-from-shell
                popwin
                reveal-in-osx-finder
                expand-region
                iedit
                yasnippet
                auto-yasnippet
                helm-ag
                elpy
                flycheck
                py-autopep8
                use-package
                company-ycmd
                ;; --- Themes ---
                monokai-theme
                solarized-theme
                ) "Default packages")

(setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)

           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;;自动删除不在列表中的插件
(package-autoremove)

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
;;配置插件 -----------------------------------------------------------------

;;配置elpy ----------------------------------------------------------------
(elpy-enable)

;;配置flycheck ------------------------------------------------------------
(add-hook 'python-mode-hook 'flycheck-mode)
(setq py-autopep8-options '("--max-line-length=100"))

;;配置py-autopep8 ---------------------------------------------------------
(with-eval-after-load 'elpy-mode
  (require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;;配置cedet ---------------------------------------------------------------
;;
;;(load 'cedet)
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;;
;;配置yasnippet -----------------------------------------------------------
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;配置highlight-indent-guidesn --------------------------------------------

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)
(setq highlight-indent-guides-auto-enabled t)
(setq highlight-indent-guides-delay 0)

;;(set-face-background 'highlight-indent-guides-odd-face "darkgray")
;;(set-face-background 'highlight-indent-guides-even-face "dimgray")
;;(set-face-foreground 'highlight-indent-guides-character-face "dimgray")


;;配置popwin --------------------------------------------------------------
(require 'popwin)
(popwin-mode t)

;;配置hungry-delete -------------------------------------------------------

(require 'hungry-delete)
(global-hungry-delete-mode)

;;配置swiper ---------------------------------------------------------------
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;配置smartparens ----------------------------------------------------------
(require 'smartparens-config)
;; Always start smartparens mode
(smartparens-global-mode t)

;;配置 company--------------------------------------------------------------
(global-company-mode t)
(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'c++-mode-hook 'company-ycmd-setup)

(provide 'init-package)
