macro e_LastWindow()
{
}
macro e_PrevBuf()
{
    `
}

macro e_NextBuf()
{
    `
}

macro e_ActSrchResult()
{
    `
}
macro e_ReCenterTopBottom()
{
    var hWnd
    var currSel
    var currSelYPos
    var rect
    var line

    hWnd = GetCurrentWnd()
    if(hWnd == hNil)
    {
        return
    }

    currSel = GetWndSel(hWnd)
    currSelYPos = YposFromLine(hWnd, currSel.lnLast)
    rect = GetWndClientRect(hWnd)
    
    /* Selection out of window, do nothing */
    if (rect.Bottom <= currSelYPos || rect.Top > currSelYPos)
    {
        return
    }

    var centerYPos
    centerYPos = ( rect.Top + rect.Bottom ) / 2
    if (currSelYPos < centerYPos) // Top half
    {
        if (currSelYPos - rect.Top < centerYPos - currSelYPos)
        {
            /* near top, center it */
            line = currSel.lnLast - GetWndLineCount(hWnd)/2
            if(line < 0)
            {
                line = 0
            }
        }
        else
        {
            /* near center, bottom it */
            line = currSel.lnLast - GetWndLineCount(hWnd) + 1
            if(line < 0)
            {
                line = 0
            }
        }
    }
    else // Bottom half
    {
        if (rect.Bottom - currSelYPos < currSelYPos - centerYPos)
        {
            /* near bottom, top it */
            line = currSel.lnLast
        }
        else
        {
            /* near center, bottom it */
            line = currSel.lnLast - GetWndLineCount(hWnd) + 1
            if(line < 0)
            {
                line = 0
            }
        }
    }

    ScrollWndToLine(hWnd, line)
}

