(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(electric-indent-mode t)
(delete-selection-mode t)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
;;设置窗口位置为屏库左上角(20,0)
(set-frame-position (selected-frame) 130 0)
;;设置宽和高,我的十寸小本是110,33,大家可以调整这个参数来适应自己屏幕大小
(set-frame-width (selected-frame) 150)
(set-frame-height (selected-frame) 44)
(load-theme 'solarized-dark t)

(provide 'init-ui)
