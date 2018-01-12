/**
 * Install editing command
 */
macro _InstallEdit()
{

    /********************************************
     *          Line Editing Command            *
     ********************************************/

    /**
     * Swap current line with Next/Previous line
     */
	AssignKeyToCmd(3150, "Drag Line Down")  /* Ctrl+Alt+N */
	AssignKeyToCmd(3152, "Drag Line Up")    /* Ctrl+Alt+P */

    /**
     * Insert new line before or after current line
     */
	AssignKeyToCmd(1097, "Insert Line")     /* Alt+I */
	AssignKeyToCmd(1097, "Insert Line Before Next") /*  Ctrl+I */
	

    /**
     * Join current and next line, the white spaces between
     * two lines are shrinked into one space
     */
	AssignKeyToCmd(1098, "Join Lines") /* Ctrl+J */
	

    /**
     * Cut the characters before or after cursor in
     * current line, and copy into clipboard
     */
	AssignKeyToCmd(2123, "eKillToLineHead") /* Alt+K */
	AssignKeyToCmd(1099, "eKillToLineEnd") /* Ctrl+K */
	
    
    /**
     * Cut current line, and copy into clipboard
     * If there is selections across multi lines,
     * those lines will be cut
     */
	AssignKeyToCmd(1109, "Cut Line") /* Ctrl+U */
	

    /********************************************
     *          Word Editing Command            *
     ********************************************/

    /**
     * Cut word before or after cursor and 
     * copy into clipboard
     */
	AssignKeyToCmd(2056, "eKillPrevWord") /* Alt+BackSpace */
	AssignKeyToCmd(2116, "eKillNextWord") /* Alt+D */
	

    /********************************************
     *          Char Editing Command            *
     ********************************************/

    /**
     * Remove one char before or after cursor,
     * But not copy into clipboard
     */
	AssignKeyToCmd(8, "eRemovePrevChar") /* BackSpace */
	AssignKeyToCmd(1092, "eRemoveNextChar") /* Ctrl+D */
	

    /**
     * Insert a single tab forward or backward
     * if current at least one line is selected, tab will
     * indent selection forward or backward one tab size.
     * if there is no selection or part of one line is selected,
     * back tab will cancel the selection and move cursor one
     * tab size backward, and forward selection will replace
     * the selection if there is, and then insert a tab
     */
	AssignKeyToCmd(777, "Back Tab") /* Shift+Tab */
	AssignKeyToCmd(9, "Simple Tab") /* Tab */
	

    /********************************************
     *          Formation Editing Command       *
     ********************************************/

    /**
     * Indent current line or selection lines left or right
     * in the unit of tab size
     */
	AssignKeyToCmd(3116, "Indent Left") /* Ctrl+Alt+,(<) */
	AssignKeyToCmd(3118, "Indent Right") /* Ctrl+Alt+.(>) */
	
}

/**
 * Install application view related command
 */
macro _InstallView()
{
    /**
     * Jump to Project window to open file
     */
	AssignKeyToCmd(1103, "Open") /* Ctrl+O */

    /**
     * Activate symbol window
     */
    AssignKeyToCmd(2156, "Activate Symbol Window") /* Alt+L */
    /**
     * Lock or unlock context window so that it will
     * not dynamically switch to context under cursor
     */
    AssignKeyToCmd(3148, "Lock Context Window") /* Ctrl+Alt+L */
    /**
     * Open "Key assignments" dialog
     */
	AssignKeyToCmd(3147, "Key Assignments") /* Ctrl+Alt+K */

    /**
     * Open "Browse Project Symbols" dialog
     */
	AssignKeyToCmd(2119, "Browse Project Symbols") /* Alt+G */

    /**
     * Open "Call Tree" dialog
     */
	AssignKeyToCmd(3156, "Generate Call Tree") /* Ctrl+Alt+T */
	
    /**
     * Open "Browse Local File Symbols" dialog
     */
	AssignKeyToCmd(4215, "Browse Local File Symbols") /* F8 */
	
    /**
     * Switch to previous buffer window
     *
     * If you press Ctrl and do not lease, and continue to press
     * TAB, the window will continue to be switched backward in
     * window list until you release Ctrl key.
     *
     * If you Press Ctrl and TAB, than release them all, it will 
     * switch to previous window, and you press them again and 
     * release, it will turn back and forth between these two
     * windows.
     */
	AssignKeyToCmd(1033, "Last Window") /* Ctrl+Tab */
	
    /**
     * Toggle highlight of current word
     */
	AssignKeyToCmd(2120, "Highlight Word") /* Alt+H */

    /**
     * Clear all highlights in current project
     */
	AssignKeyToCmd(3144, "Clear Highlights") /* Ctrl+Alt+H */

    /**
     * Keep the cursor position, and scroll the screen to make
     * current line be in the top/center/bottom of screen
     */
	AssignKeyToCmd(1100, "eReCenterTopBottom") /* Ctrl+L */

}

