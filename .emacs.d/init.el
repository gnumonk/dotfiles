(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(setq my-el-get-packages  
      (append  
       '(
	 auto-complete
	 dired+
	 gnus
	 org-mode
	 bbdb
	 boxquote
	 erc
	 erc-extras
	 erc-highlight-nicknames
	 grep+
	 offlineimap
	 tail
	 color-theme-solarized
	 color-theme-tango
	 color-theme-tango-2
	 )  
       (mapcar 'el-get-source-name el-get-sources))) 

(el-get 'sync my-el-get-packages)

;; load up Org-mode and Org-babel
(require 'org-install)
(require 'ob) 
(require 'ob-tangle)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))
