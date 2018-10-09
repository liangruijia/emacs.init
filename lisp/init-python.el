(require 'elpy)
(elpy-enable)
;; enable elpy jedi backend
(setq elpy-rpc-backend "jedi")

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in edit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; grammal check:flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(when (require 'flycheck nil t)
  (setq elpy-modules(delp 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; virtual environment: virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/tensorflow/")

(provide 'init-python)
