# Tags used in this document

tag   | description
---   | ----------------------------------------------------------
{n}   | count, a number used to imply how many times to execute
{c}   | a character, from a to z
{C}   | a character, from A to Z
{d}   | a digit, from 0 to 9
{r}   | range of line, like 12,40 implies line 12 to line 40, % for all file range
{m}   | motion, like word(w/e), find(f/t)...
{t}   | text object, like 'aw' for a word
{X/Y} | tag {X} or tag {Y}, like {m/t} implies motion or text object
{cr}  | line breaking char like 0x0D, 0x0A, or 0x0D0x0A
{C-X} | Control + X key binding
{f}   | file name

specially, {bar} represents char '|' to avoid conflicting with table seperator.


# Global

vim options:
- -x encrypt file
- -b open binary file

Cmd         | Action
----------- | -----------------------------------------------
scriptnames | show all \*.vim script file full path vim using
%!xxd       | convert file to a hex dump
%!xxd -r    | convert from hex dump to normal

# Normal mode

## File operation

Keys      | Action
-------   | ----------------------------------------------
ZZ        | = wq
{C-^/6}   | Switching back to previous file
:X        | encrypt file
:set key= | disable file encryption



## View

Keys      | Action
--------- | ----------------------------------------------------
{C-o/i}   | jump back/forward
TAB       | = {C-i}
:jumps    | list all jumpable positions
^F, ^B    | Scroll one screen forward/backward
^D, ^U    | Scroll half screen down/up
^E, ^Y    | Scroll one line up/down, not quite useful and replaced by spf13
z{cr/./-} | move current line to the top/center/bottom of screen
zz        | = z.
{n}z{cr}  | move line {n} to the top of screen and go to that line
^L        | Redraw screen
{n}{bar}  | move to column n of current line, default n==1
`.        | move to last change in file
'.        | move to start of line of last change in file
`"        | move to last position of

folding:

Keys      | Action
--------- | ----------------------------------------------------
zf{m|t} | create folding
zo | open folding
zc | close folding
zr | reduce folding
zm | more folding
zR | open all folding
zM | close all folding
zn | disable folding
zN | enable folding
zi | toggle folding


## Motions

Keys      | Action
-----     | ----------------------------------------------------
0         | beginning of line
^         | non-blank beginning of line
$         | end of line
w         | next beginning of next word, symbol not included
W         | next beginning of next word, symbol included
b         | prev beginning of next word, symbol not included
B         | prev beginning of next word, symbol included
e/E       | end of word
g\_       | last non-blank of line end
(         | beginning of current sentence
)         | beginning of next sentence
{/}       | beginning of current /next paragraph
[]        | backwards to previous '}' in first column
[[        | backwards to previous '{' in first column
][        | forwards to previous '{' in first column
]]        | forwards to previous '}' in first column
gg        | move to last line
G         | move the last line
{n}gg/G   | move to line {n}
''        | go back to the line where gg start, or previous mark
\`\`      | go back to the char where gg start, or previous mark
m{c}      | mark a position
'{c}      | move to the first char of marking position
`{c}      | move to the marking position
m{C}      | global mark
'{C}      | global mark jump to line
`{C}      | global mark jump to position
g0/$/^    | screen line motion of 0/$/^
{bar}     | screen colomn
f/F{char} | search forward/backward on first occurrence
t/T{char} | search forward/backward before first occurrence
;         | repeat f/F/t/T
,         | repeat f/F/t/T on opposite direction
+/- | lines downward/upward on first non-blank char


The next command is not effective in spf13:

Keys      | Action
-------   | --------------------------------------------------------
H/M/L     | top/middle/last within current screen, (M seems working)
+/-       | First char of next/prev line
{ENTER}=+ | seems not working


## Text Object
text object start with 'i' or 'a' and followed with an object.

'i' prefix is used for inner object, without object boundary,
and 'a' includes boundaries.

The object list as:

key | object
--- | ----------------------------------------------
[/]  | a [] block
(/)/b | a () block
{/}/B | a {} block
\</\> | a \<\> block
t | tag block like \<a\> ... \</a\>
w/W | word
s | sentence
p | paragraph
"/'/` | a quoted string by "" or ''  or ``

## Marks

Jumping to a mark can be done by:
- backtick `: exclusive marking location
- single quote ': linewise first non-blank marking line

Marks are set by ***m***. And mark can be:
- a-z: local mark
- A-Z0-9: global mark
- `/': Position before last jump or last mark '/` set
- [/]: first/last char of previously changed or yanked text
- \<: first line or char of last selected visual area
- \>: last line or char of last selected visual area
- ": The position of last exit current buffer
- ^: Position where cursor was the last time when insert mode was stopped.
- .: Last change position
- (: start of sentence
- ): end of sentence
- {: start of paragraph
- }: end of paragraph

**hint**:
> `^ or '^ often combined with 'gi' which insert text in the same position as where insert mode was stopped last time in current buffer.

