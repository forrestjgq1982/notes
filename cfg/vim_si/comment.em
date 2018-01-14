
/* Check function in the sel postion is commented or not */
macro __Commented(hbuf, sel)
{
    var nrLine
    var szLine
    var len
    
    nrLine = sel.lnFirst-1
    
    while(nrLine >= 0)
    {
        szLine = GetBufLine(hbuf, nrLine)
        szLine = __Trim(szLine)
        len = strlen(szLine)

        /**
         * check if this is an empty line, if so, skip it
         */
        if(szLine == "")
        {
            nrLine = nrLine - 1
            continue
        }

        /**
         * it must be an ending of comment, if not, it's not commented
         */
        if(szLine == "*/")
        {
            nrLine = nrLine - 1
            while(nrLine >= 0)
            {
                szLine = GetBufLine(hbuf, nrLine)
                if(__StartWith(szLine, " *"))
                {
                    nrLine = nrLine - 1
                    continue
                }

                if(szLine == "/*!" || szLine == "/**")
                {
                    return True
                }

                return False
            }
        }

        return False
    }

    return False
}
/**
 * Remove current function comment
 * You must be sure that current function is __Commented and 
 * cursor is under the first line of function, which indicates
 * that previous non-empty line is the end of comment
 */
macro __RemoveCommented(hbuf, sel)
{
    var line
    var szLine
    
    line = sel.lnFirst - 1
    while(1)
    {
        szLine = GetBufLine(hbuf, line)
        DelBufLine(hbuf, line)
        
        if(szLine == "/*!")
        {
            return
        }
        line = line - 1
    }
}

/* remove tail comment like // comment */
macro __RemoveTailComment(str)
{
    len = strlen(str)
    pos = len - 1
    while(pos > 0)
    {
        if(str[pos-1] == "/")
        {
            if(str[pos] == "/")
            {
                return strmid(str, 0, pos-1)
            }
        }
        pos = pos - 1
    }

    return str
}

