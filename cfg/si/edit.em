/**
 * Match Clause keywords and extends its block
 * return True:Succeed/False:Fail
 */
macro __TryClause(context)
{
    var str
    var tail
    var res
    var sel
    var szPrefix
    var szWord
    var csel

    res         = False
    tail        = ""
    sel         = context.sel
    szPrefix    = context.szPrefix
    szWord      = context.szTrimLine
    
    
    if(strlen(szWord) < 2)
    {
        return False
    }

    csel = context.sel
    if(szWord == "else if")
    {
        res = True
        str = "@szPrefix@else if (@SL_TAG@)"
    }
    else if(__StartWith(szWord, "while"))
    {
        res = True
        str = "@szPrefix@while (@SL_TAG@)"
    }
    else if(__StartWith(szWord, "do"))
    {
        res = True
        str = "@szPrefix@do"
        tail = " while (@SL_TAG@)"
    }
    else if(__StartWith(szWord, "if"))
    {
        res = True
        str = "@szPrefix@if (@SL_TAG@)"
    }
    else if(__StartWith(szWord, "else"))
    {
        res = True
        str = "@szPrefix@else"
    }

    else if(__StartWith(szWord, "switch"))
    {
        res = True
        str = "@szPrefix@switch (@SL_TAG@)"
        PutBufLine(context.hbuf, sel.lnFirst, str)
        
        InsBufLine(context.hbuf, sel.lnFirst+1, "@szPrefix@{")
        InsBufLine(context.hbuf, sel.lnFirst+2, "@szPrefix@case @SL_TAG@:")
        InsBufLine(context.hbuf, sel.lnFirst+3, "@szPrefix@    @SL_TAG@")
        InsBufLine(context.hbuf, sel.lnFirst+4, "@szPrefix@    break;")
        InsBufLine(context.hbuf, sel.lnFirst+5, "@szPrefix@default:")
        InsBufLine(context.hbuf, sel.lnFirst+6, "@szPrefix@    break;")
        InsBufLine(context.hbuf, sel.lnFirst+7, "@szPrefix@}")
    
        e_SearchNextTag()
        return True
    }
    else  if(__StartWith(szWord, "case"))
    {
        str = "@szPrefix@case @SL_TAG@:"
        PutBufLine(context.hbuf, sel.lnFirst, str)
        str = "@szPrefix@    @SL_TAG@"
        InsBufLine(context.hbuf, sel.lnFirst+1, str)
        str = "@szPrefix@    break;"
        InsBufLine(context.hbuf, sel.lnFirst+2, str)
        e_SearchNextTag()
        return True
    }
    else if(__StartWith(szWord, "for"))
    {
        res = True
        str = "@szPrefix@for (@SL_TAG@, @SL_TAG@, @SL_TAG@)"
    }
    else if(__StartWithReverse(szWord, "/*"))
    {
        PutBufLine(context.hbuf, sel.lnFirst, "@szPrefix@@szWord@  */")
        sel.ichFirst = sel.ichFirst+1
        sel.ichLim = sel.ichFirst
        __ScrollDownTo(context.hwnd, sel)
        return True
    }
    else if(__StartWith(szWord, "#include"))
    {
        PutBufLine(context.hbuf, sel.lnFirst, "@szPrefix@#include \"@SL_TAG@\"")
        e_SearchNextTag()
        return True
    }
    else if(__StartWith(szWord, "struct"))
    {
        res = True
        str = "@szPrefix@typedef struct"
        tail = " @SL_TAG@;"
        csel.lnFirst = csel.lnFirst+3
        csel.ichLim = 0
    }

    else if(__StartWith(szWord, "enum"))
    {
        res = True
        str = "@szPrefix@typedef enum"
        tail = " @SL_TAG@;"
        csel.lnFirst = csel.lnFirst+3
        csel.ichLim = 0
    }

    else if(__StartWith(szWord, "union"))
    {
        res = True
        str = "@szPrefix@typedef union"
        tail = " @SL_TAG@;"
        csel.lnFirst = csel.lnFirst+3
        csel.ichLim = 0
    }

    if(res)
    {
        PutBufLine(context.hbuf, sel.lnFirst, str)
        __InsertBufBlock(context, tail)
        cnt = GetBufLineCount(context.hbuf)
        //msg("cnt=@cnt@, csel=@csel@")
        //SearchInBuf(context.hbuf, SL_TAG, csel.lnFirst, csel.ichLim, 1, 0, 1)
        csel = SearchInBuf(context.hbuf, SL_TAG, csel.lnFirst, csel.ichLim, 1, 0, 1)
        __ScrollDownTo(context.hwnd, csel)
        return True
    }

    return False
}

/* Insert a common block, for, i.e., while clause
   return line number inserted
*/
macro __InsertBufBlock(context, tail)
{
    var sel
    sel = context.sel
    prefix = context.szPrefix
    InsBufLine(context.hbuf, sel.lnFirst+1, "@prefix@{")
    InsBufLine(context.hbuf, sel.lnFirst+2, "@prefix@    @SL_TAG@")
    InsBufLine(context.hbuf, sel.lnFirst+3, "@prefix@}@tail@")

    return 3
}
macro e_DragLineDown()
{
}



macro e_DragLineUp()
{
    
}
macro e_InsertLine()
{
    
}
macro e_InsertLineBeforeNext()
{
    
}
macro e_JoinLines()
{
    
}
macro e_CutLine()
{
    
}
macro e_IndentLeft()
{
    
}
macro e_IndentRight()
{
    
}
macro e_Redo()
{
    `
}
macro e_UndoAll()
{
    `
}

macro e_Break()
{
    `
}

macro e_CopyLineRight()
{
    `
}