command **:marks** will list all current marks



## Modify

### Basic operation

Keys | Action
---- | -------------------------------------------------
i    | insert before curr cursor
I    | insert before non-blank head of line
a    | append after curr cursor
A    | append after eol
c    | change some object or motion
d    | delete some object or motion
r    | replace current char
R    | enter replacement mode
~    | change case of current char, and move to next char
o    | insert and go to new line in insertion mode after current line
O    | insert and go to new line in insertion mode before current line
dd   | delete whole line(s)
cc   | delete whole lines and enter insertion mode
J    | join line(s)
gu   | make lowercase
gU   | make uppercase
g~   | make oposite case
guu  | lower case whole line
gUU  | upper case whole line
g~~  | revert case whole line


**hint**:

> {n}i/I/a/A{edit}{esc} will repeat the whole editing

### Short cut

keys | refers to | action
---- | --------- | --------------------------------------
s    | cl        | change current char
S    | cc        | change whole line
C    | c$        | change to eol
x    | dl        | delete current char
X    | dh        | delete prev char
D    | d$        | delete to eol


### Automation

macro recording actually put all actions into register as text,
so when you put it with "{c}p you will see the command sequence.

as a matter of fact, you may also yank command sequence to register,
then directly play it with @{c} without recording.

the only problem is that you may not be able to enter {esc} as char.
but it can be achieved by {C-V}{esc}.

Keys    | Action
------- | -------------------------------------
q{c}    | start macro recording to register {c}
q       | end macro recording
{n}@{c} | play recorded macro at register {c}
{n}@@   | repeat previous @{c}

### External Program

Filter text with external program:
>!{motion}{program}

this will filter text from current line to the line {motion} locates with {program}.

To filter current line only, use:
>!!{program}

For exsample, input:
```
!!wc vi.md
```

the current line will be replaces as:
```
 457  2503 15213 vi.md
```
 
### Commands

 cmd              | action
 -------          | ------------------------------------
 {r}m[ove] {addr} | move {r} lines below {addr}

**examples:**

reverse all lines:
> :g/^/m 0

## Search and Replace

### Operations

For search, the operations are:

Keys       | Action
---------- | -----------------------------------------------------------------
\*, #      | search forward/backward for word under cursor, match exact words
g\* ,g#    | search forward/backward for word under cursor, not match exact words
/pattern   | search forwards
?pattern   | search backwards
/{cr}      | repeat searching forwards
?{cr}      | repeat searching backwards
n/N        | repeat in same/opposite direction
{n}f{ch}   | search forward next occurrence of {ch} in line
{n}F{ch}   | search backward next occurrence of {ch} in line
{n}t{ch}   | search forward the char before f
{n}T{ch}   | search backward the char after F
;          | repeat previous finding in same direction
,          | repeat previous finding in opposite direction

For replacement, the operations are:

Keys | Action
---- | -----------------------------------------------------------------
{n}r | replace a char without enter insert mode
R    | enter replace mode and replace one by one until ESC
{n}s | similar as r, but it delete a few chars and enter insert mode
{n}S | delete few lines and enter insert mode
S    | replace while line, keep it emtpy

**hint**:
>believe or not, {n}r == {n}R if only one char is replaced

### Commands

commands for searching:

Command    | Action
---------- | -------------------------
/pattern   | search forwards
?pattern   | search backwards
/{cr}      | repeat searching forwards
?{cr}      | repeat searching backwards

commands for substitution:
> :{r}s/old/new/[gcpe]

here '/' is the delim to seperate command parts, but it can be any
char else, so the next command is also legal:
> :{r}s@old@new@[gcpe]

word matching:
- "\\\>" matches the end of the word in searching, so ***/the\\\>*** will search for the word end with 'the' only, and will not match 'there', but "soothe" is a legal match.
- similarly, "\\\<" will match the start of a word, so "/\\\<the\\\>" will match the word "the" only


{r} can be :
- a single line {line} or line range {line},{line}
- line can be '.' for current, '$' for last, '1' for first, or specified line number like 45
- % for global, that is 1,$
- a pattern search, like g/pattern/s/old/new/g, if the first 'g' is not given the pattern will match the first matching, other than global search
- a pattern range, like /pattern/,/pattern/, or use % instead / for backward search
- pattern or line can take offset like /pattern/+1 or /pattern/-2, or $-2
- global match pattern and only replace in the matched lines
- a mark range like 't,'b or '\<,'\>

reg pattern:
- \\\* for 0 or more
- \\\(, \\\) for group
- \\+ for one or more
- \\= for zero or more
- \\{m,n} or \\{m} for repeat for range, m or n can be absent
- \\| for alternatives
- [] for char range, in which 
    + \\e for {esc}
    + \\t for {Tab}
    + \\r for {cr} 
    + \\b for {BS}
    + \\n for {LF} ???
    + see help /[] for more
