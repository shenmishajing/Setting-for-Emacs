
(delete-selection-mode t)
(global-linum-mode t)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil) 	;; tab 改为插入空格
(setq c-basic-offset 4) 				;; c c++ 缩进4个空格
(setq c-default-style "linux")			;; 没有这个 { } 就会瞎搞
(setq default-tab-width 4)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(set-language-environment "UTF-8")
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer. "
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;;修复show-paren-mode的一些bug
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )

;; dwin = do what i mean.
;;修复occur的默认设置机制
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;;orgSRC_BEGIN与SRC_END之间的代码可以高亮
(with-eval-after-load 'org
  (setq org-src-fontify-natively t))

;;自动开启recentf-mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;询问相关
(fset 'yes-or-no-p 'y-or-n-p)

;;dired-mode
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(require 'dired-x)
(setq dired-dwim-target t) 
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init-better-default)
