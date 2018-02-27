event AppStart()
{
    // SL_TAG is used for indicating where developpers should edit and is the
    //   target between TAB jumping
    //
    
    global SL_TAG
    /**
     * boolean value to indicate if the selection mark is activated
     */
    global g_bMark
    /**
     * Start position of selection, this is set when: 
     * - mark is activated, or
     * - mark is not activated, but a selection exist by mouse or other command, and
     *   a command is executed
     */
    global g_StartPos
    global g_EndPos


    

    SL_TAG = "`"
    g_bMark = False
}
/** 
 * Ask a key input and return the key value
 */
macro _InputKey()
{
    var key
    var keys
    
	StartMsg("Key Command: Please press command key, or Esc to abort")
	key = getkey()
	EndMsg()
    //msg("keys=@keys@ key=@key@")
    return key
}

/**
 * Check 2 selections to see if they are same
 */
macro _IsSameSelection(sel1, sel2)
{
	if (sel1.lnFirst != sel2.lnFirst ||
	    sel1.lnLast != sel2.lnLast ||
	    sel1.ichFirst != sel2.ichFirst ||
	    sel1.ichLim != sel2.ichLim ||
	    sel1.fExtended != sel2.fExtended ||
	    sel1.fRect != sel2.fRect ||
	    sel1.xLeft != sel2.xLeft ||
	    sel1.xRight != sel2.xRight)
    {
    	return False
    }

    return True
}
/**
 * Check if currently any block is selected
 */
macro _IsSelectionMultiChars()
{
	var hWnd
	hWnd = GetCurrentWnd()
	if(hWnd == hNil)
	{
		stop
	}

	var sel
	sel = GetWndSel(hWnd)

	if (sel.lnFirst != sel.lnLast || sel.ichFirst != sel.ichLim)
	{
		return True
	}
	return False
}
macro _GetTabChar()
{
	charFromAscii(9)
}
macro _GetEnterChar()
{
    var chR
    var chN
    var strReturn

    chR = charFromAscii(13)
    chN = charFromAscii(10)
	return "@chR@@chN@"
}


macro _GetContext()
{
    var context
    
    /* Current window & buffer handler */
    var hwnd
    var hbuf
    /* Current Selection */
    var sel
    /* First Full line string selected */
    var szLine
    /* White spaces of the header of szLine */
    var szPrefix
    /* Trimed string of szLine */
    var szTrimLine
    /* All continuous white spaces whill be removed */
    var szRealLine
    /* The amount of lines in current buffer */
    var nrLine
    /* Is cursor at the end */
    var fInEnd
    /* Is cursor at the real end, (may followed by a few white spaces */
    var fInRealEnd
    /* Full path like c:\a\b\c.c */
    var szFullPath
    /* File name like c.c */
    var szFileName
    /* File Directory like c:\a\b */
    var szDir

    context.hwnd    = GetCurrentWnd()
    context.hbuf    = GetWndBuf(context.hwnd)
    context.szFullPath  = GetBufName(context.hbuf)
    szFullPath          = context.szFullPath

    var len
    var pos
    len = strlen(context.szFullPath)
    pos = len - 1 
    while(pos >= 0)
    {
        if(szFullPath[pos] == "\\")
            break;
        pos = pos - 1
    }

    if(pos > 0 && pos < len - 1)
    {
        context.szFileName  = strmid(context.szFullPath, pos + 1, len)
        context.szDir       = strmid(context.szFullPath, 0, pos)
    }
    else
    {
        context.szFileName  = ""
        context.szDir       = ""
    }
    context.sel     = GetWndSel(context.hwnd)
    context.nrLine  = GetBufLineCount(context.hbuf)
    
    sel                 = context.sel
    context.szLine      = GetBufLine(context.hbuf, sel.lnFirst)
    context.szPrefix    = _GetEmptyPrefix(context.szLine)
    context.szTrimLine  = _Trim(context.szLine)
    context.szRealLine  = _RemoveTailComment(context.szTrimLine)
    context.szRealLine  = _ClearInnerSpace(context.szRealLine)

    context.fInEnd      = False
    if(sel.ichFirst == strlen(context.szLine))
    {
        context.fInEnd = True
    }

    if(context.fInEnd)
    {
        context.fInRealEnd = True
    }
    else
    {
        context.fInRealEnd  = _AllWSAfter(context.szLine, sel.ichFirst)
    }

    return context
}
/*
    Check the buffer is supported file type or not
    we support C/H files only
    if srcOnly is true, H is not supported(sometimes the command will only 
    effective for C file)
*/
macro _IsCFile(hbuf, srcOnly)
{
    var szFile
    var len
    var str
    
    szFile = GetBufName(hbuf)
    len = strlen(szFile)
    if(len > 2)
    {   
        str = szFile[len-2]
        if(str == ".")
        {
            str = szFile[len-1]
            if( str == "c" || str == "C")
            {
                return True
            }
            if(!srcOnly)
            {
                if( szFile[len-1] == "h" || szFile[len-1] == "H")
                {
                    return True
                }
            }
        }
    }

    return False
}

