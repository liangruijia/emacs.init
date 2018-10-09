;;插件管理
;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(require 'cl)

(when (>= emacs-major-version 24)
;;  (add-to-list 'package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
  ;;				   ("melpa" . "http://elpa.emacs-china.org/melpa/")) t)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
  )



;;add whatever packages you want here
(defvar liang/packages '(
				 company
				 monokai-theme
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 js2-mode
				 markdown-mode
				 yaml-mode
				 csv-mode
				 json-mode
				 coffee-mode
				 typescript-mode
				 prettier-js
				 nodejs-repl
				 elpy
				 flycheck
				 company-jedi
				 virtualenvwrapper
				 exec-path-from-shell
				 popwin
				 
				 )  "Default packages")

(setq package-selected-packages liang/packages)

(defun liang/packages-installed-p ()
  (loop for pkg in liang/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (liang/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg liang/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)
;; 补全后端使用anaconda
(add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
;; 补全快捷键
(global-set-key (kbd "<C-tab>") 'company-complete)
;; 补全菜单选项快捷键
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)


(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

(provide 'init-packages)
