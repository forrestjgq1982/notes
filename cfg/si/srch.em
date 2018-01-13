
/* Search lines before current for SL_TAG */
macro __SearchBackTag(context)
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
            
        __ScrollUpTo(context.hwnd, sel)
        return True
    }
    return False
}

macro e_Srch()
{
    `
}
macro e_SrchBwd()
{
    `
}
macro e_SrchFwd()
{
    `
}
macro e_IncSrchBwd()
{
    `
}
macro e_IncSrchFwd()
{
    `
}
macro e_SrchSelBwd()
{
    `
}
macro e_SrchSelFwd()
{
    `
}
macro e_LookupRef()
{
    `
}
macro e_SrchFiles()
{
    `
}
macro e_Replace()
{
    `
}

macro e_ReplaceFiles()
{
    `
}
macro e_SearchPrevTag()
{
    LoadSearchPattern(SL_TAG, False, False, False);
    Search_Backward
}
macro e_SearchNextTag()
{
    LoadSearchPattern(SL_TAG, False, False, False);
    Search_Forward
}

