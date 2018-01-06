This file lists all key assignment for Source Insight.

The key binding followings the rule: **\[leader\] \[C+\]\[S+\]\[A+\](Key**)

Here \[ \] represents optional key, \[leader\] is a key binding used as prefix key for those group of functions:

| Tag | Key Binding | Functions              |
| --  | --          | --                     |
| M   | A+X         | Activate a window      |
| C   | A+C         | Comment editing        |
| P   | A+P         | Project command        |
| E   | A+E         | Editing command        |
| N   | A+N         | Navigation command     |
| X   | C+X         | Buffer or file command |

Key bindings is represented as:
- **A+** for **\<Alt\>**+
- **C+** for **\<Ctrl\>**+
- **S+** for **\<Shift\>**+

These key bindings are freely compounded to more complex keys as **C+S+A+S** represents **\<Ctrl\>\<Shift\>\<Alt\>S**

| TYPE    | CMD                               | KEY         | DESC                                                                                             |
| --      | --                                | --          | --                                                                                               |
| App     | About\_Source\_Insight            |             | Displays copyright and version information.                                                      |
| App     | Draft\_View                       |             | Toggles simple source code display.                                                              |
| Menu    | Activate\_Edit\_Menu              | M E         | Displays the Edit menu.                                                                          |
| App     | Exit\_and\_Suspend                |             | Exits Source Insight without saving files, but can recover changes again later.                  |
| App     | Exit\_Windows                     |             | Exits Source Insight and logs the current Microsoft Windows user off.                            |
| App     | Lock\_Context\_Window             |             | Toggles Context Window locking. Its contents do not change when locked.                          |
| App     | Lock\_Relation\_Window            |             | Toggles Relation Window locking. Its contents do not change when locked.                         |
| App     | Ordering\_Information             |             | Shows information on ordering Source Insight.                                                    |
| App     | Print\_Relation\_Window           |             | Prints the relation window.                                                                      |
| App     | Redraw\_Screen                    |             | Redraws all windows.                                                                             |
| App     | Refresh\_Relation\_Window         |             | Recomputes the relation window.                                                                  |
| App     | Restart\_Windows                  |             | Restarts Microsoft Windows.                                                                      |
| Menu    | Activate\_File\_Menu              | M F         | Displays the File menu.                                                                          |
| App     | Serial\_Number                    |             | Lets you enter or view your product serial number.                                               |
| App     | Setup\_Common\_Projects           |             | Creates common external projects.                                                                |
| App     | Source\_Insight\_Web\_Site        |             | Opens your web browser to the Source Dynamics website.                                           |
| App     | Touch\_All\_Files\_in\_Relation   |             | Touches all files referenced in the relation window.                                             |
| App     | Unimplemented\_Command            |             | Undefined command; possibly from a newer version of Source Insight.                              |
| Build   | Build\_Project                    |             | Builds the whole project.                                                                        |
| Build   | Clean\_Build                      |             | Performs a 'clean' build of the whole project by rebuilding everything.                          |
| Build   | Compile\_File                     |             | Compiles the current file.                                                                       |
| Build   | Run\_Project                      |             | Runs the current project program.                                                                |
| Custom  | Build\_Project                    |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Check\_In                         |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Check\_Out                        |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Clean\_Build                      |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Command\_Shell                    |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Compile\_File                     |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Explore\_Project\_Folder          |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Preview\_in\_Web\_Browser         |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Run\_Project                      |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Search\_In\_Folder                |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Sort\_File                        |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Sort\_Selection                   |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Sync\_File\_to\_Source\_Control   |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Sync\_to\_Source\_Control\_Proje  |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Undo\_Check\_Out                  |             | Custom Command or Editor Macro.                                                                  |
| Custom  | Windows\_Explorer                 |             | Custom Command or Editor Macro.                                                                  |
| Menu    | Activate\_Help\_Menu              | M H         | Displays the Help menu.                                                                          |
| Edit    | Backspace                         |             |                                                                                                  |
| Edit    | Calculate                         |             | Replaces a mathmatical expression with its result.                                               |
| Edit    | Clip\_Window\_Properties          |             | Displays the properties of the Clip Window.                                                      |
| Menu    | Activate\_Options\_Menu           | M O         | Displays the Options menu.                                                                       |
| Edit    | Copy                              | C+C         | Copies selected text to the clipboard.                                                           |
| Menu    | Activate\_Project\_Menu           | M P         | Displays the project menu.                                                                       |
| Menu    | Activate\_Search\_Menu            | M S         | Displays the Search menu.                                                                        |
| Edit    | Copy\_To\_Clip                    |             | Copies text to a named clip buffer.                                                              |
| Edit    | Cut                               | F+Del       | Copies selected text to the clipboard and deletes the text.                                      |
| Navi    | Activate\_Search\_Results         | M R         | Activates the Search Results window.                                                             |
| Navi    | Activate\_Symbol\_Window          | M L         | Opens and selects the Symbol Window for the current file.                                        |
| Menu    | Activate\_View\_Menu              | M V         | Displays the View menu.                                                                          |
| Edit    | Cut\_Selection\_or\_Paste         |             | Pastes if selection is empty, otherwise Cuts.                                                    |
| Edit    | Cut\_To\_Clip                     |             | Cuts text to a named clip buffer.                                                                |
| Edit    | Cut\_Word                         |             | Cuts the word to the right of the selection.                                                     |
| Edit    | Cut\_Word\_Left                   |             | Cuts the word to the left of the selection.                                                      |
| Edit    | Delete\_All\_Clips                |             | Deletes all user defined clips.                                                                  |
| Edit    | Delete\_Character                 | Del         | Delete the character at the cursor.                                                              |
| Menu    | Activate\_Window\_Menu            | M W         | Displays the Window menu.                                                                        |
| Menu    | Activate\_Work\_Menu              | M K         | Displays the Work menu.                                                                          |
| Edit    | Drag\_Line\_Down\_More            |             | Moves selected text down by several line.                                                        |
| Edit    | Back\_Tab                         | F+Tab       | Moves the cursor left one tab stop.                                                              |
| Edit    | Drag\_Line\_Up\_More              |             | Moves selected text up by several line.                                                          |
| Edit    | Duplicate                         |             | Duplicates the selected text.                                                                    |
| Edit    | Enter                             |             |                                                                                                  |
| Navi    | Beginning\_Of\_Selection          | C+A+[       | Moves the cursor to the beginning of an extended selection.                                      |
| Navi    | Blank\_Line\_Down                 | C+Down      | Moves cursor to the next blank line.                                                             |
| Navi    | Blank\_Line\_Up                   | C+Up        | Moves cursor to the previous blank line.                                                         |
| Edit    | Insert\_ASCII                     |             | Inserts a character by ASCII value.                                                              |
| Edit    | Insert\_File                      |             | Inserts text from a file.                                                                        |
| Navi    | Block\_Down                       | C+F+]       | Moves cursor to the previous opening block/brace.                                                |
| Navi    | Block\_Up                         | C+F+[       | Moves cursor to the following closing block/brace.                                               |
| Symbol  | Browse\_Local\_File\_Symbols      | F8          | Lists symbolic information for the current file.                                                 |
| Symbol  | Browse\_Project\_Symbols          | A+G         | Lists all symbolic information for the current project.                                          |
| View    | Clear\_Highlights                 | C+A+H       | Removes all word highlighting in all source windows.                                             |
| Edit    | New\_Clip                         |             | Creates or Loads a new clip.                                                                     |
| Edit    | Paste                             | F+Ins       | Pastes text from the clipboard.                                                                  |
| Edit    | Paste\_From\_Clip                 |             | Pastes text from a named clip buffer.                                                            |
| Edit    | Paste\_Line                       |             | Pastes text from the clipboard at the start of the current line.                                 |
| Edit    | Play\_Recording                   |             | Plays back the recording made with the "Start Recording" command.                                |
| Edit    | Redo                              | A+R         | Recreates the last editing operation after an Undo command.                                      |
| Edit    | Redo\_All                         |             | Redoes all edits to the current file.                                                            |
| Edit    | Reform\_Paragraph                 |             | Reformats line breaks in the enclosing paragraph(s).                                             |
| Edit    | Rename                            |             | Renames a file on disk and in a project.                                                         |
| File    | Close                             | X K         | Closes the current file.                                                                         |
| Edit    | Repeat\_Typing                    |             | Repeats characters that were just typed.                                                         |
| File    | Close\_All                        | X C+K       | Closes all open files.                                                                           |
| Edit    | Restore\_Lines                    |             | Restores a block of edited lines to their original contents.                                     |
| Project | Close\_Project                    | P C         | Closes the current project.                                                                      |
| Edit    | Complete\_Symbol                  | E S         | Completes typing a symbol name.                                                                  |
| Edit    | Smart\_Tab                        |             | Inserts tabs or selects the next interesting field on the line.                                  |
| Edit    | Spaces\_To\_Tabs                  |             | Converts spaces to equivalent tabs.                                                              |
| Edit    | Start\_Recording                  |             | Starts recording commands and editing operations for later playback.                             |
| Edit    | Stop\_Recording                   |             | Stops the command recorder.                                                                      |
| Edit    | Tab                               |             | Inserts a tab character.                                                                         |
| Edit    | Tabs\_To\_Spaces                  |             | Converts tabs to equivalent spaces.                                                              |
| Edit    | Copy\_Line                        |             | Copies the whole current line to the clipboard.                                                  |
| Edit    | Toggle\_Insert\_Mode              | Ins         | Toggles Insert vs. Overstrike mode.                                                              |
| Edit    | Trim\_Whitespace                  |             | Removes spaces and tabs from the ends of all lines.                                              |
| Edit    | Copy\_Line\_Right                 | E C+C       | Copies to the clipboard text from cursor to end of line.                                         |
| Edit    | Undo\_All                         |             | Undoes all edits to the current file.                                                            |
| Navi    | Cursor\_Down                      | Down        | Moves the cursor down one line.                                                                  |
| File    | Browse\_Files                     |             | Uses the system Open dialog box to open a file.                                                  |
| File    | Checkpoint                        |             | Saves the current file to disk and erases its change history.                                    |
| File    | Checkpoint\_All                   |             | Saves all open file to disk and erases its change history.                                       |
| Navi    | Cursor\_Left                      | CtrB        | Moves the cursor left one character.                                                             |
| Navi    | Cursor\_Right                     | C+F         | Moves the cursor right one character.                                                            |
| File    | Delete\_File                      |             | Deletes a file from disk and from the project.                                                   |
| File    | Load\_File                        |             | Opens or creates a new file in the current project.                                              |
| File    | Load\_Workspace                   |             | Loads a session workspace file.                                                                  |
| Navi    | Cursor\_Up                        | Up          | Moves the cursor up one line.                                                                    |
| File    | Next\_File                        |             | Closes the current file and opens another.                                                       |
| File    | Open\_Last                        |             | Opens the last file closed.                                                                      |
| Edit    | Cut\_Line                         | E W         | Cuts the whole line(s) containing the selection.                                                 |
| File    | Print                             |             | Prints the current file.                                                                         |
| Edit    | Cut\_Line\_Left                   | E A+W       | Cuts the line from the beginning up to the selection.                                            |
| File    | Reload\_Modified\_Files           |             | Reloads files that have changed outside of the editor.                                           |
| File    | Restore\_File                     |             | Restores current file to its first opened state, losing ALL changes since opening.               |
| Edit    | Cut\_Line\_Right                  | E C+W       | Cuts the line from selection to the end of the line.                                             |
| File    | Save\_A\_Copy                     |             | Saves the current fileto disk but does not replace or affect the current file.                   |
| Edit    | Delete\_Line                      | E D         | Deletes the whole line(s) containing the selection. Clipboard uneffected.                        |
| File    | Save\_All\_Quietly                |             | Saves all modified files to disk without asking first.                                           |
| Options | Display\_Options                  | M D         | Specifies options, such as screen colors, for the display.                                       |
| File    | Save\_Selection                   |             | Saves selected text to a file.                                                                   |
| File    | Save\_Workspace                   |             | Saves the current Workspace to a file.                                                           |
| Options | Document\_Options                 | M T         | Defines document file types and their properties.                                                |
| Help    | Help\_Mode                        |             | Toggles contextual help mode on and off.                                                         |
| Help    | Help                              | F1          | Displays Source Insight online help.                                                             |
| Help    | HTML\_Help                        |             | Looks up the currently selected word in the HTML Help file.                                      |
| Help    | SDK\_Help                         |             | Looks up the currently selected word in the SDK Help file.                                       |
| Help    | Setup\_HTML\_Help                 |             | Locates the external HTML Help file on your disk.                                                |
| Help    | Setup\_WinHelp\_File              |             | Locate the external WinHelp file on your disk.                                                   |
| Macro   | \_InstallSLEM\_EMACS              |             | Custom Command or Editor Macro.                                                                  |
| Macro   | \_IsMarkOn                        |             | Custom Command or Editor Macro.                                                                  |
| Macro   | \_IsSelectionMultiChars           |             | Custom Command or Editor Macro.                                                                  |
| Macro   | \_SetMarkOff                      |             | Custom Command or Editor Macro.                                                                  |
| Macro   | \_SetMarkOn                       |             | Custom Command or Editor Macro.                                                                  |
| Edit    | Drag\_Line\_Down                  | C+A+N       | Moves selected text down by one line.                                                            |
| Macro   | AddQCatCmt                        |             | Custom Command or Editor Macro.                                                                  |
| Edit    | Drag\_Line\_Up                    | C+A+P       | Moves selected text up by one line.                                                              |
| Macro   | AutoTab                           |             | Custom Command or Editor Macro.                                                                  |
| Macro   | CheckSystem                       |             | Custom Command or Editor Macro.                                                                  |
| Macro   | eAddFileHdr                       | C H         | Add a file description commentment                                                               |
| Macro   | eAutoEnter                        | Enter       | Custom Command or Editor Macro.                                                                  |
| Macro   | eBreakEighty                      | E E         | Custom Command or Editor Macro.                                                                  |
| Macro   | eBreakToNextLine                  | E C+B       | Custom Command or Editor Macro.                                                                  |
| Macro   | CopyFileFunc                      |             | Custom Command or Editor Macro.                                                                  |
| Macro   | eBufCmd                           | C+X         | Custom Command or Editor Macro.                                                                  |
| Macro   | eBufCmd                           | C+X         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCmtCmd                           | A+C         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCommentAllFunc                   | C A         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCommentAllOpenBuf                | C O         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCommentBlock                     | C /         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCommentFunc                      | C F         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCopy                             | A+W         | Custom Command or Editor Macro.                                                                  |
| Macro   | eCopyLine                         | E C         |                                                                                                  |
| Macro   | eCut                              | C+W         | Custom Command or Editor Macro.                                                                  |
| Macro   | eDoMark                           | C+F+2       | Custom Command or Editor Macro.                                                                  |
| Macro   | eEditCmd                          | A+E         | Custom Command or Editor Macro.                                                                  |
| Macro   | eGetKey                           | A+F+K       | Custom Command or Editor Macro.                                                                  |
| Macro   | eGoBack                           | A+,         | Moves the cursor to the previous location in the Selection History. If Mark is set, off it.      |
| Macro   | eGoFwd                            | A+/         | Moves the cursor to next location in the Selection History.                                      |
| Macro   | eJumpToDefinition                 | A+.         | Moves the cursor to the definition of the selected symbol. If Mark is set, off it.               |
| Macro   | eKillNextWord                     | A+D         | Custom Command or Editor Macro.                                                                  |
| Macro   | eKillPrevWord                     | A+BackSpace | Custom Command or Editor Macro.                                                                  |
| Macro   | eKillToLineEnd                    | C+K         | Custom Command or Editor Macro.                                                                  |
| Macro   | eKillToLineHead                   | A+K         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToBuffEnd                    | A+F+\>      | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToBuffHead                   | A+F+\<      | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToLineEnd                    | C+E         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToLineHead                   | C+A         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToNextChar                   | C+F         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToNextLine                   | C+N         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToNextScreen                 | C+V         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToNextWord                   | A+F         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToPrevChar                   | C+B         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToPrevLine                   | C+P         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToPrevScreen                 | A+V         | Custom Command or Editor Macro.                                                                  |
| Macro   | eMoveToPrevWord                   | A+B         | Custom Command or Editor Macro.                                                                  |
| Macro   | eNaviCmd                          | A+N         |                                                                                                  |
| Navi    | End\_Of\_Selection                | C+A+]       | Moves the cursor to the end of an extended selection.                                            |
| Macro   | eYank                             |             | Custom Command or Editor Macro.                                                                  |
| Macro   | GetContext                        |             | Custom Command or Editor Macro.                                                                  |
| Macro   | GetEnterChar                      |             | Custom Command or Editor Macro.                                                                  |
| Macro   | GetTabChar                        |             | Custom Command or Editor Macro.                                                                  |
| Macro   | IfdefBogus                        |             | Custom Command or Editor Macro.                                                                  |
| Macro   | IfdefNever                        |             | Custom Command or Editor Macro.                                                                  |
| Macro   | IfdefReview                       |             | Custom Command or Editor Macro.                                                                  |
| Macro   | InsertCPlusPlus                   |             | Custom Command or Editor Macro.                                                                  |
| Macro   | InsertFileHeader                  |             | Custom Command or Editor Macro.                                                                  |
| Macro   | InsertHeader                      |             | Custom Command or Editor Macro.                                                                  |
| Macro   | ePaste                            | C+Y         | Custom Command or Editor Macro.                                                                  |
| Macro   | InstallSLEM                       |             | Custom Command or Editor Macro.                                                                  |
| Macro   | jgq\_test                         |             | Custom Command or Editor Macro.                                                                  |
| Macro   | JumpAnywhere                      |             | Custom Command or Editor Macro.                                                                  |
| Macro   | KillLine                          |             | Custom Command or Editor Macro.                                                                  |
| Macro   | OutputSiblingSymbols              |             | Custom Command or Editor Macro.                                                                  |
| Macro   | PasteKillLine                     |             | Custom Command or Editor Macro.                                                                  |
| Macro   | RemoveQCCmt                       |             | Custom Command or Editor Macro.                                                                  |
| Macro   | ReturnTrueOrFalse                 |             | Custom Command or Editor Macro.                                                                  |
| Macro   | ePrjCmd                           | A+P         | Project related cmd                                                                              |
| Macro   | eReCenterTopBottom                | C+L         | Custom Command or Editor Macro.                                                                  |
| Macro   | eRemoveNextChar                   | C+D         | Custom Command or Editor Macro.                                                                  |
| Menu    | Activate\_Context\_Menu           |             | Right-click context menu                                                                         |
| Macro   | eRemovePrevChar                   | BackSpace   | Custom Command or Editor Macro.                                                                  |
| Macro   | eSearchNextTag                    | C+Q         |                                                                                                  |
| Macro   | eSearchPrevTag                    | A+Q         |                                                                                                  |
| Macro   | eSmartEnd                         | End         | Custom Command or Editor Macro.                                                                  |
| Macro   | eSmartHome                        | Home        | Custom Command or Editor Macro.                                                                  |
| Menu    | Activate\_Menu\_Bar               |             |                                                                                                  |
| Macro   | eUndo                             | C+/         | Custom Command or Editor Macro.                                                                  |
| Macro   | eWndCmd                           | A+X         | Custom Command or Editor Macro.                                                                  |
| App     | Exit                              | X C+C       | Exits Source Insight.                                                                            |
| Menu    | Activate\_System\_Doc\_Menu       |             | Displays the system Document menu.                                                               |
| Menu    | Activate\_System\_Menu            |             | Displays the System window menu.                                                                 |
| Navi    | Function\_Down                    | C+A+=       | Moves the cursor to the next defined function.                                                   |
| Navi    | Function\_Up                      | C+A+-       | Moves the cursor to the previously defined function.                                             |
| Symbol  | Generate\_Call\_Tree              | C+A+T       | Displays direct and indirect calls from the selected identifier.                                 |
| Menu    | Recent\_Files                     |             | Opens a recently used file.                                                                      |
| Menu    | Special\_Edit                     |             | Special edit commands.                                                                           |
| Menu    | Toolbars                          |             | Shows and hides toolbars.                                                                        |
| Navi    | Activate\_Clip\_Window            |             | Opens and selects the Clip Window.                                                               |
| Navi    | Activate\_Context\_Symbol\_List   |             | Displays project symbols in the Context Window                                                   |
| Navi    | Activate\_Context\_Window         |             | Opens and selects the Context Window                                                             |
| Navi    | Activate\_Project\_Window         |             | Opens and selects the Project Window                                                             |
| Navi    | Activate\_Relation\_Window        |             | Opens and selects the Relation Window.                                                           |
| Navi    | Go\_Back\_Toggle                  | A+M         | Toggles between the last two cursor positions.                                                   |
| Navi    | Go\_To\_Line                      | C+G         | Moves the cursor to a specified line number.                                                     |
| Navi    | Beginning\_Of\_Line               |             | Moves the cursor to the beginning of the line.                                                   |
| Navi    | Go\_To\_Next\_Link                | C+.         | Moves the cursor to the next Source Link destination.                                            |
| Navi    | Go\_To\_Previous\_Link            | C+,         | Moves the cursor to the previous Source Link destination.                                        |
| View    | Highlight\_Word                   | A+H         | Toggles highlighting of the word under the cursor in all source windows.                         |
| Search  | Incremental\_Search               | F12         | Searches incrementally while you type a pattern string.                                          |
| Search  | Incremental\_Search\_Backward     | F11         | Searches backwards incrementally while you type a pattern string.                                |
| Navi    | Bookmark                          |             | Sets or jumps to a user defined bookmark.                                                        |
| Navi    | Bottom\_Of\_File                  |             | Moves the cursor to the bottom of the file.                                                      |
| Navi    | Bottom\_Of\_Window                |             | Moves the cursor to the bottom of the window.                                                    |
| Edit    | Indent\_Left                      | F9/C+A+\<   | Moves all selected lines to the left by one tabstop.                                             |
| Edit    | Indent\_Right                     | F10/C+A+\>  | Moves all selected lines to the right by one tabstop.                                            |
| Edit    | Insert\_Line                      | E I         | Inserts a new blank line before the current line.                                                |
| Edit    | Insert\_Line\_Before\_Next        | C+I         | Inserts a new blank line after the current line.                                                 |
| Navi    | End\_Of\_Line                     |             | Moves the cursor to the end of the line.                                                         |
| Edit    | Insert\_New\_Line                 | E B         | Inserts a line break.                                                                            |
| Macro   | InsertIfdef                       | C+A+I       | Custom Command or Editor Macro.                                                                  |
| Edit    | Join\_Lines                       | C+J         | Combines the current line with the next.                                                         |
| Navi    | Go\_Back                          |             | Moves the cursor to the previous location in the Selection History.                              |
| Symbol  | Jump\_To\_Base\_Type              | N B         | Moves the cursor to the base structure type of the selected symbol.                              |
| Navi    | Go\_Forward                       |             | Moves the cursor to next location in the Selection History.                                      |
| Navi    | Go\_To\_First\_Link               |             | Moves the cursor to the first Source Link destination.                                           |
| Symbol  | Jump\_To\_Caller                  | N C         | Jumps to the caller of the current function.                                                     |
| Navi    | Go\_To\_Next\_Change              |             | Moves the cursor forward to the next set of modified lines.                                      |
| Symbol  | Jump\_To\_Definition              | N D         | Moves the cursor to the definition of the selected symbol.                                       |
| Navi    | Go\_To\_Previous\_Change          |             | Moves the cursor back to the previous set of modified lines.                                     |
| Navi    | Jump\_To\_Link                    | N L         | Moves the cursor to the other end of a Source Link.                                              |
| Navi    | Jump\_To\_Match                   | N M         | Moves cursor to matching brace, parentheses, or quote character.                                 |
| Symbol  | Jump\_To\_Prototype               | N P         | Moves the cursor to the declaration of the selected function prototype.                          |
| Options | Key\_Assignments                  | C+A+K       | Customizes command keystrokes.                                                                   |
| Navi    | Make\_Column\_Selection           |             | Makes a rectangular selection.                                                                   |
| Navi    | Page\_Down                        |             | Scrolls down by one page.                                                                        |
| Navi    | Page\_Up                          |             | Scrolls up by one page                                                                           |
| Windows | Last\_Window                      | C+Tab       | Activates the previous current source window.                                                    |
| Symbol  | Lookup\_References                | A+S         | Searches for references to the selected or specified word.                                       |
| Navi    | Parse\_Source\_Links              |             | Parses Source Links out of the current file.                                                     |
| Navi    | Scroll\_Half\_Page\_Down          |             | Scrolls window halfway down.                                                                     |
| Navi    | Scroll\_Half\_Page\_Up            |             | Scrolls window halfway up.                                                                       |
| Navi    | Scroll\_Left                      |             | Scrolls the window to the left.                                                                  |
| Navi    | Scroll\_Line\_Down                | A+Down      | Scrolls window down by one line.                                                                 |
| Navi    | Scroll\_Line\_Up                  | A+Up        | Scrolls window up by one line.                                                                   |
| Navi    | Scroll\_Right                     |             | Scrolls the window to the right.                                                                 |
| Edit    | Lowercase                         | E L         | Converts the selected text to lowercase.                                                         |
| File    | New                               | X C+N       | Creates a new open file.                                                                         |
| Navi    | Select\_Char\_Left                |             | Extends the selection one character to the left.                                                 |
| Navi    | Select\_Char\_Right               |             | Extends the selection one character to the right.                                                |
| Project | New\_Project                      | P N         | Creates a new project.                                                                           |
| File    | Open                              | C+O         | Opens or creates a new file in the current project.                                              |
| Navi    | Select\_Line\_Down                |             | Extends the selection down by one line.                                                          |
| Navi    | Select\_Line\_Up                  |             | Extends the selection up by one line.                                                            |
| Project | Open\_Project                     | P O         | Opens an existing project.                                                                       |
| Navi    | Select\_Page\_Down                |             | Extends the selection down by one page.                                                          |
| Navi    | Select\_Page\_Up                  |             | Extends the selection up by one page.                                                            |
| Navi    | Paren\_Left                       | C+9         | Moves cursor to the previous opening parentheses.                                                |
| Navi    | Select\_Sentence                  |             | Selects up to the next period.                                                                   |
| Navi    | Select\_To                        |             | Extends the selection up to the current mouse position.                                          |
| Navi    | Select\_To\_End\_Of\_File         | C+F+End     | Extends selection to end of file.                                                                |
| Navi    | Select\_To\_End\_Of\_Line         | F+End       | Extends the selection to the end of the line.                                                    |
| Navi    | Select\_To\_Start\_Of\_Line       | F+Home      | Extends the selection to the beginning of the line.                                              |
| Navi    | Select\_To\_Top\_Of\_File         | C+F+Home    | Extends selection to top of file.                                                                |
| Navi    | Paren\_Right                      | C+0         | Moves cursor to the following closing parentheses.                                               |
| Navi    | Select\_Word\_Left                | C+F+Left    | Extends the selection left by one word.                                                          |
| Navi    | Select\_Word\_Right               | C+F+Right   | Extends the selection right by one word.                                                         |
| Navi    | Selection\_History                | C+F+M       | Shows Selection History window.                                                                  |
| Navi    | Smart\_Beginning\_Of\_Line        |             | Moves the cursor to the end of the line or file.                                                 |
| Navi    | Smart\_End\_Of\_Line              |             | Moves the cursor to the end of the line or file.                                                 |
| Navi    | Toggle\_Extend\_Mode              |             | Toggle the Select vs. Extend modes for selections.                                               |
| Navi    | Top\_Of\_File                     | C+Home      | Moves the cursor to the top of the file.                                                         |
| Navi    | Top\_Of\_Window                   |             | Moves the cursor to the top of the window.                                                       |
| Navi    | Word\_Left                        |             | Moves the cursor left one word.                                                                  |
| Navi    | Word\_Right                       |             | Moves the cursor right one word.                                                                 |
| Options | Advanced\_Options                 |             | Allows you to enable and disable various internal caches.                                        |
| Options | Color\_Options                    |             | Specifies colors of user interface items.                                                        |
| Options | Context\_Window\_Properties       |             | Displays the properties of the Context Window.                                                   |
| Options | Create\_Command\_List             |             | Creates a command list text file with descriptions.                                              |
| Options | Create\_Key\_List                 |             | Creates a command keystroke listing.                                                             |
| Options | Custom\_Commands                  |             | Defines new commands that can invoke external programs.                                          |
| File    | Reload\_File                      | X R         | Reloads the current file from disk, losing ALL changes since saving.                             |
| Project | Remove\_File                      | P R         | Removes files from the current project.                                                          |
| Options | Edit\_Condition                   |             | Edits the value of the selected parsing condition.                                               |
| Options | Enable\_Event\_Handlers           |             | Enables event handler functions to be called.                                                    |
| Options | File\_Options                     |             | Specifies file management options.                                                               |
| Options | Folder\_Options                   |             | Specifies the location of data folders.                                                          |
| Options | General\_Options                  |             | Specifies general preferences.                                                                   |
| Project | Remove\_Project                   | P D         | Deletes a project.                                                                               |
| Options | Keyword\_List                     |             | Edits the keyword list used for syntax formatting the current language.                          |
| Options | Language\_Options                 |             | Sets options for all installed languages.                                                        |
| Options | Language\_Properties              |             | Edits custom language properties.                                                                |
| Options | Load\_Configuration               |             | Loads a new configuration from a file.                                                           |
| Options | Menu\_Assignments                 |             | Customizes menu contents.                                                                        |
| Options | New\_Relation\_Window             |             | Creates a new Relation Window.                                                                   |
| Options | Next\_Relation\_Window\_View      |             | Changes the view of the Relation Window.                                                         |
| Options | Page\_Setup                       |             | Specifies printing page options.                                                                 |
| Options | Preferences                       |             | Specifies user options.                                                                          |
| Options | Project\_Settings                 |             | Specifies options for Projects.                                                                  |
| Options | Project\_Window\_Properties       |             | Displays the properties of the Project Window.                                                   |
| Options | Relation\_Graph\_Properties       |             | Displays the Graphing properties of the Relation Window.                                         |
| Options | Relation\_Window\_Properties      |             | Displays the properties of the Relation Window.                                                  |
| Options | Remote\_Options                   |             | Specifies options used in a remote desktop session.                                              |
| Options | Save\_Configuration               |             | Saves the current configuration to a file.                                                       |
| Options | Searching\_Options                |             | Specifies options for searching files.                                                           |
| Options | Sort\_Symbol\_Window              |             | Cycles through sort states for the Symbol Window.                                                |
| Options | Sort\_Symbols\_By\_Line           |             | Sorts the Symbol Window by line number.                                                          |
| Options | Sort\_Symbols\_By\_Name           |             | Sorts the Symbol Window by symbol name.                                                          |
| Options | Sort\_Symbols\_By\_Type           |             | Sorts the Symbol Window by symbol type.                                                          |
| Options | Style\_Properties                 |             | Sets formatting properties for display styles.                                                   |
| Options | Symbol\_Lookup\_Options           |             | Specifies options for looking up symbol definitions.                                             |
| Options | Symbol\_Window\_Properties        |             | Displays the properties of the Symbol Window.                                                    |
| Options | Syntax\_Color                     |             | Sets display colors of language components.                                                      |
| Options | Syntax\_Decorations               |             | Specifies options for syntax decorations and auto-annotations used when displaying source files. |
| Options | Syntax\_Formatting                |             | Specifies syntax formatting options for displaying source files.                                 |
| Options | Typing\_Options                   |             | Specifies typing and editing options.                                                            |
| Project | Add\_and\_Remove\_Project\_Files  |             | Adds and removes files from the current project.                                                 |
| Project | Add\_File\_List                   |             | Adds a list of files to the current project.                                                     |
| Project | Add\_File                         |             | Adds files to the current project.                                                               |
| Edit    | Renumber                          | C+R         | Renumbers numbers found in text.                                                                 |
| Edit    | Replace                           | C+H         | Replaces text in the current file.                                                               |
| Search  | Replace\_Files                    | C+F+H       | Replaces text in multiple files.                                                                 |
| App     | Run\_Macro                        | C+A+R       | Starts running a macro instruction at the cusor position.                                        |
| Project | Project\_Report                   |             | Generates statistics for the current project.                                                    |
| Project | Rebuild\_Project                  |             | Rebuilds project data files.                                                                     |
| File    | Save                              | X C+S       | Saves the current file to disk.                                                                  |
| File    | Save\_All                         | X C+A       | Saves all open and modified files to disk.                                                       |
| File    | Save\_As                          | X A+S       | Saves the current file to a new name.                                                            |
| Search  | Search                            | C+S         | Searches for text in the current file                                                            |
| Search  | Search\_Backward                  | F3          | Searches backwards for the previous occurrence of the search pattern.                            |
| Search  | Load\_Search\_String              |             | Loads the contents of the current selection into the current search pattern.                     |
| Search  | Search\_Backward\_for\_Selection  | F+F3        | Searches for the previous occurrence of the first word in the current selection.                 |
| Search  | Search\_Files                     | C+F+F       | Searches for text across multiple files.                                                         |
| Search  | Search\_Forward                   | F4          | Searches for the next occurrence of the search pattern.                                          |
| Search  | Search\_Forward\_for\_Selection   | F+F4        | Searches for the next occurrence of the first word in the current selection.                     |
| Navi    | Select\_All                       | X A         | Selects all text in the current file.                                                            |
| Navi    | Select\_Block                     | C+-         | Selects the enclosing code block                                                                 |
| Search  | Search\_Project                   |             | Searches for text or keywords across all project files.                                          |
| Navi    | Select\_Function\_or\_Symbol      | A+-         | Selects the enclosing symbol definition, if any.                                                 |
| SrcCtrl | Check\_In                         |             | Checks the current file into the Source Control Project.                                         |
| SrcCtrl | Check\_Out                        |             | Checks the current file out of the Source Control Project.                                       |
| SrcCtrl | Sync\_File\_to\_Source\_Cont      |             | Gets the latest version of the current file from the Source Control Project.                     |
| SrcCtrl | Sync\_to\_Source\_Control\_P      |             | Gets the latest version of all Source Control Project files.                                     |
| SrcCtrl | Undo\_Check\_Out                  |             | Undoes the checkout of the current file from the Source Control Project.                         |
| Navi    | Select\_Line                      | A+F+L       | Selects the whole line.                                                                          |
| Navi    | Select\_Match                     | A+=         | Selects the matching brace, parentheses, or quote character.                                     |
| Windows | Select\_Next\_Window              | X N         | Selects the next active window.                                                                  |
| Navi    | Select\_Paragraph                 | C+=         | Selects a paragraph of text.                                                                     |
| Windows | Select\_Previous\_Window          | X B         | Selects the last window.                                                                         |
| Navi    | Select\_Word                      | A+F+W       | Selects words under cursor.                                                                      |
| File    | Show\_File\_Status                | X S         | Displays file statistics in the status bar.                                                      |
| Edit    | Simple\_Tab                       | Tab         | Simply inserts a tab and overrides 'Smart Tab' behavior.                                         |
| Symbol  | Parse\_File\_Now                  |             | Parses the current file on demand.                                                               |
| Symbol  | Symbol\_Info                      |             | Displays a popup window showing a symbol's definition.                                           |
| Toolbar | Toggle\_Arrangement\_Toolbar      |             | Shows or hides the Arrangement toolbar.                                                          |
| Toolbar | Toggle\_Build\_Toolbar            |             | Shows or hides the Build toolbar.                                                                |
| Toolbar | Toggle\_Edit\_Toolbar             |             | Shows or hides the Edit toolbar.                                                                 |
| Toolbar | Toggle\_Help\_Toolbar             |             | Shows or hides the Help toolbar                                                                  |
| Toolbar | Toggle\_Main\_Toolbar             |             | Toggles the master Toolbar on and off.                                                           |
| Toolbar | Toggle\_Navigation\_Toolbar       |             | Shows or hides the Navigation toolbar.                                                           |
| Toolbar | Toggle\_Search\_Toolbar           |             | Shows or hides the Search toolbar.                                                               |
| Toolbar | Toggle\_Source\_Control\_Toolbar  |             | Shows or hides the Source Control toolbar.                                                       |
| Toolbar | Toggle\_Standard\_Toolbar         |             | Shows or hides the standard toolbar buttons.                                                     |
| Toolbar | Toggle\_Symbols\_Toolbar          |             | Shows or hides the Symbols toolbar.                                                              |
| Toolbar | Toggle\_View\_Toolbar             |             | Shows or hides the View toolbar.                                                                 |
| Edit    | Smart\_Rename                     | C+'         | Renames an identifer in all relevant locations.                                                  |
| View    | Clip\_Window                      |             | Toggles the Clip Window on and off.                                                              |
| View    | Context\_Window                   |             | Toggles the Context Window on and off.                                                           |
| Project | Synchronize\_Files                | P S         | Synchronizes the current project with changes made to files outside the editor.                  |
| View    | Horizontal\_Scroll\_Bar           |             | Toggles the horizontal scroll bar in the current window on and off.                              |
| View    | Line\_Numbers                     |             | Toggles the display of line numbers.                                                             |
| View    | Project\_Document\_Types          |             | Displays project files by document type in the Project Window.                                   |
| View    | Project\_File\_Browser            |             | Displays the File Browser in the Project Window.                                                 |
| View    | Project\_File\_List               |             | Displays all project files in the Project Window.                                                |
| View    | Project\_Symbol\_Classes          |             | Displays project symbols by class in the Project Window.                                         |
| View    | Project\_Symbol\_List             |             | Displays all project symbols in the Project Window.                                              |
| View    | Project\_Window                   |             | Toggles the Project Window on and off.                                                           |
| View    | Relation\_Window                  |             | Toggles the Relation Window on and off.                                                          |
| View    | Show\_Relations                   |             | Views relationships to the selected symbol in the Relation Window.                               |
| View    | Status\_Bar                       |             | Toggles the Status Bar on and off.                                                               |
| View    | Symbol\_Window                    |             | Toggles the Symbol Window on and off.                                                            |
| View    | Vertical\_Scroll\_Bar             |             | Toggles the vertical scroll bar in the current window on and off.                                |
| View    | View\_Relation\_Horizontal\_Graph |             | Displays a tree graph view that grows left to right.                                             |
| View    | View\_Relation\_Outline           |             | Displays an outline view.                                                                        |
| View    | View\_Relation\_Vertical\_Graph   |             | Displays a tree graph view that grows top to bottom.                                             |
| View    | Visible\_Spaces                   |             | Toggles the display of visible spaces.                                                           |
| View    | Visible\_Tabs                     |             | Toggles the display of visible tabs.                                                             |
| View    | Visible\_Tabs\_and\_Spaces        |             | Toggles the display of visible white space.                                                      |
| Windows | Cascade\_Windows                  |             | Rearranges windows by cascading them down the screen.                                            |
| Windows | Close\_Window                     |             | Closes the current window.                                                                       |
| Edit    | Toggle\_Case                      | E T         | Toggles the case of the selected text.                                                           |
| Windows | Link\_All\_Windows                |             | Links all windows so that they scroll together.                                                  |
| Windows | Link\_Window                      |             | Links the current window to another window so that they scroll together.                         |
| Windows | New\_Window                       |             | Creates a new duplicate window.                                                                  |
| Windows | Remove\_Special\_Window\_Color    |             | Removes the special window color.                                                                |
| Edit    | Undo                              | C+Z         | Reverses the last editing operation.                                                             |
| Edit    | Uppercase                         | E U         | Converts the selected text to uppercase.                                                         |
| Windows | Show\_Clipboard                   |             | Shows the clipboard window.                                                                      |
| Windows | Special\_Window\_Color            |             | Sets the special window color.                                                                   |
| Windows | Split\_Window                     |             | Splits and unsplits the current window into 2 windows.                                           |
| Windows | Sync\_File\_Windows               |             | Scrolls all windows showing the current file to same location as the current window.             |
| Windows | Tile\_Horizontal                  |             | Tiles windows so that they are generally wider than they are tall.                               |
| Windows | Tile\_One\_Window                 |             | Minimizes all but the current window.                                                            |
| Windows | Tile\_Two\_Windows                |             | Arranges the two most recently used windows.                                                     |
| Windows | Tile\_Vertical                    |             | Tiles windows so that they are generally taller than they are wide.                              |
| Windows | Window\_List                      |             | Manages the list of source windows.                                                              |
| Windows | Zoom\_Window                      |             | Maximizes and minimizes the current window.                                                      |

