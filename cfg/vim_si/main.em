event AppStart()
{
    // SL_TAG is used for indicating where developpers should edit and is the
    //   target between TAB jumping
    //
    
    global SL_TAG
    SL_TAG = "`"

    __MarkInit()
}
/** 
 * Ask a key input and return the key value
 */
macro __InputKey()
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
macro __IsSameSelection(sel1, sel2)
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
macro __IsSelectionMultiChars()
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
/**
 * Get TAB char
 */
macro __GetTabChar()
{
    return charFromAscii(9)
}
/**
 * Get ENTER char
 */
macro __GetEnterChar()
{
    var chR
    var chN
    var strReturn

    chR = charFromAscii(13)
    chN = charFromAscii(10)
    return "@chR@@chN@"
}
/**
 * Get current context
 */
macro __GetContext()
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
    context.szPrefix    = __GetEmptyPrefix(context.szLine)
    context.szTrimLine  = __Trim(context.szLine)
    context.szRealLine  = __RemoveTailComment(context.szTrimLine)
    context.szRealLine  = __ClearInnerSpace(context.szRealLine)

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
        context.fInRealEnd  = __AllWSAfter(context.szLine, sel.ichFirst)
    }

    return context
}
/**
 *  Check the buffer is supported file type or not
 *  we support C/H files only
 *  if srcOnly is true, H is not supported(sometimes the command will only 
 *  effective for C file)
 */
macro __IsCFile(hbuf, srcOnly)
{
    var szFile
    var len
    var str
    
    szFile = GetBufName(hbuf)
    szFILE = toupper(szFile);
    if(__EndWith(szFILE, ".H") || __EndWith(szFILE, ".C"))
    {
        return True
    }

    return False
}
/**
 * Get next line content
 */
macro __GetNextLine(hbuf, line)
{
    return GetBufLine(hbuf, line+1)
}
/**
 * Get next non-empty line
 * empty line indicates a line with only WS or nothing
 */
macro __GetNextNonEmptyLine(context)
{
    var sel
    var line

    sel = context.sel
    line = sel.lnFirst

    while(line+1 < context.nrLine)
    {
        var str
        str = __GetNextLine(context.hbuf, line)
        
        if(!__IsEmptyLine(str))
            return str

        line = line + 1
    }

    return ""
}
/**
 * Select window to sel and if it is outside of the window view, 
 * scroll window down to let it be inside
 */
macro __ScrollDownTo(hwnd, sel)
{  
    var ln
    var pos
    
    ln = sel.lnFirst
    //msg("@ln@")
    SetWndSel(hwnd, sel)

    pos = YposFromLine(hwnd, sel.lnFirst)
    if(pos < 0)
    {
        ScrollWndToLine(hwnd, sel.lnFirst - 10)
    }
}

/** 
 * Select window to sel and if it is outside of the window view, 
 * scroll window up to let it be inside
 */
macro __ScrollUpTo(hwnd, sel)
{
    var pos
    SetWndSel(hwnd, sel)

    pos = YposFromLine(hwnd, sel.lnFirst)
    if(pos < 0)
    {
        ScrollWndToLine(hwnd, sel.lnFirst - 10)
    }
}
/* Check if this is a right part of a parentheses */
macro __IsSupportedRightParentheses(ch)
{
    if(ch == "]" || ch == ")" || ch == "}" || ch == "\"")
    {
        return True
    }
    return False
}
/* Get the right part of a parentheses per its right part */
macro __GetLeftParentheses(ch)
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
macro __MatchParentheses(chStart, chEnd)
{
    var ch 
    ch = __GetLeftParentheses(chEnd)
    if(ch == chStart)
    {
        return True
    }

    return False
}
/* Check if index is in the edge of a quote mark */
macro __MatchQuote(line, index)
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
macro __TryJumpParentheses(context, sel)
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
        if(__IsWS(line[index]))
        {
            index = index + 1
        }
        else
        {
            followCh = line[index]
            break;
        }
    }
    if(!__IsSupportedRightParentheses(followCh))
    {
        return ret
    }

    if(followCh == "\"")
    {
        ret = __MatchQuote(line, index)
    }
    else
    {
        var pos
        pos = sel.ichFirst-1
        while(pos >= 0)
        {
            if(__MatchParentheses(line[pos], followCh))
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
        __ScrollDownTo(context.hwnd, csel)
    }

    return ret

    
}


macro __GetFileName(path)
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

macro e_GetKey()
{
    var key
    
    StartMsg("Press your key")
    key = getkey()
    EndMsg()
    msg key
}


