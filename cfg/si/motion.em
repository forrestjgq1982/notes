/* SmartEnd
    Jump to the Non-White-Space beginning, if already be there, jump to the beginning of the line
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

    return True
    
}
/* SmartEnd
    Jump to the Non-White-Space end, if already be there, jump to the end of line
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

    return True
}

macro e_BlockUp()
{
    
}
macro e_BlockDown()
{
    
}
macro e_CursorLeft()
{
}
macro e_CursorRight()
{
}
macro e_CursorUp()
{
}
macro e_CursorDown()
{
}

macro e_ParenRight()
{
    
}
macro e_ParenLeft()
{
    
}
macro e_BlankLineDown()
{
    
}
macro e_BlankLineUp()
{
    `
}
macro e_FunctionUp()
{
    `
}
macro e_FunctionDown()
{
    `
}

macro e_MoveToNextChar()
{
    if (__IsMarkOn())
    {
        Select_Char_Right
    }
    else
    {
        Cursor_Right
    }
}
macro e_MoveToPrevChar()
{
    if (__IsMarkOn())
    {
        Select_Char_Left
    }
    else
    {
        Cursor_Left
    }
}
macro e_MoveToNextWord()
{
    if (__IsMarkOn())
    {
        Select_Word_Right
    }
    else
    {
        Word_Right
    }
}
macro e_MoveToPrevWord()
{
    if (__IsMarkOn())
    {
        Select_Word_Left
    }
    else
    {
        Word_Left
    }
}
macro e_MoveToPrevLine()
{
    if (__IsMarkOn())
    {
        Select_Line_Up
    }
    else
    {
        Cursor_Up
    }
}
macro e_MoveToNextLine()
{
    if (__IsMarkOn())
    {
        Select_Line_Down
    }
    else
    {
        Cursor_Down
    }
    
}
macro e_MoveToLineHead()
{
    if (__IsMarkOn())
    {
        Select_To_Start_Of_Line
    }
    else
    {
        Beginning_Of_Line
    }
    
    
}
macro e_MoveToLineEnd()
{
    if (__IsMarkOn())
    {
        Select_To_End_Of_Line
    }
    else
    {
        End_Of_Line
    }
    
}
macro e_MoveToNextScreen()
{
    if (__IsMarkOn())
    {
        Select_Page_Down
    }
    else
    {
        Page_Down
    }
    

}
macro e_MoveToPrevScreen()
{
    if (__IsMarkOn())
    {
        Select_Page_Up
    }
    else
    {
        Page_Up
    }
    
}
macro e_MoveToBuffEnd()
{
    if (__IsMarkOn())
    {
        Select_To_End_Of_File
    }
    else
    {
        Bottom_Of_File
    }
    
}
macro e_MoveToBuffHead()
{
    if (__IsMarkOn())
    {
        Select_To_Top_Of_File
    }
    else
    {
        Top_Of_File
    }
}

