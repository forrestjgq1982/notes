# Editing
## File operation
ZZ = wq
e!: reload last save even modified
e: reload if not dirty
<C-^>: Switching back to previous file


## Motions
0: beginning of line
^: non-blank beginning of line
$: end of line
w: next beginning of next word, symbol not included
W: next beginning of next word, symbol included
b: prev beginning of next word, symbol not included
B: prev beginning of next word, symbol included
e/E: end of word
(: beginning of current sentence
): beginning of next sentence
{/}: beginning of current /next paragraph
[[/]]: beginning of current/next section

## Movements
w/W: Next words header
b/B: Prev words header

gg: move to last line
<n>gg: move to line <n>
G=gg
'': go back to the line where gg start, or previous mark
` `: go back to the char where gg start, or previous mark
m<ch>: mark a position
'<ch>: move to the first char of marking position
`<ch>: move to the marking position



^F, ^B: Scroll one screen forward/backward
^D, ^U: Scroll half screen down/up

^E, ^Y: Scroll one line up/down, not quite useful and replaced by spf13

z<cr>/z./z-: move current line to the top/center/bottom of screen
<n>z<cr>: move line <n> to the top of screen and go to that line
^L: Redraw screen

The next command is not effective in spf13:
H/M/L: top/middle/last within current screen
(M seems working)

+/-: First char of next/prev line
ENTER=+: seems not working

<n>|: move to column n of current line, default n==1

`.: move to last change in file 
'.: move to start of line of last change in file

## Modify
i/I/a/A: insert or append

    hint:
    <n>i/I/a/Adosomething<esc> will repeat the whole editing


### Line
<n>o: Insert and goto new line after this, if <n> > 1, multi line share same content
<n>O: Insert and goto new line before this
<n>J: Join line, if <n> > 1, it is not join <n> times, it joins <n> lines

### Replace
<n>r: replace a char without enter insert mode
R: enter replace mode and replace one by one until ESC

    hint:
    believe or not, <n>r == <n>R if only one char is replaced

<n>s: similar as r, but it delete a few chars and enter insert mode
<n>S: delete few lines and enter insert mode
<n>c<m>: delete <m> and enter insert
<n>C: from current char, delete few lines
<n>cc=S: replace while line, keep it emtpy

<n>~: change case of current char
## Delete
<n>d<m>: delete from current char
<n>dd: delete lines
<n>D=d$j<n-1>dd

x: delete current char
X: delete prev char

## Clipboard
<n>y<m>: copy, <m> can be:
- h/l to copy char after/before
- j/k to copy next/prev line and current line
Y=yy

p: paste after current char, or current line if targeet is line based
P: paste before current char, or current line if target is line based

    hint:
    xp: exchange 2 chars

"<ch>y: yank to name buffer
"<ch>p: put from name buffer
"<CH>y: yank to append

## History
u: undo once
U: undo the modify in current line
<c-r>: redo
<n>.: repeat last editing

## Search and replacement
* , #: search forward/backward for word under cursor, match exact words
g * ,g#: search forward/backward for word under cursor, not match exact words

/pattern: search forwards
?pattern: search backwards
/<cr>: repeat searching forwards
?<cr>: repeat searching backwards
n/N: repeat in same/opposite direction

<n>f/F<ch>: search next occurrence of <ch> in line
t/T: search char before/after f/F
;/,: repeat previous finding in same/opposite direction
, is used as leader char in spf13

<range>s/old/new/[g][c]
<range> can be a pattern search: g/pattern/s/old/new/g
global match pattern and only replace in the matched lines

## ex mode
<n> print line <n>
<m>,<n>: print from line <m> to line <n>
Q: enter ex mode
vi: exit ex mode and back to visual mode

<range>d: delete lines
<range>m<target>: move lines
<range>t<target>: copy lines

<range>#: tmp display contents

line number:
:= print total line number
:.= print current line number
:/pattern/= print first matching line number
. for current line
$ for last line
% for 1,$, which is every line
symbol + and - can be used after line number

<range> can be a pattern:
g/pattern/d will delete all lines matching the pattern

# Customizing
## set option
### toggle options
syntax: set option or set nooption
query an option: set option?
set all will display the complete list of options

Here are some options:
ic: pattern search case ignore option

# Command
## filter text
<range>!cmd: like 12,19!sort|uniq

# Test
wat if iS
hat ever it is
wat if iS
buffer 2 wt is
buffer 1 what ever i
xwt wif,w. iS
wxt wif,w. iS
wxt wif,w. iS
xzzzwwwertywerty
xxxWWfj sdf
tiwerxbbdddfwhywhywhywhywhywhywhywhywhywhywhxxxxxxxxxxwhywhywhywhywhywhy
this is line one,  this is line two

hat ever it is
buffer 2 wt is
buffer 1 what ever i
if file == handl e then do somethin g   endif w what    fff
what ever i
if file == handl e then do somethin g   endif w what    fff
what ever i
