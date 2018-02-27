/* SmartEnd
    Jump to the Non-White-Space beginning, if already be there, jump to the beginning of the line
*/
macro eSmartHome()
{
    var context
    var allWS
    
    context = _GetContext()
    sel = context.sel
    if(sel.ichFirst == 0)
        return False
        
    allWS = False
    
    if(_AllWsBefore(context.szLine, sel.ichFirst))
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
macro eSmartEnd()
{
    var context
    var allWS
    
    context = _GetContext()
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

macro eBlockUp()
{
	
}
macro eBlockDown()
{
	
}
macro eCursorLeft()
{
}
macro eCursorRight()
{
}
macro eCursorUp()
{
}
macro eCursorDown()
{
}

macro eParenRight()
{
	
}
macro eParenLeft()
{
	
}
macro eBlankLineDown()
{
	
}
macro eBlankLineUp()
{
	`
}
macro eFunctionUp()
{
	`
}
macro eFunctionDown()
{
	`
}

macro eMoveToNextChar()
{
	if (_IsMarkOn())
	{
		Select_Char_Right
	}
	else
	{
		Cursor_Right
	}
}
macro eMoveToPrevChar()
{
	if (_IsMarkOn())
	{
		Select_Char_Left
	}
	else
	{
		Cursor_Left
	}
}
macro eMoveToNextWord()
{
	if (_IsMarkOn())
	{
		Select_Word_Right
	}
	else
	{
		Word_Right
	}
}
macro eMoveToPrevWord()
{
	if (_IsMarkOn())
	{
		Select_Word_Left
	}
	else
	{
		Word_Left
	}
}
macro eMoveToPrevLine()
{
	if (_IsMarkOn())
	{
		Select_Line_Up
	}
	else
	{
		Cursor_Up
	}
}
macro eMoveToNextLine()
{
	if (_IsMarkOn())
	{
		Select_Line_Down
	}
	else
	{
		Cursor_Down
	}
	
}
macro eMoveToLineHead()
{
	if (_IsMarkOn())
	{
		Select_To_Start_Of_Line
	}
	else
	{
		Beginning_Of_Line
	}
	
	
}
macro eMoveToLineEnd()
{
	if (_IsMarkOn())
	{
		Select_To_End_Of_Line
	}
	else
	{
		End_Of_Line
	}
	
}
macro eMoveToNextScreen()
{
	if (_IsMarkOn())
	{
		Select_Page_Down
	}
	else
	{
		Page_Down
	}
	

}
macro eMoveToPrevScreen()
{
	if (_IsMarkOn())
	{
		Select_Page_Up
	}
	else
	{
		Page_Up
	}
	
}
macro eMoveToBuffEnd()
{
	if (_IsMarkOn())
	{
		Select_To_End_Of_File
	}
	else
	{
		Bottom_Of_File
	}
	
}
macro eMoveToBuffHead()
{
	if (_IsMarkOn())
	{
		Select_To_Top_Of_File
	}
	else
	{
		Top_Of_File
	}
}

