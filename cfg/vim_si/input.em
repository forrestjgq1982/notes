/**
 * Key representation
 * key {
 *      origin
 *      ch
 *      ascii
 *      fSfhit
 *      fCtrl
 *      fAlt
 */
macro keys_init()
{
    global k_a
    global k_left
    global k_right
    global k_up
    global k_down
    global k_pgup
    global k_pgdown
    global k_end
    global k_home
    global k_del
    global k_ins

    k_a = 97
    
    k_left = 32805
    k_up = k_left + 1
    k_right = k_up + 1
    k_down = k_right + 1
    
    k_pgup = 32801
    k_pgdown = k_pgup + 1
    k_end = k_pgdown + 1
    k_home = k_end + 1
    
    k_del = 32814
    k_ins = 32813

    global g_ctrl
    global g_shift
    global g_alt
    g_ctrl  = 1024
    g_shift = 768
    g_alt   = 2048

    global g_alpha_ctrl
    g_alpha_ctrl = 992
}

macro trans_key(ikey)
{
    var key

    key.origin  = ikey
    key.fShift  = False
    key.fCtrl   = False
    key.fAlt    = False
    
    if(ikey < 128)
    {
        key.ascii = ikey
        key.ch = CharFromAscii(ikey)
    }
    else if(ikey > 4200)
    {
        /* function keys or small pad keys */
        
        if(ikey - g_alt > 4200)
        {
            ikey = ikey - g_alt
            key.fAlt = True
        }

        if(ikey - g_ctrl > 4200)
        {
            ikey = ikey - g_ctrl
            key.fCtrl = True
        }

        if(ikey - g_shift > 4200)
        {
            ikey = ikey - g_shift
            key.fShift = True
        }

        key.ch = ""
        key.ascii = ikey
    }
    else if(ikey > 800 && ikey < 900)
    {
        ikey = ikey - 800
        /*
            801!
            802"
            803#
            804$
            805%
            806&
            808(
            809)
            810*
            811+
            826:
            828<
            830>
            831?
            832@
            862^
            863_
            891{
            892|
            893}
            894~
        */
        if(ikey 
    }
}

