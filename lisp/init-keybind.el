
(defun open-my-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-w") 'backward-kill-word)

;;一键编译运行调试

(defun run-python()
  (interactive)
  (eshell)
  )

(global-set-key (kbd "<f5>") 'run-python)

;;自动格式化整个buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;dired-mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
  
;;org-mode
(global-set-key (kbd "C-c a") 'org-agenda)

;;recentf-mode
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;修复occur的默认设置机制
(global-set-key (kbd "M-s o") 'occur-dwim)

;;修复imenu 
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;配置expang-region --------------------------------------------------------
(global-set-key (kbd "C-=") 'er/expand-region)

;;配置iedit ----------------------------------------------------------------
(global-set-key (kbd "C-;") 'iedit-mode)

;;配置helm-ag --------------------------------------------------------------
(global-set-key (kbd "C-c p s") 'helm-ag)

;;配置company --------------------------------------------------------------
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;配置auto-yasnippet -------------------------------------------------------
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

;;配置swiper ---------------------------------------------------------------
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "<f1> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f1> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


(provide 'init-keybind)
