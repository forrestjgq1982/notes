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

macro eSrch()
{
	`
}
macro eSrchBwd()
{
	`
}
macro eSrchFwd()
{
	`
}
macro eIncSrchBwd()
{
	`
}
macro eIncSrchFwd()
{
	`
}
macro eSrchSelBwd()
{
	`
}
macro eSrchSelFwd()
{
	`
}
macro eLookupRef()
{
	`
}
macro eSrchFiles()
{
	`
}
macro eReplace()
{
	`
}

macro eReplaceFiles()
{
	`
}
macro eSearchPrevTag()
{
    LoadSearchPattern(SL_TAG, False, False, False);
    Search_Backward
}
macro eSearchNextTag()
{
    LoadSearchPattern(SL_TAG, False, False, False);
    Search_Forward
}

