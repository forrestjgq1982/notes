macro __MarkInit()
{
    /**
     * boolean value to indicate if the selection mark is activated
     */
    global g_bMark
    /**
     * boolean value to indicate if the selection is block
     */
    global g_bBlock
    /**
     * Start position of selection, this is set when: 
     * - mark is activated, or
     * - mark is not activated, but a selection exist by mouse or other command, and
     *   a command is executed
     */
    global g_StartPos
    global g_EndPos

    global g_CurrSel
    global g_PrevSel

    g_bMark = False
    g_bBlock = False
    
    g_PrevSel.lnFirst = 0
    g_PrevSel.lnLast = 0
    g_PrevSel.ichFirst = 0
    g_PrevSel.ichLim = 0
    g_PrevSel.fExtended = False
    g_PrevSel.fRect = False

    g_CurrSel = g_PrevSel

}
macro __SetMarkOn()
{
    g_bMark = True
}
macro __SetMarkOff()
{
    g_bMark = False

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
        sel.lnFirst = sel.lnLast
        sel.ichFirst = sel.ichLim
        sel.fExtended = False
        sel.fRect = False
        SetWndSel(hWnd, sel)
    }
}
macro __IsMarkOn()
{
    //msg "mark=@g_bMark@"
    if (g_bMark == True)
    {
        return g_bMark
    }
    else
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
}
macro e_DoMark()
{
    if (__IsMarkOn())
    {
        _SetMarkOff()
    }
    else
    {
        _SetMarkOn()
    }
}

