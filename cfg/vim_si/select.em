

macro __SelectFirstFunc(hwnd)
{
    __SelectFirstLine(hwnd)
    Function_Down
}
macro __SelectLastFunc(hwnd)
{
    __SelectLastLine(hwnd)
    Function_Up
}
macro __SelectFirstLine(hwnd)
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
macro __SelectLastLine(hwnd)
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

macro e_SelectAll()
{
}
macro e_SelectFuncOrSym()
{
    `
}
macro e_SelectMatch()
{
    `
}
macro e_SelectLine()
{
    `
}
macro e_SelectWord()
{
    `
}
macro e_SelectBlock()
{
    `
}
macro e_SelectParagraph()
{
    `
}
macro e_BeginOfSelection()
{
    `
}
macro e_EndOfSelection()
{
    `
}

