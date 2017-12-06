# Install
ubuntu:
>sudo apt install tmux

git install config from:
>https://github.com/forrestjgq/.tmux

# Key binding

The following key are all prefixed with prefix, which is configured in .tmux.conf or .tmux.conf.local

## session
Operation              | Key binding
---------------------- | ------------
check/switch session   | s
leave session          | d
rename current session | $

## window

Operation                    | Key binding
----------------------       | ------------
new window                   | c
switch to last active window | space
close a window               | &
siwtch to window number      | window number

## pane
Operation                           | Key binding
----------------------              | ------------
next pane                           | o
show all pane number                | q
vertical split new pane             | %
horizontal split new pane           | "
maximize/minimize current pane      | z
jump between pane                   | h/j/k/l
resize pane                         | H/J/K/L
swap pane                           | \</\>
maximize current pane to new window | +

## copy mode

Operation                         | Key binding
----------------------            | ------------
enter copy-mode                   | enter
list the paste-buffers            | b
paste from the top paste buffers  | p
choose paste buffer to paste from | P


## misc
Operation                      | Key binding
----------------------         | ------------
toggle mouse mode on or off    | m
clears both screen and history | c-l

# tmux man page
atta



