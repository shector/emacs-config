(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; allow for mepla
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
    (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; start empty session on dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;; set size of window
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106) ; chars
              (height . 50) ; lines
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106)
              (height . 50)
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; another matching engine
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; M-x wttrin
(setq wttrin-default-cities '("Charlottesville"))
(setq wttrin-default-accept-language '("Accept-Language" . "en-US"))

;; automatically loads beautiful theme, file tree, and rainbow delimiters
(load-theme 'cyberpunk t)
(add-hook 'after-init-hook #'neotree-toggle)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; supposed to set tabs to two spaces iffy on certain file types
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; autocomplete on startup
(require 'auto-complete)
(global-auto-complete-mode t)

;; M-x helm swoop, search lines across buffers
(global-set-key (kbd "M-f") 'helm-swoop)

;; file finder similar to grep (fuzzy matching through directory)
(global-set-key (kbd "M-p") 'fiplr-find-file)

;; saves backup files to a single locaton
(setq backup-directory-alist `(("." . "~/.saves")))

