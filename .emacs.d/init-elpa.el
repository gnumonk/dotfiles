
;; Copyright (C): 2014 by gnumonk
;; Copyright(C): 2011 GNUv2
(require 'package)
(setq package-archives '(
                         ("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         )
      )

(package-initialize)

;; require-package function taken from below github
;; https://github.com/blueabysm/emacs.d.me/blob/master/init-elpa.el
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'bbdb)
(require-package 'erc)
(require-package 'boxquote)
(require-package 'auto-complete)
(require-package 'yasnippet)
(require-package 'dired+)
(require-package 'erc-view-log)
(require-package 'flycheck)
(require-package 'flycheck-tcl)
(require-package 'flycheck-tip)
(require-package 'flymake)
(require-package 'flymake-python-pyflakes)
(require-package 'flymake-ruby)
(require-package 'flymake-shell)
(require-package 'color-theme)
(require-package 'python-mode)
(require-package 'python-pep8)
(require-package 'python-pylint)
(require-package 'pyvenv)
(require-package 'pony-mode)
(require-package 'fold-this)
(require-package 'grep+)
(require-package 'highlight-80+)
(require-package 'htmlize)
(require-package 'jedi)
(require-package 'jedi-direx)
(require-package 'magit)

;;OSX notifications via the terminal-notifier gem for Emacs ERC.
(require-package 'erc-terminal-notifier)
;; Added this becase sometime /usr/local/bin is not set as path and w3m 
;; installation will be fail
(require 'org-install)
(require 'ob) 
(require 'ob-tangle)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))
