;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Jacob Bosco"
      user-mail-address "jacob.bosco3075@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'semi-light))

(setq doom-theme 'doom-gruvbox)

(setq org-directory "~/Documents/org/")

(setq display-line-numbers-type 'relative)

projectile-project-search-path '("~/Projects/")

(setq confirm-kill-emacs nil) ;; Disable exit confirmation

(setq-default
 delete-by-moving-to-trash t            ; Delete files to trash
 fill-column 120                         ; Set width for automatic line breaks
 scroll-margin 8                        ; Add a margin when scrolling vertically
 select-enable-clipboard t              ; Merge system's and Emacs' clipboard

 )

;; Garbage-collect on focus-out, Emacs should feel snappier overall.
(add-function :after after-focus-change-function
              (defun me/garbage-collect-maybe ()
                (unless (frame-focus-state)
                  (garbage-collect))))
