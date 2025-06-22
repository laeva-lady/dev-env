(setq doom-font "Fira Code-16")
(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(global-visual-line-mode -1)
(setq-default truncate-lines t)


(map!
 "C-s" #'save-buffer)


(after! 'org
        (setq org-agenda-custom-commands
        '(("v" "A better agenda view"
                ((tags "PRIORITY=\"A\""
                        ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                        (org-agenda-overriding-header "High-priority unfinished tasks:")))
                (tags "PRIORITY=\"B\""
                        ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                        (org-agenda-overriding-header "Medium-priority unfinished tasks:")))
                (tags "PRIORITY=\"C\""
                        ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                        (org-agenda-overriding-header "Low-priority unfinished tasks:")))
                (tags "customtag"
                        ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                        (org-agenda-overriding-header "Tasks marked with customtag:")))

                (agenda "")
                (alltodo "")))))
        (use-package! org-bullets
                :hook (org-mode . org-bullets-mode))
        (setq org-bullets-bullet-list '("•" "◉" "○" "✿" "◆"))
        (setq org-bullets-mode t)

        (use-package! org-appear
                :hook (org-mode . org-appear-mode))
        (setq org-appear-autoemphasis t
                org-appear-autolinks t
                org-appear-mode t
                org-appear-autosubmarkers t)
)
