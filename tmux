# look good
set -g default-terminal "screen-256color"

# act like GNU screen
unbind C-b
set -g prefix C-a

# a mouse
set -g mode-mouse on
setw -g mouse-select-window on
setw -g mouse-select-pane on

# act like vim
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+
unbind [
bind ` copy-mode
unbind p
bind p paste-buffer
bind -t vi-copy v begin-selection
bind -t vi-copy y copy-selection