- predefined ranges(can not be used in []):
    + \\d for digit
    + \\x for hex digit
    + \\s for white space
    + \\l for lowercase alpha
    + \\u for uppercase alpha
    + \\w for [a-zA-Z0-9\_]
    + \\a for [a-zA-Z]
    + all ranges as capital of above add '^' of range
    + see help /\s for more
- \\\_ matches anything following or a line break



### Global command

execute command on global matched pattern:
> :[range]global/{pattern}/{command}

## Window

the following table shows keys or commands used in multi-window.

if it is a key, it follows {C-W}, and if it is a command, it start with :, like :close

key     | action
------- | --------------------------------------------------------
s       | horizantol split window
v       | vertical split window
c       | close window
:close  | = c
:only   | close all other windows
o       | = :close
w       | jump between window
p       | goto previous window
q       | = :q
+/-/\</\> | adjust size of window
=       | make all window same size
H/J/K/L | move window to most left/buttom/top/right
T       | move current window to new tab
f       | split window and edit file name under the cursor
F       | split window and edit file name under the cursor and jump to the line number following the file name
]       | split window and jump to tag under cursor
^       | split window and edit alternate file
g {C-]} | split window and do :tjump to tag under cursor
g ]     | split window and do :tselect for tag under cursor
h/j/k/l | move to left/buttom/top/right of current window
n       | open new window

## tab page

cmd          | short | action
------------ | ----- | ----------------------------------------
tabedit {f}  | tabe  | edit in new tab
[+-0$]tabnew | n/a   | create a new page at given position
tab {cmd}    | n/a   | open new tab and exe {cmd}

## auto format

key | action
--- | -----------------------------------------------------------------
:set textwidth | break line automatically
gq{m} | format lines
:{r}center [width] | center align lines as selected range
:{r}right [width] | right align lines as selected range
:{r}left [indent] | left align lines as selected range

# Visual mode

## Common in all visual mode

key | action
--- | -----------------------------------------------------------------
c   | will change selected block
C   | will change from the selection to eol
D   | will delete to eol
d   | will delete selected block
s   | works as 'c'
~   | swap case
u   | make lowercase
U   | make uppercase
r   | fill selection with same char
R   | remove all lines selection covers and enter insertion mode
J   | join all lines covered by selected block
o   | switch to the other end of selection
O   | in block selection, move to the other end of current line
gv  | reselect the same area again
## Visual mode

supported motions:
>iw, aw, is, as, ip, ap

key | action
--- | --------------------------------------------------------------------------
\>  | shift lines covered by selection to right and fill with spaces, see option 'shiftwidth'
\<  | shift lines covered by selection to remove left spaces
## Visual line mode

## Visual blcok mode

### operation

after select a block:

key | action
--- | -------------------------------------------------------
$   | will extend all selection to eol.
I   | string}{esc} to insert text in each covered line
A   | will append text in each convered line
c   | will change selected block
C   | will change from the selection to eol
D   | will delete to eol
d   | will delete selected block
a   | won't work
s   | works as 'c'
~   | swap case
u   | make lowercase
U   | make uppercase
r   | fill block with same char
\>  | shift block to right and fill with spaces, see option 'shiftwidth'
\<  | shift block to remove left spaces
J   | join all lines covered by selected block




# Insertion Mode

Keys       | Action
-----      | ----------------------------------------------
{C-W}      | delete word before cursor
{C-U}      | delete whole current insertion line
{LEFT}     | one char left
{RIGHT}    | one char right
{S-LEFT}   | one word left
{S-RIGHT}  | one word right
{C-LEFT}   | one word left
{C-RIGHT}  | one word right
{C-B}      | begin of command line
{C-E}      | end of command line
{HOME}     | to start of line
{END}      | to end of line
{C-HOME}   | to start of file
{C-END}    | to end of file
{PageUp}   | whole screenful up
{PageDown} | whole screenful down
{C-A}      | repeat last insertion
{C-E}      | repeat as next line under cursor
{C-Y}      | repeat as previous line under cursor(invalid in spf-13)
{C-R}{r}   | insert from register
:iabbrev   | set abbreviation to word
{C-V}      | enter special char like esc or tab



Keys for completion:

Keys       | Action
-----      | ----------------------------------------------
{C-N}      | next completion
{C-P}      | previous completion
{C-X}{key} | choose certain type of item to complete

the {key} here can be:

Keys  | Action
----- | ----------------------------------------------
{C-F} | file names
{C-L} | whole lines
{C-D} | macro definitions
{C-I} | current and inclu
{C-K} | words from a dict
{C-T} | words from a thes
{C-]} | tags
{C-V} | Vim command line





