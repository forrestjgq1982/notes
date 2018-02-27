event AppStart()
{
    global gMode
    global M_ORIG
    global M_NORMAL
    global M_INSERT
    global M_VISUAL

    M_ORIG   = 0
    M_NORMAL = 1
    M_INSERT = 2
    M_VISUAL = 3

    /* Set mode to normal */
    gMode = M_ORIG

    global gWaitKey
    gWaitKey = 0
}

event DocumentOpen(sFile)
{
    
}


macro insert_mode()
{
}
macro visual_mode()
{
}
/**
 * Set current mode
 * Be sure that no key is waiting
 */
macro set_mode(mode)
{
    gMode = mode
}

macro mode_main()
{
    while(gMode != M_ORIG)
    {
        var k
        k =getkey()

        var key
        key = trans_key(k)
        if(key.ch == "")
        {
            continue
        }
    
        if(gMode == M_NORMAL)
        {
            normal_mode(key)
        }
        else if(gMode == M_INSERT)
        {
            insert_mode(key)
        }
        else if(gMode == M_VISUAL)
        {
            visual_mode(key)
        }
    }
    
}