macro eGetKey()
{
    var key
	
	StartMsg("Press your key")
	key = getkey()
	EndMsg()
	msg key
}
macro _GetNextLine(hbuf, line)
{
    return GetBufLine(hbuf, line+1)
}
macro _GetNextNonEmptyLine(context)
{
    var sel
    var line

    sel = context.sel
    line = sel.lnFirst

    while(line+1 < context.nrLine)
    {
        var str
        str = _GetNextLine(context.hbuf, line)
        
        if(!_IsEmptyLine(str))
            return str

        line = line + 1
    }

    return ""
}
/* Select window to sel and if it is outside of the window view, 
    scroll window down to let it be inside
*/
macro _ScrollDownTo(hwnd, sel)
{    
    ln = sel.lnFirst
    //msg("@ln@")
    SetWndSel(hwnd, sel)

    pos = YposFromLine(hwnd, sel.lnFirst)
    if(pos < 0)
    {
        ScrollWndToLine(hwnd, sel.lnFirst - 10)
    }
}

/* Select window to sel and if it is outside of the window view, 
    scroll window up to let it be inside
*/
macro _ScrollUpTo(hwnd, sel)
{    
    SetWndSel(hwnd, sel)

    pos = YposFromLine(hwnd, sel.lnFirst)
    if(pos < 0)
    {
        ScrollWndToLine(hwnd, sel.lnFirst - 10)
    }
}
/* Match Clause keywords and extends its block
   return True:Succeed/False:Fail
*/
macro _TryClause(context)
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
    else if(_CompareKeywords(szWord, "while"))
    {
        res = True
        str = "@szPrefix@while (@SL_TAG@)"
    }
    else if(_CompareKeywords(szWord, "do"))
    {
        res = True
        str = "@szPrefix@do"
        tail = " while (@SL_TAG@)"
    }
    else if(_CompareKeywords(szWord, "if"))
    {
        res = True
        str = "@szPrefix@if (@SL_TAG@)"
    }
    else if(_CompareKeywords(szWord, "else"))
    {
        res = True
        str = "@szPrefix@else"
    }

    else if(_CompareKeywords(szWord, "switch"))
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
    
        _TryJump()
        return True
    }
    else  if(_CompareKeywords(szWord, "case"))
    {
        str = "@szPrefix@case @SL_TAG@:"
        PutBufLine(context.hbuf, sel.lnFirst, str)
        str = "@szPrefix@    @SL_TAG@"
        InsBufLine(context.hbuf, sel.lnFirst+1, str)
        str = "@szPrefix@    break;"
        InsBufLine(context.hbuf, sel.lnFirst+2, str)
        _TryJump()
        return True
    }
    else if(_CompareKeywords(szWord, "for"))
    {
        res = True
        str = "@szPrefix@for (@SL_TAG@, @SL_TAG@, @SL_TAG@)"
    }
    else if(_CompareKeywordsReverse(szWord, "/*"))
    {
        PutBufLine(context.hbuf, sel.lnFirst, "@szPrefix@@szWord@  */")
        sel.ichFirst = sel.ichFirst+1
        sel.ichLim = sel.ichFirst
        _ScrollDownTo(context.hwnd, sel)
        return True
    }
    else if(_CompareKeywords(szWord, "#include"))
    {
        PutBufLine(context.hbuf, sel.lnFirst, "@szPrefix@#include \"@SL_TAG@\"")
        _TryJump()
        return True
    }
    else if(_CompareKeywords(szWord, "struct"))
    {
        res = True
        str = "@szPrefix@typedef struct"
        tail = " @SL_TAG@;"
        csel.lnFirst = csel.lnFirst+3
        csel.ichLim = 0
    }

    else if(_CompareKeywords(szWord, "enum"))
    {
        res = True
        str = "@szPrefix@typedef enum"
        tail = " @SL_TAG@;"
        csel.lnFirst = csel.lnFirst+3
        csel.ichLim = 0
    }

    else if(_CompareKeywords(szWord, "union"))
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
        _InsertBufBlock(context, tail)
        cnt = GetBufLineCount(context.hbuf)
        //msg("cnt=@cnt@, csel=@csel@")
        //SearchInBuf(context.hbuf, SL_TAG, csel.lnFirst, csel.ichLim, 1, 0, 1)
        csel = SearchInBuf(context.hbuf, SL_TAG, csel.lnFirst, csel.ichLim, 1, 0, 1)
        _ScrollDownTo(context.hwnd, csel)
        return True
    }

    return False
}
/* Search lines before current for SL_TAG */
macro _SearchBackTag(context)
{
    var csel
    csel = context.sel
    var first
    first = csel.lnFirst - 80
    if(first < 0) first = 0
    

    sel = SearchInBuf(context.hbuf, SL_TAG, first, 0, 1, 0, 1)
    
    if(sel != "")
    {
        if(sel.lnFirst - csel.lnFirst > 80) 
            return False
            
        _ScrollUpTo(context.hwnd, sel)
        return True
    }
    return False
}
/* Check if this is a right part of a parentheses */
macro _IsSupportedRightParentheses(ch)
{
    if(ch == "]" || ch == ")" || ch == "}" || ch == "\"")
    {
        return True
    }
    return False
}
/* Get the right part of a parentheses per its right part */
macro _GetLeftParentheses(ch)
{
    if(ch == "]")
    {
        return "["
    }
    
    if(ch == "}")
    {
        return "{"
    }
    
    if(ch == ")")
    {
        return "("
    }
    
    if(ch == "\"")
    {
        return "\""
    }

    return ""
}
/* Check if this is the left and right char of the same parentheses */
macro _MatchParentheses(chStart, chEnd)
{
    var ch 
    ch = _GetLeftParentheses(chEnd)
    if(ch == chStart)
    {
        return True
    }

    return False
}
/* Check if index is in the edge of a quote mark */
macro _MatchQuote(line, index)
{
    var even
    var pos
    var trans
    var ch 
    
    even = True
    pos = 0
    trans = False
    while(pos <= index)
    {
        if(trans)
        {
            trans = False
        }
        else
        {
            if(line[pos] == "\\")
            {
                trans = True
            }
            else if(line[pos] == "\""
            {
                even = !even
            }
        }
        ch = line[pos]
        //msg("ch=@ch@ trans=@trans@ even=@even@")
        pos = pos + 1
    }

    return even
    
}
/* Jump out of a parentheses like {} */
macro _TryJumpParentheses(context, sel)
{
    var ret
    var followCh;
    var len 
    var line
    var index
    ret = False
    
    /* if cursor is just before the right parentheses, jump out of it
       supporting bracing is:
            []
            {}
            ()
            ""
    */
    if(sel.ichFirst != sel.ichLim || sel.lnFirst != sel.lnLast) 
    {
        return ret
    }
    index = sel.ichFirst
    line = context.szLine
    len = strlen(line)
    followCh = ""
    /* Search the char following the cursor */
    while(index < len)
    {
        if(_IsWS(line[index]))
        {
            index = index + 1
        }
        else
        {
            followCh = line[index]
            break;
        }
    }
    if(!_IsSupportedRightParentheses(followCh))
    {
        return ret
    }

    if(followCh == "\"")
    {
        ret = _MatchQuote(line, index)
    }
    else
    {
        var pos
        pos = sel.ichFirst-1
        while(pos >= 0)
        {
            if(_MatchParentheses(line[pos], followCh))
            {
                ret = True
                break;
            }
            pos = pos - 1
        }
        
    }

    if(ret)
    {
        var csel
        csel = sel
        csel.ichFirst = index+1
        csel.ichLim = index+1
        _ScrollDownTo(context.hwnd, csel)
    }

    return ret

    
}
/* Jump between SL_TAGs or out of a parentheses
*/
macro _TryJump()
{
    eSearchNextTag() 
}

macro _GetWord(str, startIdx, endIdx)
{
    var rec
    rec.fEnd = False
    rec.strWord = ""

    var begin
    begin = -1

    while(startIdx < endIdx)
    {
        var ch
        ch = str[startIdx]
        if(begin == -1)
        {
            if(!_IsWS(ch))
            {
                begin = startIdx
            }
        }
        else
        {
            if(_IsWS(ch))
            {
                rec.fEnd = False
                rec.strWord = strmid(str, begin, startIdx)
                return rec
            }
        }
        startIdx = startIdx + 1
    }
    if(startIdx == endIdx)
    {
        rec.fEnd = True
    }
    if(begin != -1)
    {
        rec.strWord = strmid(str, begin, endIdx)
    }
    return rec
}


macro _GetFileName(path)
{

	len = strlen(path)
	if(len == 0)
	{
		return ""
	}

	idx = len - 1
	while(idx > 0)
	{
		if ( path[idx] == "\\" )
		{
			return strmid(path, idx+1, len)
		}
		idx = idx - 1
	}

	return path
}


