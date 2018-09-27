(setq ring-bell-function 'ignore)


(global-auto-revert-mode t)

(global-linum-mode t)


(setq-default abbrev-mode t)
 (define-abbrev-table 'global-abbrev-table '(
                                              ;; signature
                                              ("8lrj" "liangruijia")
                                              ;; Microsoft
                                              ("8Lrj" "梁瑞加")
                                              ))

(setq make-backup-files nil)

(setq auto-save-default nil)



(recentf-mode 1)			
(setq recentf-max-menu-items 25)

;;行首C-k同时删除该行
(setq-default kill-whole-line t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;替换选中区域nn
(delete-selection-mode t)

;;设置y代表yes，n代表no
(fset 'yes-or-no-p 'y-or-n-p)

;;设置lisp模式下`不用默认生成对
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(provide 'init-better-defaults)
