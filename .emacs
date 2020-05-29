;;;  -*- lexical-binding: t -*-
(add-to-list 'load-path "~/elisp")
;; (add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("6e70d505e0957aaa67562ff0487b7b1b1e10f879655f2c47adf85949790fb687"
     "2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001"
     default)))
 '(display-time-mode t)
 '(eldoc-idle-delay 1.0)
 '(elpy-autodoc-delay 1.0)
 '(elpy-eldoc-show-current-function nil)
 '(elpy-shell-add-to-shell-history t)
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3")
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files
   (quote
    ("~/org/personal.org" "~/org/postdoc.org" "~/org/rri.org")))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   (quote
    (highlight-indent-guides helm org-pdftools auto-virtualenv
                             imenu-anywhere smartparens diminish python-docstring sphinx-doc
                             vterm-toggle vterm julia-snail julia-repl jupyter julia-mode
                             yaml-mode yasnippet-classic-snippets calfw-ical calfw ess
                             importmagic realgud ein markdown-mode gnu-elpa-keyring-update
                             magit global-tags company-erlang company-auctex elpygen
                             exec-path-from-shell yasnippet-snippets org htmlize pdf-tools lv
                             f90-interface-browser elpy dash company-math)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(show-paren-mode t) '(size-indication-mode t) '(tool-bar-mode
                                                  nil))

;; (setq org-startup-indented t)
;; (setq org-agenda-todo-list-sublevels t)
;; (setq org-agenda-todo-ignore-scheduled t)
;; (setq org-agenda-todo-ignore-deadlines t)

;; (add-hook 'flycheck-mode-hook #'flycheck-virtualenv-setup)

;; (ido-mode t)
;; (menu-bar-mode -1)

;; Minor adjustments
(setq coding "utf-8")
(which-func-mode 1)
;; (add-to-list 'default-frame-alist '(height . 36))
;; (add-to-list 'default-frame-alist '(width . 80))
(set-default-font "7x14")
(setq inhibit-splash-screen t)
(tool-bar-mode 0)