macro __DoComment(context)
{
    var sel
    var line
    var szFn
    var len
    var first
    var loop 
    var start
    var scLen
    var pos
    var szSc
    var ret
    var parm
    var next
        
    sel = context.sel

    /* Function already __Commented */
    if(__Commented(context.hbuf, sel)) 
        return False
    
    line = sel.lnFirst
     
    szFn = context.szRealLine
    
    if(__StartWith(szFn, "#")) // #define, not a function
        return False 

    /* Check if it looks like void func(void) and  */
    if(__EndWith(szFn, "{"))
    {
        len = strlen(szFn)
        szFn = strmid(szFn, 0, len-1);
        szFn = __Trim(szFn);
    }
    /* Multi-line function definition process */
    else if(!__EndWith(szFn, ")"))
    {
        var bCmt
        var nextLen 
        var bCmt;
        var cnStart
        var cnEnd
        var idx
        var rdLine
        var str1
        var ch
        
        bCmt = False
        loop = 1
        
        while(loop < 20 && loop+line < context.nrLine) /* check at most 20 lines */
        {
            next = ""
            rdLine = GetBufLine(context.hbuf, line+loop)
            rdLine = __RemoveTailComment(rdLine)
            len = strlen(rdLine);
            idx = 0;
            cnStart = -1
            cnEnd = -1
            
            while(idx < len)
            {
                ch = rdLine[idx]
                //msg("@idx@<@len@ ch = @ch@ bCmt = @bCmt@ cnStart = @cnStart@ cnEnd = @cnEnd@")
                if(bCmt)
                {
                    if(idx < len - 1 && rdLine[idx] == "*" && rdLine[idx+1] == "/")
                    {
                        bCmt = False
                        idx = idx + 1
                    }
                }
                else
                {
                    if(idx < len - 1 && rdLine[idx] == "/" && rdLine[idx+1] == "*")
                    {
                        bCmt = True
                        if(cnStart != -1)
                        {
                            cnEnd = idx-1;
                            str1 = strmid(rdLine, cnStart, cnEnd+1);
                            next = "@next@ @str1@"
                            
                            cnStart = -1
                            cnEnd = -1
                        }
                        
                        idx = idx + 1
                    }
                    else
                    {
                        if(cnStart == -1) 
                        {
                            cnStart = idx
                        }
                    }
                }

                
                idx = idx+1
            }
            

            if(cnStart != -1 && cnEnd == -1)
            {
                str1 = strmid(rdLine, cnStart, len);
                next = "@next@ @str1@"
            }
            //msg(next)
            next = __RemoveTailComment(next)
            next = __Trim(next)
            szFn = "@szFn@@next@"
            szFn = __RemoveTailComment(szFn)
            szFn = __Trim(szFn);
            
            if(__EndWith(szFn, "{"))
            {
                len = strlen(szFn)
                szFn = strmid(szFn, 0, len-1);
                szFn = __Trim(szFn);
            }
            
            if(__EndWith(szFn, ")"))
            {
                break;
            }
            loop = loop + 1
        }
        
        if(loop >= 20 || loop+line >= context.nrLine) /* Not a multiline function */
        {
            return False
        }
    }

    szFn = __ClearInnerSpace(szFn)
    
    first = 0
    /* Locate first as the index of ( */
    len = strlen(szFn)
    while(first < len)
    {
        if(szFn[first] == "(")
        {
            break;
        }
        first = first+1
    }

    if(first == len) 
        return False


    saveLine=line
    InsBufLine(context.hbuf, line, "/*!")
    line=line+1
//    InsBufLine(context.hbuf, line, " * \\fn @szFn@")
//    line=line+1
    InsBufLine(context.hbuf, line, " * \\brief @SL_TAG@")
    line=line+1

    loop = first + 1 /* loop is after ( */
    start = loop
    //msg("start = @start@ loop = @loop@")
    while(loop < len)
    {
        if(szFn[loop] == "," || loop == len-1)
        {
            parm = strmid(szFn, start, loop)
            parm = __Trim(parm)
            paraLen = strlen(parm)
            paraPos = paraLen - 1
            while(paraPos > 0)
            {
                if(__IsWS(parm[paraPos]))
                {
                  parm = strmid(parm, paraPos+1, paraLen)
                  break
                }
                paraPos = paraPos-1
            }
            if(parm != "void") parm = "[in] @parm@ @SL_TAG@"
            InsBufLine(context.hbuf, line, " * \\param @parm@")
            line=line+1
            start = loop+1
        }

        loop=loop+1
    }

    szFn = strmid(szFn, 0, first) /* remove all parameters () */
    szFn = __Trim(szFn)
    
    /* remove prefixed static */
    szFn = __RemovePrefix(szFn, "static")
    szFn = __RemovePrefix(szFn, "__MEMORY_DRAM__")
    szFn = __RemovePrefix(szFn, "__MEMORY_IRAM__")
    szFn = __RemovePrefix(szFn, "inline")

    /* remove function name */
    loop = strlen(szFn)-1
    while(loop > 0)
    {
        if(szFn[loop] == " ")
        {
            szFn = strmid(szFn, 0, loop)
            break;
        }
        
        loop=loop-1
    }
    if(loop <= 0) /* parsing fail */
        return False

    
    ret = __Trim(szFn)
    //msg("ret=@ret@")
    if(ret != "void") ret = "@SL_TAG@"
    //msg("ret=@ret@")
    InsBufLine(context.hbuf, line, " * \\return @ret@")
    line=line+1
    
    InsBufLine(context.hbuf, line, "*/")
    line=line+1

    sel.lnFirst = saveLine
    sel.lnLast = saveLine
    sel.ichFirst = 0
    sel.ichLim = 0
    SetWndSel(context.hwnd, sel)
    e_SearchNextTag()

    return True
}

