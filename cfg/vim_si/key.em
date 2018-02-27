macro parse_key(key)
{
    var str
    var i
    var len
    //str="abcdefghijklmnopqrstuvwxyz,./;'\\[]`1234567890-="
    str="1"
    len = strlen(str)
    i = 0

    var hw 
    hw = GetCurrentWnd()
    var hbuf
    hbuf = GetWndBuf(hw)
    var sel
    sel = GetWndSel(hw)
    line = sel.lnFirst+18
    
    while(i < len)
    {
        var key
        var _key
        var c_key
        var a_key
        var ca_key
        var cs_key
        var cas_key
        
        var strKey

        strKey = str[i]
        
        StartMsg("Press @strkey@")
        key = getkey()
        EndMsg()
        
        StartMsg("Press c-@strkey@")
        c_key = getkey()
        EndMsg()
        
        StartMsg("Press a-@strkey@")
        a_key = getkey()
        EndMsg()
        
        StartMsg("Press c-a-@strkey@")
        ca_key = getkey()
        EndMsg()
        
        StartMsg("Press c-s-@strkey@")
        cs_key = getkey()
        EndMsg()
        
        StartMsg("Press c-a-s-@strkey@")
        cas_key = getkey()
        EndMsg()

        InsBufLine(hbuf, line, "{'@strkey@', @key@, @c_key@, @a_key@, @ca_key@, @cs_key@, @cas_key@},")
        
        i = i + 1
        line = line + 1
        
    }
}

macro parse_cap_key(key)
{
    var str
    var i
    var len
    //str="abcdefghijklmnopqrstuvwxyz,./;'\\[]`1234567890-="
    str="aA,<.>/?;:'\"\\|[{]}`~1!2\@3#4$5%6^7&8*9(0)-_=+"
    len = strlen(str)
    i = 0

    var hw 
    hw = GetCurrentWnd()
    var hbuf
    hbuf = GetWndBuf(hw)
    var sel
    sel = GetWndSel(hw)
    line = sel.lnFirst+4
    
    while(i < len)
    {
        var key
        
        var strKey

        strKey = str[i]
        strCapKey = str[i+1]
        
        StartMsg("Press @strCapkey@")
        key = getkey()
        EndMsg()

        InsBufLine(hbuf, line, "{'@strkey@', '@strCapKey@', @key@},")
        
        i = i + 2
        line = line + 1
        
    }
}

macro parse_f_key(key)
{
    var str
    var i
    var len
    //str="abcdefghijklmnopqrstuvwxyz,./;'\\[]`1234567890-="
    str="/*-+"
    len = strlen(str)
    i = 0

    var hw 
    hw = GetCurrentWnd()
    var hbuf
    hbuf = GetWndBuf(hw)
    var sel
    sel = GetWndSel(hw)
    line = sel.lnFirst+4
    
    while(i < len)
    {
        var key
        var _key
        var c_key
        var a_key
        var ca_key
        var cs_key
        var cas_key
        
        var strKey

        strKey = str[i]
        
        StartMsg("Press F@strkey@")
        key = getkey()
        EndMsg()
        
        StartMsg("Press c-@strkey@")
        c_key = getkey()
        EndMsg()
        
        StartMsg("Press a-@strkey@")
        a_key = getkey()
        EndMsg()
        
        StartMsg("Press c-a-@strkey@")
        ca_key = getkey()
        EndMsg()
        
        StartMsg("Press c-s-@strkey@")
        cs_key = getkey()
        EndMsg()
        
        StartMsg("Press c-a-s-@strkey@")
        cas_key = getkey()
        EndMsg()

        InsBufLine(hbuf, line, "{\"F@strkey@\", @key@, @c_key@, @a_key@, @ca_key@, @cs_key@, @cas_key@},")
        
        i = i + 1
        line = line + 1
        
    }
}