(global-hl-line-mode)
;; (set-face-background 'hl-line nil)
;; (set-face-foreground 'hl-line nil)
;; (set-face-underline 'hl-line t)
;; (set-face-attribute 'hl-line nil :inherit nil)

(setq standard-indent 4)


; theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'leuven t)            ;
;; (set-background-color "#faf9de")
;; (add-to-list 'default-frame-alist '(background-color . "#fdf6e3"))

;; (defun my-frame-config (frame)
;;   "Custom behaviours for new frames."
;;   (with-selected-frame frame
;;     (when (display-graphic-p)
;;       (set-background-color "#fdf6e3"))))
;; run now
;; (my-frame-config (selected-frame))
;; and later
;; (add-hook 'after-make-frame-functions 'my-frame-config)

;; (defun on-after-init ()
;;   (unless (display-graphic-p (selected-frame))
;;     (set-face-background 'default "unspecified-bg" (selected-frame))))

;; (add-hook 'window-setup-hook 'on-after-init)

;; (setq leuven-scale-outline-headlines 10)
;; (setq leuven-scale-org-agenda-structure 10)
;; (setq org-fontify-whole-heading-line 10)

;; (set-face-background 'mode-line "#99ccff")
;; (set-face-foreground 'mode-line-inactive "#000000")
;; (set-face-background 'mode-line-inactive "#666666")

(display-time-mode 0)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 0)

;; (set-face-background 'hl-line "#cce5ff")
;; (set-face-foreground 'highlight nil)

(setq scroll-step 1)
(mouse-wheel-mode t)
(global-font-lock-mode t)
(show-paren-mode t)
(set-cursor-color "#ff3300")
(add-to-list 'default-frame-alist '(cursor-color . "#ff3300"))
(delete-selection-mode 1) ; make typing override text selection

;; (add-to-list 'load-path path-to-julia-repl)



;; auto-fill
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'c-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
;; (add-hook 'c-mode-hook 'turn-on-visual-line-mode)      ; c
;; (add-hook 'python-mode-hook 'turn-on-visual-line-mode) ; python
(add-hook 'tex-mode-hook 'turn-on-visual-line-mode)
;; (add-hook 'f90-mode-hook 'turn-on-visual-line-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-visual-line-mode)
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(defun ibuffer-ido-find-file (file &optional wildcards)
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory
           (let ((buf (ibuffer-current-buffer)))
             (if (buffer-live-p buf)
                 (with-current-buffer buf
                   default-directory)
               default-directory))))
     (list (ido-read-file-name "Find file: " default-directory) t)))
  (find-file file wildcards))

(require 'ibuffer)
;; (define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)

;; Auto-hungry for c
(add-hook 'c-mode-hook
          (lambda ()
	    (c-toggle-auto-hungry-state 1)
	    ))

;; offset for c
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

;; tabs to spaces
(setq-default indent-tabs-mode nil)


;; Newline without break of line
(defun newline-without-break-of-line ()
  "1. remove to end of the line.
   2. insert newline with index"
	(interactive)
	(let ((oldpos (point)))
		(end-of-line)
		(newline-and-indent)))
(global-set-key (kbd "C-j") 'newline-without-break-of-line)

;; Don't add new lines to the end of a file when using down-arrow key
(setq next-line-add-newlines nil)

;;Comments in italics
(setq w32-enable-italics t)
(make-face-italic 'font-lock-comment-face)

;; Add cuda files as c
(add-to-list 'auto-mode-alist '("\\.cu$" . c-mode))

;; Use "y or n" for answers instead of complete words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; (modify-frame-parameters nil '((wait-for-wm . nil)))

;; Auto indenta
(define-key global-map (kbd "RET") 'newline-and-indent)

(add-hook 'f90-mode-hook
          (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

;; identa o que for copiado
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
	   (and (not current-prefix-arg)
		(member major-mode '(emacs-lisp-mode lisp-mode
						     clojure-mode    scheme-mode
						     haskell-mode    ruby-mode
						     rspec-mode     ;; python-mode
						     c-mode          c++-mode
						     objc-mode       latex-mode
						     plain-tex-mode f90-mode
						     f-mode ))
		(let ((mark-even-if-inactive transient-mark-mode))
		  (indent-region (region-beginning) (region-end) nil))))))

;; Mata a linha e reduz espaços devido a identação
(defadvice kill-line (before check-position activate)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
	     (just-one-space 0)
	     (backward-char 1))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; ORG mode
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-support-shift-select t)
(setq org-todo-keywords
      '((sequence "TODO" "RUNNING" "POSTPONED" "VERIFY" "READ" "|" "DONE" "DELEGATED" "PARTIAL" "DROPPED" )))

(add-hook 'org-mode-hook 'turn-on-font-lock)

; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'python-mode-hook
					(lambda ()
						(setq indent-tabs-mode nil)
						(setq tab-width 4)
						(setq python-indent 4)))

;; python cell #%%
;; (require 'python-cell)
;; (add-hook 'python-mode-hook 'python-cell-mode 1)

;; docviem mode, auto refresh pdf
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; compile without pressing enter
(setq compilation-read-command nil)
(global-set-key (kbd "C-x c") 'compile)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq TeX-electric-sub-and-superscript t) ; auto-expand sub- and superscript

(require 'autopair)
(autopair-global-mode 1)

(require 'autopair-latex)


;; preprocessor indentation for fortran
(defadvice fortran-indent-line (after custom-indentation activate)
  (save-excursion
    (forward-line 0)
    (when (looking-at "#")
      (forward-char 1)
      (just-one-space))))

;; namelist mode
(require 'f90-namelist-mode)
(add-to-list 'auto-mode-alist '("\\.nml\\'" . f90-namelist-mode))

; auto-revert mode
(global-auto-revert-mode 1)

;; Hide stuff
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c TAB") 'hs-toggle-hiding)

;; ;; Helper for compilation. Close the compilation window if
;; ;; there was no error at all.
;; (defun compilation-exit-auclose (status code msg)
;;   ;; If M-x compile exists with a 0
;;   (when (and (eq status 'exit) (zerop code))
;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;;     (bury-buffer)
;;     ;; and delete the *compilation* window
;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   ;; Always return the anticipated result of compilation-exit-message-function
;;   (cons msg code))
;; ;; Specify my function (maybe I should have done a lambda function)
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)

;; (require 'auto-complete-config)
;; (ac-config-default)

;; indent precomiple
(require 'ppindent)

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key TeX-mode-map "\C-cm" 'TeX-insert-inline-math)
             (defun TeX-insert-inline-math (arg)
               "Like TeX-insert-brackes but for \(...\)" (interactive "P")
               (if (TeX-active-mark)
                   (progn
                     (if (< (point) (mark)) (exchange-point-and-mark))
                     (insert "\\)")
                     (save-excursion (goto-char (mark)) (insert "\\(")))
                 (insert "\\(")
                 (save-excursion
                   (if arg (forward-sexp (prefix-numeric-value arg)))
                   (insert "\\)"))))))

;; it worked
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (define-key org-mode-map "\C-cm" 'org-insert-inline-math)
;;              (defun org-insert-inline-math (arg)
;;                "Like TeX-insert-brackes but for \(...\)" (interactive "P")
;;                (progn
;;                  (if (< (point) (mark)) (exchange-point-and-mark))
;;                  (insert "\\)")
;;                  (save-excursion (goto-char (mark)) (insert "\\("))))))



;; (customize-set-variable 'LaTeX-math-abbrev-prefix (kbd "#"))

(setq c-default-style "k&r"
      c-basic-offset 4)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-triggers-in-field t)

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (setq web-mode-engines-alist
;;       '(("php"    . "\\.phtml\\'")
;;         ("blade"  . "\\.blade\\."))
;;       )

;; (require 'indent-guide)
;; (indent-guide-global-mode)
;; (set-face-foreground 'indent-guide-face "gray")
;; ;; (setq indent-guide-recursive t)
;; (setq indent-guide-delay 0.2)
;; ;; (setq indent-guide-char ":")

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-background 'highlight-indent-guides-odd-face "WhiteSmoke")
(set-face-background 'highlight-indent-guides-even-face "WhiteSmoke")
(set-face-foreground 'highlight-indent-guides-character-face "SkyBlue")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
;; (setq pylookup-dir "/home/paulo/Programs/pylookup-master")
;; (add-to-list 'load-path pylookup-dir)

;; ;; load pylookup when compile time
;; (eval-when-compile (require 'pylookup))

;; ;; set executable file and db file
;; (setq pylookup-program (concat pylookup-dir "/pylookup.py"))
;; (setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; ;; set search option if you want
;; ;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; ;; to speedup, just load it on demand
;; (autoload 'pylookup-lookup "pylookup"
;;   "Lookup SEARCH-TERM in the Python HTML indexes." t)

;; (autoload 'pylookup-update "pylookup"
;;   "Run pylookup-update and create the database at `pylookup-db-file'." t)
;; (global-set-key (kbd "C-c h") 'pylookup-lookup)

(defun my-latex-setup ()
  (defun latex-word-count ()
    (interactive)
    (let* ((this-file (buffer-file-name))
           (word-count
            (with-output-to-string
              (with-current-buffer standard-output
                (call-process "texcount" nil t nil "-brief" this-file)))))
      (string-match "\n$" word-count)
      (message (replace-match "" nil nil word-count))))
    (define-key LaTeX-mode-map "\C-cw" 'latex-word-count))
(add-hook 'LaTeX-mode-hook 'my-latex-setup t)
(put 'downcase-region 'disabled nil)

;; (add-hook 'doc-view-mode-hook 'doc-view-fit-width-to-window)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)
(elpy-enable)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(setq elpy-rpc-virtualenv-path 'current)
(setq elpy-rpc-python-command "python3")
(add-hook 'after-init-hook 'global-company-mode)
;; (add-hook 'python-mode-hook 'pyvenv-tracking-mode)
(setq elpy-rpc-timeout 10)
(setq company-idle-delay 1.0)

(setq
 python-shell-interpreter "ipython3"     ;ipython3 ?
 python-shell-interpreter-args "--simple-prompt -i"
 ;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 ;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 ;; python-shell-completion-setup-code
 ;; "from IPython.core.completerlib import module_completion"
 ;; python-shell-completion-module-string-code
 ;; "';'.join(module_completion('''%s'''))\n"
 ;; python-shell-completion-string-code
 ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 )

(setq python-indent-guess-indent-offset-verbose nil)

(progn(require 'comint)
;; (define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)
(define-key comint-mode-map (kbd "C-<right>") 'comint-dynamic-complete-filename)
(define-key comint-mode-map (kbd "<up>") 'comint-previous-matching-input-from-input)
)


;; (add-to-list 'auto-mode-alist '("\\.xls\\'" . no-xls))
;; (add-to-list 'auto-mode-alist '("\\.xlsx\\'" . no-xls))

;; (defun no-xls (&optional filename)
;;   "Run xlhtml and w3m -dump on the entire buffer.
;;     Optional FILENAME says what filename to use.
;;     This is only necessary for buffers without
;;     proper `buffer-file-name'.  FILENAME should
;;     be a real filename, not a path."
;;   (interactive "fExcel File: ")
;;   (when (and filename
;;              (not (buffer-file-name)))
;; 	(write-file (make-temp-file filename)))
;;   (erase-buffer)
;;   (shell-command
;;    (format "xlhtml -nc -te %s | w3m -dump -T text/html" (buffer-file-name))
;;    (current-buffer))
;;   (setq buffer-file-name nil)
;;   (set-buffer-modified-p nil))

;; (find-file "~/todo.org")
(add-hook 'after-init-hook (lambda () (org-agenda nil "n")))

(require 'dired+)
(diredp-toggle-find-file-reuse-dir 1)
(add-hook 'dired-load-hook
          (lambda () (require 'dired-sort-menu)))

;; (set-frame-parameter (selected-frame) 'alpha '(90 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (90 . 50)))

(pdf-tools-install)
(pdf-loader-install)

(defun tl/dired-copy-path-at-point ()
  (interactive)
  (dired-copy-filename-as-kill 0))

(define-key dired-mode-map (kbd "W") 'tl/dired-copy-path-at-point)

;; (eval-after-load 'org '(require 'org-pdfview))

;; Autocomplete ess

(setq ess-use-auto-complete t)
(setq ess-use-auto-complete 'script-only)
;; (define-key ac-completing-map (kbd "M-h") 'ac-quick-help)


;; Test autocomplete for R

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; (setq-default package-archives
;;               '(("melpa"        . "http://melpa.milkbox.net/packages/")
;;                 ("gnu"          . "http://elpa.gnu.org/packages/")))
;; (setq package-enable-at-startup nil)
;; (package-initialize)

;;; company
(require 'company)
;; (setq tab-always-indent 'complete)

(setq company-idle-delay 0.5
      company-show-numbers t
      company-minimum-prefix-length 2
      company-tooltip-flip-when-above t)

(global-set-key (kbd "C-M-/") #'company-complete)
(global-company-mode)

;;; ESS
(defun my-ess-hook ()
  ;; ensure company-R-library is in ESS backends
  (make-local-variable 'company-backends)
  (cl-delete-if (lambda (x) (and (eq (car-safe x) 'company-R-args))) company-backends)
  (push (list 'company-R-args 'company-R-objects 'company-R-library :separate)
        company-backends))

(defun essdiredhook ()
  (ess-rdired))

(add-hook 'ess-mode-hook 'my-ess-hook)
(add-hook 'R-mode-hook 'my-ess-hook)
(add-hook 'R-mode-hook 'essdiredhook)

(with-eval-after-load 'ess
  (setq ess-use-company t))

(global-set-key (kbd "<backtab>") 'company-complete-common)
(add-hook 'after-init-hook 'global-company-mode)


(require 'ansi-color)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(display-ansi-colors)
(add-hook 'Fundamental 'display-ansi-colors)


(setq ibuffer-expert t)

;; ansi-term

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)
                            ))

(add-hook 'term-mode-hook (lambda()
                            (autopair-mode -1)
                            ))


(defun put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(global-set-key (kbd "C-x g") 'magit-status)

;; Latex scale in org-mode
(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'flyspell-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

;; to have the buffer refresh after compilation
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)


;; remove decoration but leave borders
;; (setq default-frame-alist '((undecorated . t)))
;; (add-to-list 'default-frame-alist '(drag-internal-border . 1))
;; (add-to-list 'default-frame-alist '(internal-border-width . 5))
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun hide-titlebar-when-maximized (frame)
  (if (eq 'maximized (alist-get 'fullscreen (frame-parameters frame)))
      (set-frame-parameter frame 'undecorated t)
    (set-frame-parameter frame 'undecorated nil)))

(add-hook 'window-size-change-functions 'hide-titlebar-when-maximized)


(require 'epa-file)
(epa-file-enable)

;; (require 'hl-line+)
;; (toggle-hl-line-when-idle 1) ; Highlight only when idle


;; (defun my-prog-mode-hook
;;     (set fill-column 72)
;;   (set (make-local-variable 'comment-auto-fill-only-comments) t)
;;   (auto-fill-mode t))
;; (add-hook 'prog-mode-hook 'my-prog-mode-hook)


(setq fill-column 72)
;; (setq comment-auto-fill-only-comments 0)
(auto-fill-mode t)

;; (add-hook 'text-mode-hook
;;           (lambda () (auto-fill-mode -1)))



;; (autoload 'idomenu "idomenu" nil t)

(add-hook 'c-mode-hook 'imenu-add-menubar-index)      ; c
(add-hook 'python-mode-hook 'imenu-add-menubar-index) ; python
(add-hook 'tex-mode-hook 'imenu-add-menubar-index)
(add-hook 'f90-mode-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'imenu-add-menubar-index)
(add-hook 'julia-mode-hook 'imenu-add-menubar-index)
;; (global-set-key (kbd "s-i") 'idomenu)


(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)

;; keystrokes set by me
(global-set-key [f1] 'eshell) ; Copy
(global-set-key [f2] 'ibuffer)

(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-f") 'rgrep)
(global-set-key (kbd "C-c c") 'recompile)

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map [(control tab)] nil)))

(add-hook 'magit-mode-hook
          '(lambda ()
             (define-key magit-mode-map [(control tab)] nil)))

;; (require 'calfw)
;; (require 'calfw-ical)


(add-to-list 'load-path "/home/paulo/elisp")
(require 'julia-mode)
;; Add cuda files as c
(add-to-list 'auto-mode-alist '("\\.jl$" . julia-mode))

(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode

(load "regadhoc")
(global-set-key "\C-xj" 'regadhoc-jump-to-registers)
(global-set-key "\C-xm" 'regadhoc-register)

;; Beautiful hiding
(require 'hideshow)

(define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])
(defcustom hs-fringe-face 'hs-fringe-face
  "*Specify face used to highlight the fringe on hidden regions."
  :type 'face
  :group 'hideshow)
(defface hs-fringe-face
  '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
  "Face used to highlight the fringe on folded regions"
  :group 'hideshow)
(defcustom hs-face 'hs-face
  "*Specify the face to to use for the hidden region indicator."
  :type 'face
  :group 'hideshow)
(defface hs-face
  '((t (:background "#ff8" :box t)))
  "Face to hightlight the ... area of hidden regions"
  :group 'hideshow)
(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((marker-string "*fringe-dummy*")
           (marker-length (length marker-string))
           (display-string (format "(%d)..." (count-lines (overlay-start ov) (overlay-end ov))))
           )
      (overlay-put ov 'help-echo "Hiddent text. C-c,= to show")
      (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
      (overlay-put ov 'before-string marker-string)
      (put-text-property 0 (length display-string) 'face 'hs-face display-string)
      (overlay-put ov 'display display-string)
      )))
(setq hs-set-up-overlay 'display-code-line-counts)

(provide 'hideshow-fringe)

;; duplicate line and comment
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (toggle-comment-on-line)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
)
(global-set-key (kbd "C-M-;") 'duplicate-line)

;; ;; Line number
;; (require 'linum-off)
;; (global-linum-mode 1)
;; (setq linum-format "%4d")
;; (require 'linum-highlight-current-line-number)
;; (setq linum-format 'linum-highlight-current-line-number)

(setq visible-bell 1)

;; variables for python virtual environment
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")
(exec-path-from-shell-copy-env "WORKON_HOME")

;; Doc mode C-c M-d
;; (add-hook 'python-mode-hook (lambda ()
;;                               (require 'sphinx-doc)
;;                               (sphinx-doc-mode t)))
;; (add-hook 'python-mode-hook 'python-docstring-mode)


(ivy-mode 1)
;; (helm-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(define-key neotree-mode-map [f5] 'neotree-refresh)

(global-set-key [f9] 'helm-imenu)
(global-set-key (kbd "C-<f9>") 'helm-imenu-anywhere)

(require 'auto-virtualenv)
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;; Activate on changing buffers
(add-hook 'window-configuration-change-hook 'auto-virtualenv-set-virtualenv)
;; Activate on focus in
(add-hook 'focus-in-hook 'auto-virtualenv-set-virtualenv)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")
(add-hook 'dired-mode-hook 'dired-omit-mode)

(setq initial-buffer-choice "~/")
;; (setq initial-buffer-choice 'eshell)

(defun my-save-buffer (&optional arg)
  "Like `save-buffer', but does nothing in certain modes."
  (interactive "p")
  (unless (derived-mode-p 'compilation-mode
                          'help-mode
                          'inferior-python-mode
                          )
    (save-buffer arg)))

(global-set-key [remap save-buffer] #'my-save-buffer)

(setq debug-on-error nil)
(setq debug-on-quit nil)

(defun signal-restart-server ()
  "Handler for SIGUSR1 signal, to (re)start an emacs server.

Can be tested from within emacs with:
  (signal-process (emacs-pid) 'sigusr1)

or from the command line with:
$ kill -USR1 <emacs-pid>
$ emacsclient -c
"
  (interactive)
  (server-force-delete)
  (server-start)
  )
(define-key special-event-map [sigusr1] 'signal-restart-server)

;; Hide minor modes in mode-line
(require 'diminish)
(diminish 'projectile-mode "p")
(diminish 'sphinx-doc-mode)
(diminish 'python-docstring-mode)
(diminish 'flymake-mode " f")
(diminish 'indent-guide-mode)
(diminish 'autopair-mode)
(diminish 'ivy-mode)