# Ex Mode

Keys         | Action
------------ | ----------------------------------------------
{n}          | print line {n}
{m},{n}      | print from line {m} to line {n}
Q            | enter ex mode
vi           | exit ex mode and back to visual mode
{r}d         | delete lines
{r}m{target} | move lines
{r}t{target} | copy lines
{r}#         | tmp display contents

line number:

Keys        | Action
----------- | ----------------------------------------------
:=          | print total line number
:.=         | print current line number
:/pattern/= | print first matching line number

pattern:
- . for current line
- $ for last line
- % for 1,$, which is every line
- symbol + and - can be used after line number

{r} can be a pattern:
- g/pattern/d will delete all lines matching the pattern

# Command Line Mode

Keys         | Action
---------    | ------------------------
{LEFT}       | one char left
{RIGHT}      | one char right
{S-LEFT}     | one word left
{S-RIGHT}    | one word right
{C-LEFT}     | one word left
{C-RIGHT}    | one word right
{C-B}        | begin of command line
{C-E}        | end of command line
{C-H}        | delete one char before cursor
{C-W}        | delete one word before cursor
{C-U}        | delete whole command line text
{TAB}        | complete to next
{C-P}        | complete to previous
{C-D}        | list all complete possibilities
:hisotry [/] | show history of command line
q:           | open history in normal mode({ENTER} to execute cursor line)



# vimdiff

# Clipboard

{m} can be:
- h/l to copy char after/before
- j/k to copy next/prev line and current line

registers:
- {c} named buffer from a to z
- {C} append text to corresponding {c}
- \* for current selection, only available on X-window, for WIN32 it is system clipboard
- + system clipboard

Keys    | Action
------- | ------------------------------------------------------------------
{n}y{m} | copy,
Y       | =yy
p       | paste after current char, or current line if target is line based
P       | paste before current char, or current line if target is line based
xp      | exchange 2 chars

# History

Keys  | Action
----- | ----------------------------------------------
u     | undo once
U     | undo the modify in current line
{c-r} | redo
{n}.  | repeat last editing



# Customizing

## set option

### toggle options

Toggle options has a boolean value, to turn it on:
>:set {option}

and to turn it off:
>:set no{option}

option     | short | Action
-------    | ----- | ------------------------------------
ignorecase | ic    | Ignore case in search pattern
smartcase  | scs   | ignore case only if search without capital letter
incsearch  | is    | Increment search
hlsearch   | hls   | Highlight search
wrap       | N/A   | Wrapping around lines
spell      | N/A   | Spell checking
autowrite  | aw    | auto write file in file switching or making...
wrapscan   | ws    | NOT stop at EOF in search next, or at begin of file in searching previous
backup     | bk    | backup file before writing
autoindent | ai    | indent automatically
expandtab  | et    | expand tab to spaces
linebreak  | lbr   | break line when wrap by word


### Value options

**hint**:
> "set background" shall be before ":syntax enable", or "syntax reset" after setting 'background' to make Vim set the default colors again.


option      | shortcut | Action
----------- | -------- | ------------------------------------
whichwrap   | ww       | set keys to wrap around lines
background  | bg       | set background color type(dark or light)
colorscheme | colo     | set color scheme of vim
syntax      | syn      | set highlight option(ON/OFF) for current buffer
patchmode   | pm       | save the original file to backup as .orig
textwidth   | tw       | max width of text line, 0 to disable
shiftwidth | sw | number of space used for indention
softtabstop | sts | nmber of spaces a tab takes

## command

option        | short | action
------------- | ----- | ------------------------------------
{r}!cmd       | n/a   | exe shell cmd in {r}, like 12,19!sort
syntax        | sy    | set highlight option(enable/clear/off/manual)
{r}TOhtml     | n/a   | turn current buffer to html file
edit!         | e!    | reload last save even modified
edit          | e     | reload if not dirty
read          | r     | read in from some file
next          | n     | switch to next file to edit
previous      | prev  | switch to previous file to edit
file {name}   | f     | rename current file
saveas {name} | sav   | save current file as {name} and edit {name}

## key mapping

To generate a mapping list file:

> :redir \>\> ~/mymaps.txt
> :map
> :redir END

commands used for key mapping for different mode:

cmd  | mode
---- | -------------------------------------------
map  | Normal, Visual and Operator-pending
vmap | Visual
nmap | Normal
omap | Operator-pending
map! | Insert and Command-line
imap | Insert
cmap | Command-line

## Plugins

# Help

command         | comments
--------------- | ------------------------------------------
options         | show all support options
help '{option}' | show option help
set {option}?   | query option value
set {option}&   | set default option value
set all         | will display the complete list of options
help E{errno}   | show help info for error E{errno}
help :{cmd}     | show help info for command {cmd}
{n}K            | find man page {n} for word under cursor

