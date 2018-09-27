(require 'csv-mode)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq cvs-separators '("," ";" "|" " "))

(provide 'init-csv)
