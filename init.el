

;;显示时间
(display-time-mode 1) ;; 常显 
(setq display-time-24hr-format t) ;;格式 
(setq display-time-day-and-date t) ;;显示时间、星期、日期

;;隐藏菜单栏工具栏滚动条
(tool-bar-mode 0) 
;;(menu-bar-mode 0) 
(scroll-bar-mode 0)

;;关闭启动画面
(setq inhibit-startup-message t)

;;高亮当前行
(global-hl-line-mode 1)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(package-initialize)
(add-to-list'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setenv "PATH" "/usr/local/bin:$PATH" t)
(add-to-list 'exec-path "/usr/local/bin")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(menu-bar-mode t)
 '(package-selected-packages (quote (company evil solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Meslo LG S for Powerline")))))

;;默认开启evil
(require 'evil)
(evil-mode t)

;;默认开启company
(add-hook 'after-init-hook'global-company-mode)
