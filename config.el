;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "LINGAO"
      user-mail-address "xiao_lingao@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; cursor indicator
(setq
    evil-visual-state-cursor '(box "#880000")
    evil-normal-state-cursor '(box "White")
    evil-insert-state-cursor '((bar . 1) "White")
    )

;; ========= REMAP KEYS =========
;; move 5 line (5j)
(evil-define-motion myevil-next-visual-line (count)
"Move the cursor COUNT screen lines down, or 5."
:type exclusive
  (let ((line-move-visual t))
  (evil-line-move (or count 5))))

;; move 5 line (5k)
(evil-define-motion myevil-previous-visual-line (count)
"Move the cursor COUNT screen lines down, or 5."
:type exclusive
  (let ((line-move-visual t))
  (evil-line-move (or count -5))))

;; let s key behave like vim : doom specific solution (disable evil-snipe plugin)
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; (define-key evil-normal-state-map (kbd "") 'evil-substitute)
(evil-define-key nil evil-normal-state-map
  ;; navigation
  "J" 'myevil-next-visual-line
  "K" 'myevil-previous-visual-line
  "L" 'end-of-line
  "H" 'beginning-of-line-text

  ;; functions
  "?" 'comment-line
  )

;; vmap: visual mode map
(evil-define-key nil evil-visual-state-map
  ;; navigation
  "J" 'myevil-next-visual-line
  "K" 'myevil-previous-visual-line
  "L" 'end-of-line
  "H" 'beginning-of-line-text

  ;; functions
  "?" 'comment-line
  )

;; functions
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "Q") 'evil-window-delete)

;; windows
(global-set-key (kbd "M-H") 'evil-window-left)
(global-set-key (kbd "M-L") 'evil-window-right)
(global-set-key (kbd "M-J") 'evil-window-bottom)
(global-set-key (kbd "M-K") 'evil-window-up)

(map! :leader "SPC" 'nil)
(map! :leader "SPC l" '+evil/window-vsplit-and-follow)
(map! :leader "SPC h" 'evil-window-vsplit)
(map! :leader "SPC j" '+evil/window-split-and-follow)
(map! :leader "SPC k" 'evil-window-split)

;; (global-set-key (kbd "SPC SPC l") 'evil-window-vsplit)

;; evil-numbers
(global-set-key (kbd "C-a") 'evil-numbers/inc-at-pt-incremental)
(global-set-key (kbd "C-x") 'evil-numbers/dec-at-pt-incremental)        ;; FIXME: cannot work now

;; M-x package-install RET doom-modeline RET
(require 'doom-modeline)
(doom-modeline-mode 1)
