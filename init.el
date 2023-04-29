(setq user-full-name "Mark Rybalko")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default cursor-type 'bar)

(set-frame-font "Iosevka-15" nil t)

(add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode 0)))

(global-hl-line-mode t)

(global-display-line-numbers-mode 1)

(setq make-backup-files nil
      auto-save-default t)

(setq-default indent-tabs-mode nil)

(setq straight-use-package-by-default t)

;; keybinds
(global-set-key (kbd "C-c c d") 'lsp-find-definition)

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package smartparens)
(smartparens-global-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" default))
 '(warning-suppress-log-types '((comp) (comp)))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq sp-highlight-pair-overlay nil)

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/elixir-ls/release"))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package flycheck)
(use-package dap-mode)
(use-package company)
(use-package yasnippet)
(use-package yasnippet-snippets)

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :config
  (setq completion-styles '(orderless)
        completion-category-overrides '((file (styles partial-completion)))))

(require 'orderless)
(setq completion-styles '(orderless))

(use-package savehist
  :init
  (savehist-mode))

(use-package elixir-mode)

;; Alchemist
(use-package alchemist
  :ensure t
  :hook (elixir-mode . alchemist-mode))

;; Mix
(use-package mix
  :ensure t
  :hook (elixir-mode . mix-minor-mode))

(use-package indent-guide
  :ensure t
  :hook (elixir-mode . indent-guide-mode)
  :config
  (setq indent-guide-char "│"))

(use-package ruby-end
  :ensure t
  :hook (elixir-mode . ruby-end-mode))

;; Themes related packages
(use-package doom-themes)
;;(load-theme 'doom-tokyo-night)
(load-theme 'modus-vivendi)

;; git related plugins
(use-package magit)
(use-package git-gutter+)
(global-git-gutter+-mode)
(use-package diff-hl)

;; projects related packages
(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p f") 'projectile-find-file))

(use-package rg)
(require 'rg)

(use-package consult
  :ensure t
  :bind (:map projectile-mode-map
              ("C-c p s" . consult-ripgrep-in-current-project)))

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (("C-c o p" . treemacs)))

;; all the icons
(use-package all-the-icons)
;;(require 'all-the-icons)
;;(use-package treemacs-all-the-icons
;;  :after (treemacs all-the-icons)
;;  :config
;;  (treemacs-load-theme 'all-the-icons))

;;(require 'treemacs-all-the-icons)
;;(treemacs-load-theme 'all-the-icons)

;; modeline settings
(use-package doom-modeline)
(doom-modeline-mode 1)

;; dired enchantments
(use-package dired+)
;;(use-package all-the-icons-dirdce
;;  :ensure t
;;  :hook (dired-mode . all-the-icons-dired-mode))

;; tree-sitter packages
(use-package tree-sitter
  :ensure t
  :hook ((elixir-mode js-mode) . tree-sitter-mode)
  :config
  (require 'tree-sitter-langs))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

;; whiteroom mode
(use-package writeroom-mode)

;; nix files editing mode
(use-package nix-mode
  :mode "\\.nix\\'")

;; lua related plugins
(use-package lua-mode)
