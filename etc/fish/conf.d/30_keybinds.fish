bind -s -e -a 

bind -s \cy yank
bind -s -k left suppress-autosuggestion backward-char
bind -s -k right forward-char
bind -s \e\[D suppress-autosuggestion backward-char
bind -s \e\[C forward-char
bind -s -k ppage beginning-of-history
bind -s -k npage end-of-history
bind -s \cx fish_clipboard_copy
bind -s \cv fish_clipboard_paste
bind -s \e cancel
bind -s \t complete
bind -s \cs pager-toggle-search
bind -s -k btab complete-and-search
bind -s \e\n commandline\ -i\ \\n
bind -s \e\r commandline\ -i\ \\n
bind -s -k down down-or-search
bind -s -k up up-or-search
bind -s \e\[A up-or-search
bind -s \e\[B down-or-search
bind -s \e\eOC nextd-or-forward-word
bind -s \e\eOD prevd-or-backward-word
bind -s \e\e\[C nextd-or-forward-word
bind -s \e\e\[D prevd-or-backward-word
bind -s \eO3C nextd-or-forward-word
bind -s \eO3D prevd-or-backward-word
bind -s \e\[3C nextd-or-forward-word
bind -s \e\[3D prevd-or-backward-word
bind -s \e. history-token-search-backward
bind -s \el __fish_list_current_token
bind -s \cc __fish_cancel_commandline
bind -s \cw backward-kill-path-component
bind -s \e\[F end-of-line
bind -s \e\[H beginning-of-line
bind -s \ed kill-word
bind -s \cd delete-or-exit
bind -s -k f1 __fish_man_page
bind -s \eh __fish_man_page
bind -s \ep __fish_paginate
bind -s \e\# __fish_toggle_comment_commandline
bind -s \ee edit_command_buffer
bind -s \ev edit_command_buffer
bind -s -m paste \e\[200\~ __fish_start_bracketed_paste
bind -s -M paste \\ __fish_commandline_insert_escaped\ \\\\\ \$__fish_paste_quoted
bind -s '' self-insert
bind -s \r execute
bind -s \ck kill-line
bind -s -k dc delete-char
bind -s -k backspace backward-delete-char
bind -s -k home beginning-of-line
bind -s -k end end-of-line
bind -s \ca beginning-of-line
bind -s \ce end-of-line
bind -s \cp up-or-search
bind -s \cn down-or-search
bind -s \ce upcase-word
bind -s \e\b backward-kill-word
bind -s \eb backward-word
bind -s \ef forward-word
bind -s \e\[1\;5C forward-word
bind -s \e\[1\;5D backward-word

bind -s \cl forward-word
bind -s \cj backward-word
bind -s \cw backward-kill-word
bind -s \ca backward-kill-path-component
bind -s -k up up
bind -s -k down down
bind -s -k btab complete-and-search
