event AppStart()
{
    global gMode
    global M_NORMAL
    global M_INSERT

    M_NORMAL = 1
    M_INSERT = 2

    /* Set mode to normal */
    gMode = M_INSERT

    global gWaitKey
    gWaitKey = 0
}

event DocumentOpen(sFile)
{
    
}

macro normal_mode()
{
}

macro insett_mode()
{
}
/**
 * Set current mode
 * Be sure that no key is waiting
 */
macro set_mode(mode)
{
    if(mode == gMode)
        return
        
    gMode = mode
    if(gMode == M_NORMAL)
        normal_mode()
    else
        insert_mode()
    
    
}
macro switch_mode()
{
    
}