/**
 * Motion command installation.
 * Here defined all movement SI can do
 */
macro _InstallMotion()
{
    /**
     * Basic movement by direction keys
     */
	AssignKeyToCmd(32807, "Cursor Right") /* Right */
	AssignKeyToCmd(32806, "Cursor Up") /* Up */
	AssignKeyToCmd(32808, "Cursor Down") /* Down */
	AssignKeyToCmd(32805, "Cursor Left") /* Left */

    /**
     * Move backward/forward by character
     */
	AssignKeyToCmd(1090, "eMoveToPrevChar") /* Ctrl+B */
	AssignKeyToCmd(1094, "eMoveToNextChar") /* Ctrl+F */

    /**
     * Move backward/forward by word
     */
	AssignKeyToCmd(2114, "eMoveToPrevWord") /* Alt+B */
	AssignKeyToCmd(2118, "eMoveToNextWord") /* Alt+F */

    /**
     * Move to beginning or end of line
     */
	AssignKeyToCmd(1089, "eMoveToLineHead") /* Ctrl+A */
	AssignKeyToCmd(1093, "eMoveToLineEnd") /* Ctrl+E */
	
    /**
     * If line contains only whitespaces, smart HOME or End
     * will behave just like Move to line head or end,
     * but if not, smart home/end will first move to the
     * first/last non-blank head/end, and another hit of
     * smart home/end will move to the line head/end
     */
	AssignKeyToCmd(32803, "eSmartEnd") /* End */
	AssignKeyToCmd(32804, "eSmartHome") /* Home */

    /**
     * Move to previous or next line
     */
	AssignKeyToCmd(1104, "eMoveToPrevLine") /* Ctrl+P */
	AssignKeyToCmd(1102, "eMoveToNextLine") /* Ctrl+N */

    /**
     * a block is something inside a pair of { and  }
     * block up and down will jump between the start
     * and end of block
     */
	AssignKeyToCmd(1883, "Block Up") /* Ctrl+Shift+[ */
	AssignKeyToCmd(1885, "Block Down") /* Ctrl+Shift+] */

    /**
     * Jump between the start or end of ( and ) pair
     */
	AssignKeyToCmd(1072, "Paren Right") /* Ctrl+0 */
	AssignKeyToCmd(1081, "Paren Left") /* Ctrl+9 */
	
    /**
     * Jump to previous or next blank line
     * a blank line is a line with only whitespace characters,
     * or without any characters at all
     * 
     * This can be treated as jumping between Paragraphs
    */
	AssignKeyToCmd(33832, "Blank Line Down") /* Ctrl+Down */
	AssignKeyToCmd(33830, "Blank Line Up") /* Ctrl+Up */

    /**
     * Jump to previous or next function
     */
	AssignKeyToCmd(3117, "Function Up") /* Ctrl+Alt+- */
	AssignKeyToCmd(3133, "Function Down") /* Ctrl+Alt+= */

    /**
     * Screen up or down(page up or down)
     */
	AssignKeyToCmd(2134, "eMoveToPrevScreen") /* Alt+V */
	AssignKeyToCmd(1110, "eMoveToNextScreen") /* Ctrl+V */

    /**
     * Move to the beginning or end of current buffer
     */
	AssignKeyToCmd(2876, "eMoveToBuffHead") /* Alt+Shift+< */
	AssignKeyToCmd(2878, "eMoveToBuffEnd") /* Alt+Shift+> */
	
}
/**
 * Selection area operation command installation
 */
