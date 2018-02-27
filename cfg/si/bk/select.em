

macro _SelectFirstFunc(hwnd)
{
    _SelectFirstLine(hwnd)
    Function_Down
}
macro _SelectLastFunc(hwnd)
{
    _SelectLastLine(hwnd)
    Function_Up
}
macro _SelectFirstLine(hwnd)
{
    var sel
    var cnt

    sel = GetWndSel(hwnd)
    
    sel.lnFirst = 0
    sel.lnLast = 0
    sel.ichFirst = 0
    sel.ichLim = 0
    sel.fExtended = False
    sel.fRect = False

    /* Select to end */
    SetWndSel(hwnd, sel)
}
macro _SelectLastLine(hwnd)
{
    var sel
    var cnt

    sel = GetWndSel(hwnd)
    cnt = GetWndLineCount(hwnd)
    
    sel.lnFirst = cnt-1
    sel.lnLast = cnt-1
    sel.ichFirst = 0
    sel.ichLim = 0
    sel.fExtended = False
    sel.fRect = False

    /* Select to end */
    SetWndSel(hwnd, sel)
}

macro eSelectAll()
{
}
macro eSelectFuncOrSym()
{
	`
}
macro eSelectMatch()
{
	`
}
macro eSelectLine()
{
	`
}
macro eSelectWord()
{
	`
}
macro eSelectBlock()
{
	`
}
macro eSelectParagraph()
{
	`
}
macro eBeginOfSelection()
{
	`
}
macro eEndOfSelection()
{
	`
}