macro e_DeleteLine()
{
    `
}



macro e_RemoveNextChar()
{
    _SetMarkOff()
    Delete_Character
}
macro e_RemovePrevChar()
{
    _SetMarkOff()
    Backspace
}
macro e_KillNextWord()
{
    _SetMarkOff()
    Select_Word_Right
    if (__IsSelectionMultiChars())
    {
        Cut
    }
    
}
macro e_KillPrevWord()
{
    _SetMarkOff()
    Select_Word_Left
    if (__IsSelectionMultiChars())
    {
        Cut
    }
}
macro e_KillToLineEnd()
{
    _SetMarkOff()
    Select_To_End_Of_Line
    if (__IsSelectionMultiChars())
    {
        Cut
    }
    else
    {
        eRemoveNextChar()
    }
    
}
macro e_KillToLineHead()
{
    _SetMarkOff()
    Select_To_Start_Of_Line

    if (__IsSelectionMultiChars())
    {
        Cut
    }
    else
    {
        eMoveToPrevLine
        Join_Lines
    }
}
macro e_CopyLine()
{
    Copy_Line
    _SetMarkOff()
}
macro e_Undo()
{
    //MSG "UNDO"
    Undo
    Undo
    __SetMarkOff()
}
macro e_Cut()
{
    if(!__IsSelectionMultiChars())
    {
        select_word
    }
    Cut
    __SetMarkOff()
}
macro e_LowerCase()
{
    if(!__IsSelectionMultiChars())
    {
        select_word
    }
    Lowercase
    __SetMarkOff()

}
macro e_UpperCase()
{
    if(!__IsSelectionMultiChars())
    {
        select_word
    }
    Uppercase
    __SetMarkOff()

}
macro e_ToggleCase()
{
    if(!__IsSelectionMultiChars())
    {
        select_word
    }
    Toggle_Case
    __SetMarkOff()

}
macro e_Copy()
{
    if(!__IsSelectionMultiChars())
    {
        select_word
    }
    Copy
    __SetMarkOff()
}
macro e_Paste()
{
    Paste
    __SetMarkOff()
}

macro e_BreakToNextLine()
{
    Insert_New_Line
    eMoveToNextLine 
}
macro e_BreakEighty()
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
macro e_AutoTab()
{
    var cmd

    var context
    var res
    var sel
    var szLine
    var len
    var index
    var szFile
    
    context = __GetContext()

    if(!__IsCFile(context.hbuf, False))
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
        
            if(e_SearchNextTag()) stop
        }
        Tab
        stop
    }
    
    
    len = strlen(szLine)
    index = sel.ichFirst+1
    while(index < len)
    {
        ch = szLine[index]
        if(ch != " " && ch != " ")
        {
            if(!e_SearchNextTag()) Tab
            
            stop
        }
        else
            index=index+1
    }
    

    /* Only for .c/.h file */
    if(__IsCFile(context.hbuf, False))
    {
        if(__TryClause(context)) stop
        if(e_SearchNextTag()) stop
    }
    
    
    Tab
}

/* Automatically Finish clauses by enter
*/
macro e_AutoEnter()
{
    var context
    var sel 
    var szPrefix
    var str
    
    context = __GetContext()

    if(!__IsCFile(context.hbuf, False))
    {
        Enter
        stop
    }
    
    sel = context.sel
    szPrefix = context.szPrefix

    str = __GetNextNonEmptyLine(context)
    
    if(__StartWith(context.szTrimLine, "/**"))
    {
        if(__EndWith(context.szTrimLine, "*/"))
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
    else if(__StartWith(context.szTrimLine, "*"))
    {
        if(__EndWith(context.szTrimLine, "*/"))
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
    else if(context.fInRealEnd && !__StartWith(str, "{"))
    {
        if(__EndWith(context.szRealLine, ")"))
        {
            if( __StartWith(context.szRealLine, "while(") ||
                __StartWith(context.szRealLine, "if(") ||
                __StartWith(context.szRealLine, "else if(") ||
                __StartWith(context.szRealLine, "for(") )
            {
                __InsertBufBlock(context, "")
                e_SearchNextTag()
            }
            else if(__StartWith(context.szRealLine, "switch("))
            {
                InsBufLine(context.hbuf, sel.lnFirst+1, "@szPrefix@{")
                InsBufLine(context.hbuf, sel.lnFirst+2, "@szPrefix@case @SL_TAG@:")
                InsBufLine(context.hbuf, sel.lnFirst+3, "@szPrefix@    @SL_TAG@")
                InsBufLine(context.hbuf, sel.lnFirst+4, "@szPrefix@    break;")
                InsBufLine(context.hbuf, sel.lnFirst+5, "@szPrefix@default:")
                InsBufLine(context.hbuf, sel.lnFirst+6, "@szPrefix@    break;")
                InsBufLine(context.hbuf, sel.lnFirst+7, "@szPrefix@}")
            
                e_SearchNextTag()
            }
            else
            {
                Enter
            }
        }
        else if(__EndWith(context.szRealLine, ":") && __StartWith(context.szRealLine, "case "))
        {
            InsBufLine(context.hbuf, sel.lnFirst+1, "@szPrefix@    @SL_TAG@")
            InsBufLine(context.hbuf, sel.lnFirst+2, "@szPrefix@    break;")
            e_SearchNextTag()
        }
        else if(context.szRealLine == "do")
        {
            __InsertBufBlock(context, " while (@SL_TAG@)")
            e_SearchNextTag()
        }
        else if(context.szRealLine == "else")
        {
            __InsertBufBlock(context, "")
            e_SearchNextTag()
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