macro _InstallSelection()
{

    /**
     * Mark is an invisible state inside this script, it
     * represents current selection state.
     *
     * when it is activated by eDoMark, any motion command
     * will create a selection area from the position where
     * eDoMark is activated, to current cursor position.
     *
     * After mark is activated, another eDoMark will deactivate
     * the mark state, and cancel the selection area if there
     * is any.
     */
	AssignKeyToCmd(1101, "eDoMark") /* Ctrl+M */

    /**
     * Select current symbol or function where cursor locates,
     * 
     * A symbol or function is the definition you can find in 
     * symbols list, which can be activated by Alt-L
     *
     * If any comment is above this definition, it will be
     * selected along with symbol or function.
     */
	AssignKeyToCmd(2093, "Select Function or Symbol") /* Alt+- */

    /**
     * if current cursor is just before the left of
     * pairs of:
     * - ()
     * - {}
     * - []
     * - ""
     * this pair will be selected
     */
	AssignKeyToCmd(2109, "Select Match") /* Alt+= */

    /**
     * Select current line
     */
	AssignKeyToCmd(2892, "Select Line") /* Alt+Shift+L */
	
    /**
     * Select current word where cursor locates
     */
	AssignKeyToCmd(2903, "Select Word") /* Alt+Shift+W */

    /**
     * A block is defined some tricky by SI,
     * It can be a pair of (), a line, or a function...
     * By Select Block, it will first select the smallest
     * block and if you Select Block again, it will
     * select a larger block, until thre is none.
     */
	AssignKeyToCmd(1069, "Select Block") /* Ctrl+- */
	
    /**
     * Select a paragraph which is seperated by blank lines
     * or lines only containing whitespaces
     */
	AssignKeyToCmd(1085, "Select Paragraph") /* Ctrl+= */
	
    /**
     * Cancel current selection and jump to the beginning 
     * or end of selection
     */
	AssignKeyToCmd(3163, "Beginning Of Selection") /* Ctrl+Alt+[ */
	AssignKeyToCmd(3165, "End Of Selection") /* Ctrl+Alt+] */

}
/**
 * Navigation of visited list, symbol definitions
 */
macro _InstallNavi()
{

    /**
     * Jump between current position and previous position
     * in visited list, just like execute eGoBack and eGoFwd 
     * one by each
     */
	AssignKeyToCmd(2125, "Go Back Toggle") /* Alt+M */
	

    /**
     * Jump backward or forward in visited position list
     */
	AssignKeyToCmd(2092, "eGoBack") /* Alt+, */
	AssignKeyToCmd(2095, "eGoFwd") /* Alt+/ */

    /**
     * Jump to specified line you input in a dialog
     */
	AssignKeyToCmd(1095, "Go To Line") /* Ctrl+G */

    /**
     * Jump to definition of the symbol under cursor
     */
	AssignKeyToCmd(2094, "eJumpToDefinition") /* Alt+. */

}
/**
 * Editing history command installation 
 */
macro _InstallHistory()
{
	/**
     * eUndo will undo once change, and redo will recover 
     * that undo.
     *
     * undo all will undo all changes ever made since the file
     * is opened.
     */
	AssignKeyToCmd(2162, "Redo") /* Alt+R */
	AssignKeyToCmd(1114, "eUndo") /* Ctrl+Z */
	AssignKeyToCmd(1071, "Undo All") /* Ctrl+/ */
	
}
/**
 * Search and replace command installation
 */