//
// Comment the selected block of text using single line comments and indent it
//
macro e_CommentBlock()
{
    var hbuf
    var hwnd
    var sel
    var cmt
    var iLine
    var szLine
    var len
    var trmLine
    var pos
    
    hbuf = GetCurrentBuf();
    hwnd = GetCurrentWnd();

    sel = GetWndSel(hwnd);
    cmt = True

    iLine = sel.lnFirst;
    
    while (iLine <= sel.lnLast)
    {
        szLine = __Trim(GetBufLine(hbuf, iLine));

        if(__StartWith(szLine, "//"))
        {
            cmt = False
            break
        }
        iLine = iLine + 1;
    }

    iLine = sel.lnFirst;
    while (iLine <= sel.lnLast)
    {
        szLine = GetBufLine(hbuf, iLine);
        len = strlen(szLine)
        trmLine = __Trim(szLine)
        if(__StartWith(trmLine, "//")) // must be cmt == False
        {
            pos = 0
            while(pos < len-1)
            {
                if(szLine[pos] == "/" && szLine[pos+1] == "/")
                {
                    break;
                }
                pos = pos + 1
            }
            if(pos == 0)
            {
                szLine = strmid(szLine, pos+2, len)
            }
            else
            {
                szLine = cat(strmid(szLine, 0, pos), strmid(szLine, pos+2, len))
            }
            
        }
        else if(cmt)
        {
            szLine = cat("//", szLine);
        }
        else
        {
            if(__StartWith(szLine, "  "))
            {
                szLine = strmid(szLine, 2, len)
            }
            else if(__StartWith(szLine, " ") || __StartWith(szLine, "   "))
            {
                szLine = strmid(szLine, 1, len)
            }
        }
        PutBufLine(hbuf, iLine, szLine);
        iLine = iLine + 1;
    }

    if (sel.lnFirst == sel.lnLast)
    {
        if(cmt)
        {
            sel.ichFirst = sel.ichFirst + 2;
            sel.ichLim = sel.ichLim + 2;
        }
        else
        {
            sel.ichFirst = 0
            sel.ichLim = 0
        }
    }
    SetWndSel(hwnd, sel);
}
/* Comment the function where cursor is focus on
*/
macro e_CommentFunc()
{


    /* locate function name */
    eMoveToNextLine
    Function_Down
    Function_Up
        
        
    context = __GetContext()
    
    if(!__IsBufferSupported(context.hbuf, False))
    {
        Enter
        stop
    }

    return __DoComment(context)
}
macro e_CommentAllFunc()
{
    var context
    var sel
    var lsel
    var szBakLine
    var szLine
    
    context = __GetContext()

    if(!__IsCFile(context.hbuf, True))
    {
        stop
    }
        
    sel = context.sel    

    sel.lnFirst = context.nrLine - 1
    sel.lnLast = context.nrLine - 1
    sel.ichFirst = 0
    sel.ichLim = 0
    sel.fExtended = False
    sel.fRect = False

    /* Select to end */
    SetWndSel(context.hwnd, sel)

    /* Find last function and remember the declaration as watchdog */
    Function_Up
    lsel = GetWndSel(context.hwnd)
    szBakLine = GetBufLine(context.hbuf, lsel.lnFirst)

    /* select to first line */
    sel.lnFirst = 0
    sel.lnLast = 0
    sel.ichFirst = 0
    sel.ichLim = 0
    sel.fExtended = False
    sel.fRect = False
    
    SetWndSel(context.hwnd, sel)    

    while(1)
    {
        /* Find next function and comment */
        Function_Down

        /* Now the buffer is changed, so update the context */
        context = __GetContext()
        eCommentFunc()
        
        sel = GetWndSel(context.hwnd)
        szLine = GetBufLine(context.hbuf, sel.lnFirst)
        if(szLine == szBakLine)
            break
    }

    //msg("done")
    return True
    
}
/* For each opened buffer, comment all functions it contains */
macro e_CommentAllOpenBuf()
{
    var hbuf
    var cbuf
    var ibuf
    
    cbuf = BufListCount()
    ibuf = 0
    while (ibuf < cbuf)
    {
        hbuf = BufListItem(ibuf)

        SetCurrentBuf(hbuf)

        if(__IsCFile(hbuf, True))
        {
            CommentAllFunc()
        }
        ibuf = ibuf + 1
        //msg("ibuf=@ibuf@, cbuf=@cbuf@")
    }
    
}


