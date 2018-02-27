macro _SetMarkOn()
{
	g_bMark = True
}
macro _SetMarkOff()
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
macro _IsMarkOn()
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
macro eDoMark()
{
	if (_IsMarkOn())
	{
		_SetMarkOff()
	}
	else
	{
		_SetMarkOn()
	}
}