macro _InstallSrch()
{

    /**
     * Open search dialog
     */
	AssignKeyToCmd(1107, "Search") /* Ctrl+S */
    /**
     * Continue search backward or forward
     */
	AssignKeyToCmd(4210, "Search Backward") /* F3 */
	AssignKeyToCmd(4211, "Search Forward") /* F4 */
    
    /**
     * Incremental search command.
     * Once enter Incremental search mode by F11 or F12,
     * any input key will be searched backward/forward and
     * cursor will locate at matched area.
     * To leave Incremental search mode, just press ESC.
     * To restart previous Incremental search, hit twice of
     * F11 or F12 and continue searching.
     */
	AssignKeyToCmd(4218, "Incremental Search Backward") /* F11 */
	AssignKeyToCmd(4219, "Incremental Search") /* F12 */

    /**
     * Search backward or forward for selected characters or current
     * word under cursor if nothing is selected
     */
	AssignKeyToCmd(4978, "Search Backward for Selection") /* Shift+F3 */
	AssignKeyToCmd(4979, "Search Forward for Selection") /* Shift+F4 */
	
    /**
     * Search backward or forward for special tag defined by SL_TAG
     * This is useful when automation is used in:
     * - while statement
     * - if statement
     * - for statement
     * - switch statement
     * - comment
     */
	AssignKeyToCmd(2129, "eSearchPrevTag") /* Alt+Q */
	AssignKeyToCmd(1105, "eSearchNextTag") /* Ctrl+Q */
	
    /**
     * Open "Lookup References" dialog
     */
	AssignKeyToCmd(2131, "Lookup References") /* Alt+S */

    /**
     * Open search files dialog
     */
	AssignKeyToCmd(3155, "Search Files") /* Ctrl+Alt+S */

    /**
     * Jump backward or forward in the search result links
     * If current buffer is the search result, it will jump
     * to corresponding code.
     *
     * "Activate_Search_Results" will take you to search result
     * buffer, and it is defined by "M R" now.
     */
	AssignKeyToCmd(1068, "Go To Previous Link") /* Ctrl+, */
	AssignKeyToCmd(1070, "Go To Next Link") /* Ctrl+. */
	
    /**
     * Open Replace dialog
     */
	AssignKeyToCmd(1096, "Replace") /* Ctrl+H */
    /**
     * Open Replace Files dialog
     */
	AssignKeyToCmd(1864, "Replace Files") /* Ctrl+Shift+H */

}
macro _InstallClipboard()
{
    /**
     * Copy selection into clipboard.
     *
     * If there is no selection, the word under cursor will
     * be copied.
     */
	AssignKeyToCmd(2135, "eCopy") /* Alt+W */
	
    /**
     * Cut selection into clipboard.
     *
     * If there is no selection, the word under cursor will
     * be cut.
     */
	AssignKeyToCmd(1111, "eCut") /* Ctrl+W */
	
    /**
     * Paste from clipboard
     */
	AssignKeyToCmd(1113, "ePaste") /* Ctrl+Y */
	
}
macro _InstallAutomation()
{

    /**
     * When Enter key is pressed, and current context
     * is a C statement like for or while..., it will
     * automatically create the statement and put
     * a special character to the position you are expected
     * to fill. You can locate forward/backward by Ctrl+Q/
     * Alt+Q to those position.
     *
     * Otherwise it will be treated as a normal ENTER
     */
	AssignKeyToCmd(13, "eAutoEnter") /* Enter */
	
    /**
     * Run macro from current line. Used in debugging
     */
	AssignKeyToCmd(3154, "Run Macro") /* Ctrl+Alt+R */
	
    /**
     * Source insight smart rename function
     */
	AssignKeyToCmd(1063, "Smart Rename") /* Ctrl+' */
	
    /**
     * Source insight renumber function
     */
	AssignKeyToCmd(1106, "Renumber") /* Ctrl+R */
	
    /**
     * A dialog will require you to input a #ifdef condition
     * and current selection or current line will be 
     * surrounded by #ifdef <condition you input> and #endif
     */
	AssignKeyToCmd(3145, "InsertIfdef") /* Ctrl+Alt+I */
	
}
macro eInstall ()
{
    msg("Start installation")

    /***************************************************
     *            Install Leader Keys                  *
     ***************************************************/

	AssignKeyToCmd(2117, "eEditCmd") /* Alt+E */
	AssignKeyToCmd(2128, "ePrjCmd") /* Alt+P */
	AssignKeyToCmd(2136, "eWndCmd") /* Alt+X */
	AssignKeyToCmd(2126, "eNaviCmd") /* Alt+N */
	AssignKeyToCmd(1112, "eBufCmd") /* Ctrl+X */
	AssignKeyToCmd(2115, "eCmtCmd") /* Alt+C */

    /***************************************************
     *          Install Direct Keybindings             *
     ***************************************************/
    _InstallEdit()
    _InstallMotion()
    _InstallView()
    _InstallSrch()
    _InstallNavi()
    _InstallHistory()
    _InstallClipboard()
    _InstallSelection()
    _InstallAutomation()

    /***************************************************
     *              Install Misc Keys                  *
     ***************************************************/

	AssignKeyToCmd(2891, "eGetKey") /* Alt+Shift+K */

    msg("Installation done!")

}
macro eEditCmd ()
{
	var key
	key = _InputKey()


	/**
     * Key Binding: Ctrl+B 
     * Description: Break current line, move cursor to next line
     *              but keep column of cursor not change
     */
	if(key == 1090 || key == 1122) {
		eBreakToNextLine
		stop
	}

	/**
	/**
     * Key Binding: I 
     * Description: Insert new line before this line and put cursor there
     */
	if(key == 73 || key == 105) {
		Insert_Line
		stop
	}

    /* Key Binding: B 
     * Description: Insert NewLine after cursor and keep cursor not move
     */
	if(key == 66 || key == 98) {
		Insert_New_Line
		stop
	}

	/**
     * Key Binding: C 
     * Description: Copy whole line into clipboard
     */
	if(key == 67 || key == 99) {
		eCopyLine
		stop
	}

	/**
     * Key Binding: Ctrl+C 
     * Description: Copy right part of cursor of line into clipboard
     */
	if(key == 1091 || key == 1123) {
		Copy_Line_Right
		stop
	}

	/**
     * Key Binding: D 
     * Description: Delete whole line and NOT copy into clipboard
     */
	if(key == 68 || key == 100) {
		Delete_Line
		stop
	}

	/**
     * Key Binding: S 
     * Description: Open symbol complete list
     */
	if(key == 83 || key == 115) {
		Complete_Symbol
		stop
	}

	/**
     * Key Binding: T 
     * Description: Toggle case current selection or current word
     */
	if(key == 84 || key == 116) {
		eToggleCase
		stop
	}

	/**
     * Key Binding: U 
     * Description: Upper case current selection or current word
     */
	if(key == 85 || key == 117) {
		eUppercase
		stop
	}

	/**
     * Key Binding: L 
     * Description: Lower case current selection or current word
     */
	if(key == 76 || key == 108) {
		eLowercase
		stop
	}

	/**
     * Key Binding: E 
     * Description: Move cursor to column 80
     */
	if(key == 69 || key == 101) {
		eBreakEighty
		stop
	}

}
macro eBufCmd ()
{
	var key
	key = _InputKey()

	/**
     * Key Binding: Ctrl+C 
     * Description: Exit application
     */
	if(key == 1091 || key == 1123) {
		Exit
		stop
	}

	/**
     * Key Binding: Alt+S 
     * Description: Save As...
     */
	if(key == 2131 || key == 2163) {
		Save_As
		stop
	}

	/**
     * Key Binding: Ctrl+A 
     * Description: Save All buffers
     */
	if(key == 1089 || key == 1121) {
		Save_All
		stop
	}

	/**
     * Key Binding: Ctrl+K 
     * Description: Close all buffers
     */
	if(key == 1099 || key == 1131) {
		Close_All
		stop
	}

	/**
     * Key Binding: Ctrl+S 
     * Description: Save current buffer
     */
	if(key == 1107 || key == 1139) {
		Save
		stop
	}

	/**
     * Key Binding: K 
     * Description: Close current buffer
     */
	if(key == 75 || key == 107) {
		Close
		stop
	}

	/**
     * Key Binding: Ctrl+N 
     * Description: Create new file buffer
     */
	if(key == 1102 || key == 1134) {
		New
		stop
	}

	/**
     * Key Binding: R 
     * Description: Reload current buffer
     */
	if(key == 82 || key == 114) {
		Reload_File
		stop
	}

	/**
     * Key Binding: S 
     * Description: Show file status(lines, bytes) in status line
     */
	if(key == 83 || key == 115) {
		Show_File_Status
		stop
	}

	/**
     * Key Binding: A 
     * Description: Select all content of current buffer
     */
	if(key == 65 || key == 97) {
		Select_All
		stop
	}

	/**
     * Key Binding: B 
     * Description: Switch to previous window buffer
     */
	if(key == 66 || key == 98) {
		Select_Previous_Window
		stop
	}

	/**
     * Key Binding: N 
     * Description: Switch to next window buffer
     */
	if(key == 78 || key == 110) {
		Select_Next_Window
		stop
	}

}
macro eCmtCmd ()
{
	var key
	key = _InputKey()

	/**
     * Key Binding: / 
     * Description: Toggle comment for current line or 
                    selected block with //
     */
	if(key == 47) {
		eCommentBlock
		stop
	}

	/**
     * Key Binding: A 
     * Description: Comment all functions in current buffer
     */
	if(key == 65 || key == 97) {
		eCommentAllFunc
		stop
	}

	/**
     * Key Binding: F 
     * Description: Comment current function
     */
	if(key == 70 || key == 102) {
		eCommentFunc
		stop
	}

	/**
     * Key Binding: H 
     * Description: Add standard file header
     */
	if(key == 72 || key == 104) {
		eAddFileHdr
		stop
	}

	/**
     * Key Binding: O 
     * Description: Comment all open buffer functions
     */
	if(key == 79 || key == 111) {
		eCommentAllOpenBuf
		stop
	}

}
macro eWndCmd ()
{
	var key
	key = _InputKey()

	/**
     * Key Binding: E 
     * Description: Activate Edit menu
     */
	if(key == 69 || key == 101) {
		Activate_Edit_Menu
		stop
	}

	/**
     * Key Binding: F 
     * Description: Activate File Meanu
     */
	if(key == 70 || key == 102) {
		Activate_File_Menu
		stop
	}

	/**
     * Key Binding: H 
     * Description: Activate Help Menu
     */
	if(key == 72 || key == 104) {
		Activate_Help_Menu
		stop
	}

	/**
     * Key Binding: K 
     * Description: Activate Work Menu
     */
	if(key == 75 || key == 107) {
		Activate_Work_Menu
		stop
	}

	/**
     * Key Binding: O 
     * Description: Activate Options Menu
     */
	if(key == 79 || key == 111) {
		Activate_Options_Menu
		stop
	}

	/**
     * Key Binding: P 
     * Description: Activate Project Menu
     */
	if(key == 80 || key == 112) {
		Activate_Project_Menu
		stop
	}

	/**
     * Key Binding: S 
     * Description: Activate Search Menu
     */
	if(key == 83 || key == 115) {
		Activate_Search_Menu
		stop
	}

	/**
     * Key Binding: V 
     * Description: Activate View Menu
     */
	if(key == 86 || key == 118) {
		Activate_View_Menu
		stop
	}

	/**
     * Key Binding: W 
     * Description: Activate Window Menu
     */
	if(key == 87 || key == 119) {
		Activate_Window_Menu
		stop
	}

	/**
     * Key Binding: L 
     * Description: Activate Symbol Window
     */
	if(key == 76 || key == 108) {
		Activate_Symbol_Window
		stop
	}

	/**
     * Key Binding: R 
     * Description: Activate Search Result
     */
	if(key == 82 || key == 114) {
		Activate_Search_Results
		stop
	}

	/**
     * Key Binding: D 
     * Description: Activate Display Options
     */
	if(key == 68 || key == 100) {
		Display_Options
		stop
	}

	/**
     * Key Binding: T 
     * Description: Activate Document Options
     */
	if(key == 84 || key == 116) {
		Document_Options
		stop
	}

}
macro ePrjCmd ()
{
	var key
	key = _InputKey()

	/**
     * Key Binding: C 
     * Description: Close current project
     */
	if(key == 67 || key == 99) {
		Close_Project
		stop
	}

	/**
     * Key Binding: D 
     * Description: Open 'Remove Project' dialog
     */
	if(key == 68 || key == 100) {
		Remove_Project
		stop
	}

	/**
     * Key Binding: N 
     * Description: Create new project
     */
	if(key == 78 || key == 110) {
		New_Project
		stop
	}

	/**
     * Key Binding: O 
     * Description: Open 'Open Project' dialog
     */
	if(key == 79 || key == 111) {
		Open_Project
		stop
	}

	/**
     * Key Binding: R 
     * Description: Open 'Remove Files' dialog
     */
	if(key == 82 || key == 114) {
		Remove_File
		stop
	}

	/**
     * Key Binding: S 
     * Description: Synchronize project
     */
	if(key == 83 || key == 115) {
		Synchronize_Files
		stop
	}

}
macro eNaviCmd ()
{
	var key
	key = _InputKey()

	/**
     * Key Binding: L 
     * Description: Jump between current link and search result
     */
	if(key == 76 || key == 108) {
		Jump_To_Link
		stop
	}

	/**
     * Key Binding: M 
     * Description: Jump to matching (), [], {}, ""
     */
	if(key == 77 || key == 109) {
		Jump_To_Match
		stop
	}

	/**
     * Key Binding: B 
     * Description: Jump to base type
     */
	if(key == 66 || key == 98) {
		Jump_To_Base_Type
		stop
	}

	/**
     * Key Binding: C 
     * Description: Jump to caller or open callers dialog
     */
	if(key == 67 || key == 99) {
		Jump_To_Caller
		stop
	}

	/**
     * Key Binding: D 
     * Description: Jump to definition
     */
	if(key == 68 || key == 100) {
		Jump_To_Definition
		stop
	}

	/**
     * Key Binding: P 
     * Description: Jump to prototype
     */
	if(key == 80 || key == 112) {
		Jump_To_Prototype
		stop
	}

}