/*!
 *  \file           @szFileName@
 *  \brief          @brf@
 *  \version        1.0
 *  \author         Jiang Guoqing
 *  \date           2014-04-04
 *  \copyright
 *  Copyright (C) 2006--2014 by SimpLight Nanoelectronics, Ltd.\n
 *                 All rights reserved.\n
 * This material constitutes the trade secrets and confidential,\n
 * proprietary information of SimpLight.  This material is not to\n
 * be disclosed, reproduced, copied, or used in any manner  not\n
 * permitted under license from SimpLight Nanoelectronics Ltd.\n
 *
 */

/******************************************************************************
 **                        Edit History
 ** -------------------------------------------------------------------------
 ** DATE                NAME             DESCRIPTION
 ** 2014/04/04          GQ.Jiang         Create
 *****************************************************************************/
macro e_AddFileHdr()
{
    var hbuf
    var cbuf
    var ibuf
    var szFullPath
    var szFileName
    var brf
    var line
    
    cbuf = BufListCount()
    ibuf = 0
    while (ibuf < cbuf)
    {
        hbuf = BufListItem(ibuf)

        SetCurrentBuf(hbuf)

        if(__IsCFile(hbuf, False))
        {
            szFullPath = GetBufName(hbuf)

            var len
            var pos
            len = strlen(szFullPath)
            pos = len - 1 
            while(pos >= 0)
            {
                if(szFullPath[pos] == "\\")
                    break;
                pos = pos - 1
            }

            if(pos > 0 && pos < len - 1)
            {
                szFileName  = strmid(szFullPath, pos + 1, len)
            }
            else
            {
                continue
            }
    
            brf = ask("Enter brief for @szFileName@")

            line = 0;
            InsBufLine(hbuf,line, "/*!")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\file           @szFileName@")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\brief          @brf@")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\version        1.0")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\author         Jiang Guoqing")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\date           2015-07-23")
            line = line + 1
            InsBufLine(hbuf,line, " *  \\copyright")
            line = line + 1
            InsBufLine(hbuf,line, " *  Copyright (C) 2006--2014 by SimpLight Nanoelectronics, Ltd.\\n")
            line = line + 1
            InsBufLine(hbuf,line, " *                 All rights reserved.\\n")
            line = line + 1
            InsBufLine(hbuf,line, " * This material constitutes the trade secrets and confidential,\\n")
            line = line + 1
            InsBufLine(hbuf,line, " * proprietary information of SimpLight.  This material is not to\\n")
            line = line + 1
            InsBufLine(hbuf,line, " * be disclosed, reproduced, copied, or used in any manner  not\\n")
            line = line + 1
            InsBufLine(hbuf,line, " * permitted under license from SimpLight Nanoelectronics Ltd.\\n")
            line = line + 1
            InsBufLine(hbuf,line, " *")
            line = line + 1
            InsBufLine(hbuf,line, " */")
            line = line + 1
            InsBufLine(hbuf,line, "  ")
            line = line + 1
            InsBufLine(hbuf,line, "/******************************************************************************")
            line = line + 1
            InsBufLine(hbuf,line, " **                        Edit History")
            line = line + 1
            InsBufLine(hbuf,line, " ** -------------------------------------------------------------------------")
            line = line + 1
            InsBufLine(hbuf,line, " ** DATE                NAME             DESCRIPTION")
            line = line + 1
            InsBufLine(hbuf,line, " ** 2015/07/23          GQ.Jiang         Create")
            line = line + 1
            InsBufLine(hbuf,line, " *****************************************************************************/")
            line = line + 1
            
        }
        ibuf = ibuf + 1
        //msg("ibuf=@ibuf@, cbuf=@cbuf@")
    }
    
}

