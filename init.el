(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;(require 'init-packages)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

;;加载对应的自配置文件

;;加载插件
(require 'init-packages)

;;加载方法
(require 'init-function)

;;加载页面样式组件
(require 'init-ui)

;;加载默认设置
(require 'init-better-defaults)

;;设置默认绑定键
(require 'init-keybindings)

;;加载org
(require 'init-org)

;;加载yaml模式
(require 'init-yaml)

;;加载csv模式
(require 'init-csv)

;;加载JavaScript模式
(require 'init-javascript)

;;加载python模式
;;(require 'init-python)

;;设置自定义文件
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
(put 'upcase-region 'disabled nil)
