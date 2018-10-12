(require 'elpy)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq pyvenv-virtualenvwrapper-python "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3")

(elpy-enable)
;; enable elpy jedi backend
(setq elpy-rpc-backend "jedi")
;;(require 'company-jedi)
;;(defun my/python-mode-hook ()
;;  (add-to-list 'company-backends 'company-jedi))
;;(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in edit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "zh_CN.UTF-8")
(setenv "LANG" "zh_CN.UTF-8")
;; 开启虚拟环境
;;(require 'virtualenvwrapper)
;;(venv-initialize-interactive-shells)
;;(venv-initialize-eshell)
;;(setq venv-location "~/tensorflow/")
;;(add-hook 'python-mode-hook 'anaconda-mode)
(provide 'init-python)
