
/* Insert a common block, for, i.e., while clause
   return line number inserted
*/
macro _InsertBufBlock(context, tail)
{
    var sel
    sel = context.sel
    prefix = context.szPrefix
    InsBufLine(context.hbuf, sel.lnFirst+1, "@prefix@{")
    InsBufLine(context.hbuf, sel.lnFirst+2, "@prefix@    @SL_TAG@")
    InsBufLine(context.hbuf, sel.lnFirst+3, "@prefix@}@tail@")

    return 3
}
macro eDragLineDown()
{
}



macro eDragLineUp()
{
	
}
macro eInsertLine()
{
	
}
macro eInsertLineBeforeNext()
{
	
}
macro eJoinLines()
{
	
}
macro eCutLine()
{
	
}
macro eIndentLeft()
{
	
}
macro eIndentRight()
{
	
}
macro eRedo()
{
	`
}
macro eUndoAll()
{
	`
}

macro eBreak()
{
	`
}

macro eCopyLineRight()
{
	`
}

macro eDeleteLine()
{
	`
}



macro eRemoveNextChar()
{
	_SetMarkOff()
	Delete_Character
}
macro eRemovePrevChar()
{
	_SetMarkOff()
	Backspace
}
macro eKillNextWord()
{
	_SetMarkOff()
	Select_Word_Right
	if (_IsSelectionMultiChars())
	{
		Cut
	}
	
}
macro eKillPrevWord()
{
	_SetMarkOff()
	Select_Word_Left
	if (_IsSelectionMultiChars())
	{
		Cut
	}
}
macro eKillToLineEnd()
{
	_SetMarkOff()
	Select_To_End_Of_Line
	if (_IsSelectionMultiChars())
	{
		Cut
	}
	else
	{
		eRemoveNextChar()
	}
	
}
macro eKillToLineHead()
{
	_SetMarkOff()
	Select_To_Start_Of_Line

	if (_IsSelectionMultiChars())
	{
		Cut
	}
	else
	{
		eMoveToPrevLine
        Join_Lines
	}
}
macro eCopyLine()
{
	Copy_Line
	_SetMarkOff()
}
macro eUndo()
{
	//MSG "UNDO"
	Undo
	Undo
    _SetMarkOff()
}
macro eCut()
{
	if(!_IsSelectionMultiChars())
	{
		select_word
	}
	Cut
    _SetMarkOff()
}
macro eLowerCase()
{
	if(!_IsSelectionMultiChars())
	{
		select_word
	}
	Lowercase
    _SetMarkOff()

}
macro eUpperCase()
{
	if(!_IsSelectionMultiChars())
	{
		select_word
	}
	Uppercase
    _SetMarkOff()

}
macro eToggleCase()
{
	if(!_IsSelectionMultiChars())
	{
		select_word
	}
	Toggle_Case
    _SetMarkOff()

}
macro eCopy()
{
	if(!_IsSelectionMultiChars())
	{
		select_word
	}
	Copy
    _SetMarkOff()
}
macro ePaste()
{
	Paste
    _SetMarkOff()
}

macro eBreakToNextLine()
{
	Insert_New_Line
    eMoveToNextLine	
}
macro eBreakEighty()
{
	hwnd = GetCurrentWnd()
	sel  = GetWndSel(hwnd)
	sel.ichFirst = 80
	sel.ichLim = 80
	sel.lnFirst = sel.lnLast

	SetWndSel(hwnd, sel)
}

/*  Function 1: Create clause
        if a line
            looks like [a few spaces/tabs][keyword][a few spaces/tabs]
            the [keyword] is the beginning of:
                do, while, switch, case, for, if, else, else if, 
                union, enum, struct, #include
            the length of [keyword] is at least 2 chars, 
            for "else if", the lenght should be 7
        then
            Auto complete the clause, like:
            for (@SL_TAG@, @SL_TAG@, @SL_TAG@)
            {
                @SL_TAG@
            }
        And the first @SL_TAG@ will be selected
        
    Function 2: Complete comments
        if you write /* and then call this, the comment will be automatically 
        appended to: /* [cursor position] * /

    Function 3: Jump between @SL_TAG@s

    Function 4: Jump out of {} () [] ""

    Note: Designed for c/h files
        
*/
macro eAutoTab()
{
    var cmd

    var context
    var res
    var sel
    var szLine
    var len
    var index
    var szFile
    
    context = _GetContext()

    if(!_IsCFile(context.hbuf, False))
    {
        Tab
        stop
    }
    
    sel     = context.sel
    szLine  = context.szLine

    if(sel.ichFirst != sel.ichLim) 
    {
        if(sel.lnFirst == sel.lnLast)
        {
        
            if(_TryJump()) stop
        }
        Tab
        stop
    }
    
    
    len = strlen(szLine)
    index = sel.ichFirst+1
    while(index < len)
    {
        ch = szLine[index]
        if(ch != " " && ch != "	")
        {
            if(!_TryJump()) Tab
            
            stop
        }
        else
            index=index+1
    }
    

    /* Only for .c/.h file */
    if(_IsCFile(context.hbuf, False))
    {
        if(_TryClause(context)) stop
        if(_TryJump()) stop
    }
    
    
    Tab
}

/* Automatically Finish clauses by enter
*/
macro eAutoEnter()
{
    var context
    var sel 
    var szPrefix
    var str
    
    context = _GetContext()

    if(!_IsCFile(context.hbuf, False))
    {
        Enter
        stop
    }
    
    sel = context.sel
    szPrefix = context.szPrefix

    str = _GetNextNonEmptyLine(context)
	
    if(_StartWith(context.szTrimLine, "/**"))
    {
        if(_EndWith(context.szTrimLine, "*/"))
        {
            Enter
            return
        }

	    var pos
	    len = strlen(context.szLine)
	    var ourLine
	    ourLine = context.szLine
	    pos = 0 
	    while(pos < len)
	    {
	    	if(ourLine[pos] == "/")
    	   {
    	   	  break
    	   } 
    	   	 pos = pos + 1
	    }

		
	    var prefix
	    var prefix1
	    prefix = strmid(context.szLine, 0, pos)
	    prefix1 = cat(prefix, " * ");
	    
	    var sel
	    sel = context.sel
    	InsBufLine(context.hbuf, sel.lnFirst+1, prefix1)

    	prefix1 = cat(prefix, " */")
    	InsBufLine(context.hbuf, sel.lnFirst+2, prefix1)
    	sel.lnFirst = sel.lnFirst+1
    	sel.lnLast = sel.lnFirst
    	sel.ichLim = pos + 3
    	sel.ichFirst = sel.ichLim 

    	SetWndSel(context.hWnd, sel) 
    }
    else if(_StartWith(context.szTrimLine, "*"))
    {
        if(_EndWith(context.szTrimLine, "*/"))
        {
            Enter
            return
        }

	    var pos
	    len = strlen(context.szLine)
	    var ourLine
	    ourLine = context.szLine
	    pos = 0 
	    while(pos < len)
	    {
	    	ch = ourLine[pos]
	    	if(ch != CharFromAscii(9) && 
	    	   ch != " " &&
	    	   ch != "*")
    	   {
    	   	  break
    	   } 
    	   	 pos = pos + 1
	    }
	    var prefix
	    prefix = strmid(context.szLine, 0, pos)

	    var sel
	    sel = context.sel
		if(sel.ichLim < len)
		{
		    eKillToLineEnd()
	    	InsBufLine(context.hbuf, sel.lnFirst+1, prefix)
	    	sel.lnFirst = sel.lnFirst+1
	    	sel.lnLast = sel.lnFirst
	    	sel.ichLim = pos 
	    	sel.ichFirst = sel.ichLim 

	    	SetWndSel(context.hWnd, sel) 
	    	ePaste()
	    	eMoveToLineHead()
	    	SetWndSel(context.hWnd, sel) 
		}
		else
		{
	    	InsBufLine(context.hbuf, sel.lnFirst+1, prefix)
	    	sel.lnFirst = sel.lnFirst+1
	    	sel.lnLast = sel.lnFirst
	    	sel.ichLim = pos 
	    	sel.ichFirst = sel.ichLim 

	    	SetWndSel(context.hWnd, sel) 
		}
    }
    else if(context.fInRealEnd && !_StartWith(str, "{"))
    {
        if(_EndWith(context.szRealLine, ")"))
        {
            if( _StartWith(context.szRealLine, "while(") ||
                _StartWith(context.szRealLine, "if(") ||
                _StartWith(context.szRealLine, "else if(") ||
                _StartWith(context.szRealLine, "for(") )
            {
                _InsertBufBlock(context, "")
                _TryJump()
            }
            else if(_StartWith(context.szRealLine, "switch("))
            {
                InsBufLine(context.hbuf, sel.lnFirst+1, "@szPrefix@{")
                InsBufLine(context.hbuf, sel.lnFirst+2, "@szPrefix@case @SL_TAG@:")
                InsBufLine(context.hbuf, sel.lnFirst+3, "@szPrefix@    @SL_TAG@")
                InsBufLine(context.hbuf, sel.lnFirst+4, "@szPrefix@    break;")
                InsBufLine(context.hbuf, sel.lnFirst+5, "@szPrefix@default:")
                InsBufLine(context.hbuf, sel.lnFirst+6, "@szPrefix@    break;")
                InsBufLine(context.hbuf, sel.lnFirst+7, "@szPrefix@}")
            
                _TryJump()
            }
            else
            {
                Enter
            }
        }
        else if(_EndWith(context.szRealLine, ":") && _StartWith(context.szRealLine, "case "))
        {
            InsBufLine(context.hbuf, sel.lnFirst+1, "@szPrefix@    @SL_TAG@")
            InsBufLine(context.hbuf, sel.lnFirst+2, "@szPrefix@    break;")
            _TryJump()
        }
        else if(context.szRealLine == "do")
        {
            _InsertBufBlock(context, " while (@SL_TAG@)")
            _TryJump()
        }
        else if(context.szRealLine == "else")
        {
            _InsertBufBlock(context, "")
            _TryJump()
        }
        else
        {
            Enter
        }
    }
    else
    {
        Enter
    }
}

