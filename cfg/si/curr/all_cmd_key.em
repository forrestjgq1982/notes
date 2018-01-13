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
     * Open "Key assignments" dialog
     */
	AssignKeyToCmd(3147, "Key Assignments") /* Ctrl+Alt+K */

    /**
     * Open "Browse Project Symbols" dialog
     */
	AssignKeyToCmd(2119, "Browse Project Symbols") /* Alt+G */

    /**
     * Open "Lookup References" dialog
     */
	AssignKeyToCmd(2131, "Lookup References") /* Alt+S */

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
     * Jump between the start or end of ( and  ) pair
     */
	AssignKeyToCmd(1072, "Paren Right") /* Ctrl+0 */
	AssignKeyToCmd(1081, "Paren Left") /* Ctrl+9 */
	
    /**
     * Jump to previous or next blank line
     * a blank line is a line with only whitespace characters,
     * or without any characters at all
     * 
     * This can be treated as jumping a Paragraph
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
macro _InstallSelection()
{

	AssignKeyToCmd(1101, "eDoMark") /* Ctrl+M */
	

	AssignKeyToCmd(2093, "Select Function or Symbol") /* Alt+- */
	

	AssignKeyToCmd(2109, "Select Match") /* Alt+= */
	

	AssignKeyToCmd(2892, "Select Line") /* Alt+Shift+L */
	

	AssignKeyToCmd(2903, "Select Word") /* Alt+Shift+W */
	

	AssignKeyToCmd(1069, "Select Block") /* Ctrl+- */
	

	AssignKeyToCmd(1085, "Select Paragraph") /* Ctrl+= */
	

	AssignKeyToCmd(3163, "Beginning Of Selection") /* Ctrl+Alt+[ */
	

	AssignKeyToCmd(3165, "End Of Selection") /* Ctrl+Alt+] */
	

}
macro _InstallNavi()
{

	AssignKeyToCmd(2125, "Go Back Toggle") /* Alt+M */
	

	AssignKeyToCmd(1095, "Go To Line") /* Ctrl+G */
	

	AssignKeyToCmd(2092, "eGoBack") /* Alt+, */
	

	AssignKeyToCmd(2094, "eJumpToDefinition") /* Alt+. */
	

	AssignKeyToCmd(2095, "eGoFwd") /* Alt+/ */
	

}
macro _InstallHistory()
{
	
	AssignKeyToCmd(2162, "Redo") /* Alt+R */
	

	AssignKeyToCmd(1114, "Undo") /* Ctrl+Z */
	


	AssignKeyToCmd(1071, "eUndo") /* Ctrl+/ */
	
}
macro _InstallSrch()
{

	AssignKeyToCmd(1862, "Search Files") /* Ctrl+Shift+F */
	

	AssignKeyToCmd(1864, "Replace Files") /* Ctrl+Shift+H */
	

	AssignKeyToCmd(4218, "Incremental Search Backward") /* F11 */
	

	AssignKeyToCmd(4219, "Incremental Search") /* F12 */
	

	AssignKeyToCmd(4210, "Search Backward") /* F3 */
	

	AssignKeyToCmd(4211, "Search Forward") /* F4 */
	

	AssignKeyToCmd(4978, "Search Backward for Selection") /* Shift+F3 */
	

	AssignKeyToCmd(4979, "Search Forward for Selection") /* Shift+F4 */
	

	AssignKeyToCmd(1107, "Search") /* Ctrl+S */
	

	AssignKeyToCmd(1096, "Replace") /* Ctrl+H */
	

	AssignKeyToCmd(2129, "eSearchPrevTag") /* Alt+Q */
	

	AssignKeyToCmd(1105, "eSearchNextTag") /* Ctrl+Q */
	

	AssignKeyToCmd(1068, "Go To Previous Link") /* Ctrl+, */
	

	AssignKeyToCmd(1070, "Go To Next Link") /* Ctrl+. */
	

}
macro _InstallBuf()
{

	AssignKeyToCmd(1103, "Open") /* Ctrl+O */
	

}
macro _InstallClipboard()
{

	AssignKeyToCmd(2135, "eCopy") /* Alt+W */
	


	AssignKeyToCmd(1111, "eCut") /* Ctrl+W */
	

	AssignKeyToCmd(1113, "ePaste") /* Ctrl+Y */
	
}
macro _InstallAutomation()
{

	AssignKeyToCmd(13, "eAutoEnter") /* Enter */
	

	AssignKeyToCmd(3154, "Run Macro") /* Ctrl+Alt+R */
	

	AssignKeyToCmd(1063, "Smart Rename") /* Ctrl+' */
	

	AssignKeyToCmd(1106, "Renumber") /* Ctrl+R */
	

	AssignKeyToCmd(3145, "InsertIfdef") /* Ctrl+Alt+I */
	
}
macro eInstall ()
{
    msg("start")

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
    _InstallBuf()
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
	

}
macro eEditCmd ()
{
	var key
	key = _InputKey()

	/* Cut_Line_Left E+Alt+W */
	if(key == 2135 || key == 2167) {
		Cut_Line_Left
		stop
	}

	/* Insert_New_Line E+B */
	if(key == 66 || key == 98) {
		Insert_New_Line
		stop
	}

	/* eCopyLine E+C */
	if(key == 67 || key == 99) {
		eCopyLine
		stop
	}

	/* Copy_Line_Right E+Ctrl+C */
	if(key == 1091 || key == 1123) {
		Copy_Line_Right
		stop
	}

	/* Cut_Line_Right E+Ctrl+W */
	if(key == 1111 || key == 1143) {
		Cut_Line_Right
		stop
	}

	/* Delete_Line E+D */
	if(key == 68 || key == 100) {
		Delete_Line
		stop
	}

	/* Insert_Line E+I */
	if(key == 73 || key == 105) {
		Insert_Line
		stop
	}

	/* Lowercase E+L */
	if(key == 76 || key == 108) {
		Lowercase
		stop
	}

	/* Complete_Symbol E+S */
	if(key == 83 || key == 115) {
		Complete_Symbol
		stop
	}

	/* Toggle_Case E+T */
	if(key == 84 || key == 116) {
		Toggle_Case
		stop
	}

	/* Uppercase E+U */
	if(key == 85 || key == 117) {
		Uppercase
		stop
	}

	/* Cut_Line E+W */
	if(key == 87 || key == 119) {
		Cut_Line
		stop
	}

	/* eBreakToNextLine E+Ctrl+B */
	if(key == 1090 || key == 1122) {
		eBreakToNextLine
		stop
	}

	/* eBreakEighty E+E */
	if(key == 69 || key == 101) {
		eBreakEighty
		stop
	}

}
macro eBufCmd ()
{
	var key
	key = _InputKey()

	/* Exit X+Ctrl+C */
	if(key == 1091 || key == 1123) {
		Exit
		stop
	}

	/* Save_As X+Alt+S */
	if(key == 2131 || key == 2163) {
		Save_As
		stop
	}

	/* Save_All X+Ctrl+A */
	if(key == 1089 || key == 1121) {
		Save_All
		stop
	}

	/* Close_All X+Ctrl+K */
	if(key == 1099 || key == 1131) {
		Close_All
		stop
	}

	/* Save X+Ctrl+S */
	if(key == 1107 || key == 1139) {
		Save
		stop
	}

	/* Close X+K */
	if(key == 75 || key == 107) {
		Close
		stop
	}

	/* New X+Ctrl+N */
	if(key == 1102 || key == 1134) {
		New
		stop
	}

	/* Reload_File X+R */
	if(key == 82 || key == 114) {
		Reload_File
		stop
	}

	/* Show_File_Status X+S */
	if(key == 83 || key == 115) {
		Show_File_Status
		stop
	}

	/* Select_All X+A */
	if(key == 65 || key == 97) {
		Select_All
		stop
	}

	/* Select_Previous_Window X+B */
	if(key == 66 || key == 98) {
		Select_Previous_Window
		stop
	}

	/* Select_Next_Window X+N */
	if(key == 78 || key == 110) {
		Select_Next_Window
		stop
	}

}
macro eCmtCmd ()
{
	var key
	key = _InputKey()

	/* eCommentBlock C+/ */
	if(key == 47) {
		eCommentBlock
		stop
	}

	/* eCommentAllFunc C+A */
	if(key == 65 || key == 97) {
		eCommentAllFunc
		stop
	}

	/* eCommentFunc C+F */
	if(key == 70 || key == 102) {
		eCommentFunc
		stop
	}

	/* eAddFileHdr C+H */
	if(key == 72 || key == 104) {
		eAddFileHdr
		stop
	}

	/* eCommentAllOpenBuf C+O */
	if(key == 79 || key == 111) {
		eCommentAllOpenBuf
		stop
	}

}
macro eWndCmd ()
{
	var key
	key = _InputKey()

	/* Activate_Edit_Menu M+E */
	if(key == 69 || key == 101) {
		Activate_Edit_Menu
		stop
	}

	/* Activate_File_Menu M+F */
	if(key == 70 || key == 102) {
		Activate_File_Menu
		stop
	}

	/* Activate_Help_Menu M+H */
	if(key == 72 || key == 104) {
		Activate_Help_Menu
		stop
	}

	/* Activate_Work_Menu M+K */
	if(key == 75 || key == 107) {
		Activate_Work_Menu
		stop
	}

	/* Activate_Options_Menu M+O */
	if(key == 79 || key == 111) {
		Activate_Options_Menu
		stop
	}

	/* Activate_Project_Menu M+P */
	if(key == 80 || key == 112) {
		Activate_Project_Menu
		stop
	}

	/* Activate_Search_Menu M+S */
	if(key == 83 || key == 115) {
		Activate_Search_Menu
		stop
	}

	/* Activate_View_Menu M+V */
	if(key == 86 || key == 118) {
		Activate_View_Menu
		stop
	}

	/* Activate_Window_Menu M+W */
	if(key == 87 || key == 119) {
		Activate_Window_Menu
		stop
	}

	/* Activate_Symbol_Window M+L */
	if(key == 76 || key == 108) {
		Activate_Symbol_Window
		stop
	}

	/* Activate_Search_Results M+R */
	if(key == 82 || key == 114) {
		Activate_Search_Results
		stop
	}

	/* Display_Options M+D */
	if(key == 68 || key == 100) {
		Display_Options
		stop
	}

	/* Document_Options M+T */
	if(key == 84 || key == 116) {
		Document_Options
		stop
	}

}
macro ePrjCmd ()
{
	var key
	key = _InputKey()

	/* Close_Project P+C */
	if(key == 67 || key == 99) {
		Close_Project
		stop
	}

	/* Remove_Project P+D */
	if(key == 68 || key == 100) {
		Remove_Project
		stop
	}

	/* New_Project P+N */
	if(key == 78 || key == 110) {
		New_Project
		stop
	}

	/* Open_Project P+O */
	if(key == 79 || key == 111) {
		Open_Project
		stop
	}

	/* Remove_File P+R */
	if(key == 82 || key == 114) {
		Remove_File
		stop
	}

	/* Synchronize_Files P+S */
	if(key == 83 || key == 115) {
		Synchronize_Files
		stop
	}

}
macro eNaviCmd ()
{
	var key
	key = _InputKey()

	/* Jump_To_Link N+L */
	if(key == 76 || key == 108) {
		Jump_To_Link
		stop
	}

	/* Jump_To_Match N+M */
	if(key == 77 || key == 109) {
		Jump_To_Match
		stop
	}

	/* Jump_To_Base_Type N+B */
	if(key == 66 || key == 98) {
		Jump_To_Base_Type
		stop
	}

	/* Jump_To_Caller N+C */
	if(key == 67 || key == 99) {
		Jump_To_Caller
		stop
	}

	/* Jump_To_Definition N+D */
	if(key == 68 || key == 100) {
		Jump_To_Definition
		stop
	}

	/* Jump_To_Prototype N+P */
	if(key == 80 || key == 112) {
		Jump_To_Prototype
		stop
	}

}
