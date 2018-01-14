/**
 * Smart Home
 * Jump to the Non-White-Space beginning, if already be there, 
 * jump to the beginning of the line
 */
macro e_SmartHome()
{
    var context
    var allWS
    
    context = __GetContext()
    sel = context.sel
    if(sel.ichFirst == 0)
        return False
        
    allWS = False
    
    if(__AllWsBefore(context.szLine, sel.ichFirst))
    {
        allWS = True
    }

    if(allWS)
    {
        Beginning_Of_Line 
    }
    else
    {
        Smart_Beginning_Of_Line
    }

    __UpdateMark()
    return True
    
}
/**
 * Smart End
 * Jump to the Non-White-Space end, if already be there, jump to the end of line
 */
macro e_SmartEnd()
{
    var context
    var allWS
    
    context = __GetContext()
    sel = context.sel
    if(context.fInEnd)
        return False
        
    allWS = True
    
    if(!context.fInRealEnd)  
    {
        allWS = False
    }

    if(allWS)
    {
        End_Of_Line
    }
    else
    {
        Smart_End_Of_Line
    }
    
    __UpdateMark()

    return True
}

macro e_BlockUp()
{
    Block_Up
    __UpdateMark()
}
macro e_BlockDown()
{
    Block_Down
    __UpdateMark()
}

macro e_ParenRight()
{
    Paren_Right
    __UpdateMark()
}
macro e_ParenLeft()
{
    Paren_Left
    __UpdateMark()
}
macro e_BlankLineDown()
{
    Blank_Line_Down
    __UpdateMark()
}
macro e_BlankLineUp()
{
    Blank_Line_Up
    __UpdateMark()
}
macro e_FunctionUp()
{
    Function_Up
    __UpdateMark()
}
macro e_FunctionDown()
{
    Function_Down
    __UpdateMark()
}

macro e_MoveToNextChar()
{
    Cursor_Right
    __UpdateMark()
}
macro e_MoveToPrevChar()
{
    Cursor_Left
    __UpdateMark()
}
macro e_MoveToNextWord()
{
    Word_Right
    __UpdateMark()
}
macro e_MoveToPrevWord()
{
    Word_Left
    __UpdateMark()
}
macro e_MoveToPrevLine()
{
    Cursor_Up
    __UpdateMark()
}
macro e_MoveToNextLine()
{
    Cursor_Down
    __UpdateMark()
}
macro e_MoveToLineHead()
{
    Beginning_Of_Line
    __UpdateMark()
}
macro e_MoveToLineEnd()
{
    End_Of_Line
    __UpdateMark()
}
macro e_MoveToNextScreen()
{
    Page_Down
    __UpdateMark()
}
macro e_MoveToPrevScreen()
{
    Page_Up
    __UpdateMark()
}
macro e_MoveToBuffEnd()
{
    Bottom_Of_File
    __UpdateMark()
}
macro e_MoveToBuffHead()
{
    
    Top_Of_File
    __UpdateMark
}

