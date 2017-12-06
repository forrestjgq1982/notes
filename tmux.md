# Install
ubuntu:
>sudo apt install tmux

git install config from:
>https://github.com/forrestjgq/.tmux

# concept

session takes one or more windows linked to it. A window occupies the entire screen and may be split into rectangular panes, each of which is a seprate pseudo terminal.(see man 4 pty for tech detail).

Once all session are killed, tmux exits.

# command line
reattach to tmux:
>$tmux attach

# key binding

The following key are all prefixed with prefix, which is configured in .tmux.conf or .tmux.conf.local

## application
default   | new | Key binding
--------- | --- | ------------
prefix    |     | send prefix key through to application
c-z       |     | suspend tmux client
:         |     | Enter the tmux command prompt.
?         |     | List all key bindings.
D         |     | Choose a client to detach.
d         |     | Detach the current client.
r         |     | Force redraw of the attached client.
t         |     | Show the time.
n/a       | c-l | clear both screen and history(clear-history)


## session
default   | new | Key binding
--------- | --- | ------------
(         |     | Switch the attached client to the previous session.
)         |     | Switch the attached client to the next session.
L         |     | Switch the attached client back to the last session.
s         |     | Select a new session for the attached client interactively.
$         |     | Rename the current session.
n/a       | C-c | new session
n/a       | C-f | find session by name
n/a       | m   | toggle mouse



## window

default   | new | Key binding
--------- | --- | ------------
&         |     | Kill the current window.
'         |     | Prompt for a window index to select.
,         |     | Rename the current window.
.         |     | Prompt for an index to move the current window.
0 to 9    |     | Select windows 0 to 9.
c         |     | Create a new window.
f         |     | Prompt to search for text in open windows.
i         |     | Display some information about the current window.
l         |     | Move to the previously selected window.
n         | C-h | Change to the next window.
p         | C-l | Change to the previous window.
n/a       | TAB | Change to the last window.
w         |     | Choose the current window interactively.
~         |     | Show previous messages from tmux, if any.
Space     |     | Arrange the current window in the next preset layout.
M-n       |     | Move to the next window with a bell or activity marker.
M-p       |     | Move to the previous window with a bell or activity marker.

## pane
default                        | new     | Key binding
------------------------------ | ------- | ------------
c-o                            |         | rotate the panes in current window forward
!                              |         | Break the current pane out of the window.
"                              | -       | Split the current pane into two, top and bottom.
%                              | _       | Split the current pane into two, left and right.
;                              |         | Move to the previously active pane.
o                              |         | Select the next pane in the current window.
q                              |         | Briefly display pane indexes.
m                              |         | Mark the current pane (see select-pane -m).
M                              |         | Clear the marked pane.
Page Up                        |         | Enter copy mode and scroll one page up.
Up, Down, Left, Right          | k/j/h/l | Change to the pane above, below, to the left, or to the right of the current pane.
M-1 to M-5                     |         | Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-horizontal, main-vertical, or tiled.
M-o                            |         | Rotate the panes in the current window backwards.
C-Up, C-Down, C-Left, C-Right  |         | Resize the current pane in steps of one cell.
M-Up, M-Down, M-Left, M-Right  |         | Resize the current pane in steps of five cells.
n/a                            | >       | swap current pane with next one
n/a                            | <       | swap current pane with previous one
n/a                            | +       | Maximize current pane
n/a                            | z       | Tmp Maximize current pane
n/a                            | H/L/K/D | Resize the current pane in steps of two cells.

## copy-mode

default   | new      | Key binding
--------- | -------- | ------------
-         |          | Delete the most recently copied buffer of text.
=         | or P     | Choose which buffer to paste interactively from a list.
[         | or enter | Enter copy mode to copy text or view the history.
]         | or p     | Paste the most recently copied buffer of text.
#         | or b     | List all paste buffers.



