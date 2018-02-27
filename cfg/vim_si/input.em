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
    global k_pad_div
    global k_pad_mult
    global k_pad_sub
    global k_pad_add
    global k_bksp
    global k_tab
    global k_enter
    global k_esc

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
    
    k_pad_div = 16431
    k_pad_mult = 16426
    k_pad_sub = 16429
    k_pad_add = 16427
    
    k_bksp = 8
    k_tab = 9
    k_enter = 13
    k_esc = 27


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

    if(ikey > 800 && ikey < 900)
    {
        ikey = ikey - 800
        /*
            Key code defined here is the symbols with
            shift pressed
            
            key  |  char
            ---- | ------
            801  |  !
            802  |  "
            803  |  #
            804  |  $
            805  |  %
            806  |  &
            808  |  (
            809  |  )
            810  |  *
            811  |  +
            826  |  :
            828  |  <
            830  |  >
            831  |  ?
            832  |  @
            862  |  ^
            863  |  _
            891  |  {
            892  |  |
            893  |  }
            894  |  ~
        */
        if(ikey > 0 && ikey < 12)
        {
            str = "!\"#$%& ()*+"
            idx = ikey - 1;
            key.ch = str[idx]
            
        }
        else if(ikey >= 26 && ikey <= 32)
        {
            str = ": < >?\@"
            idx = ikey - 26;
            key.ch = str[idx]
        }
        else if(ikey >= 91 && ikey <= 94)
        {
            str = "{|}~"
            idx = ikey - 91;
            key.ch = str[idx]
        }
        else if(ikey == 62)
        {
            key.ch = "^"
        }
        else if(ikey = 63)
        {
            key.ch = "_"
        }
        else
        {
            key.ch = " "
        }

        if(key.ch != " ")
        {
            key.ascii = AsciiFromChar(key.ch)
        }
        else
        {
            /* invalid key code */
            key.ch = ""
            key.ascii = 0
        }
    }
    else
    {
        /**
         * Judge if Ctrl/Shift/Alt is pressed
         */
        var base
        base = 0
        if(ikey < 4000)
        {
            base = 1
        }
        else if(ikey < 9000)
        {
            base = 4208
        }
        else if(ikey < 30000)
        {
            base = 16426
        }
        else
        {
            base = 32800
        }
        
        if(ikey - g_alt >= base)
        {
            ikey = ikey - g_alt
            key.fAlt = True
        }

        if(ikey - g_ctrl >= base)
        {
            ikey = ikey - g_ctrl
            key.fCtrl = True
        }

        if(ikey - g_shift >= base)
        {
            ikey = ikey - g_shift
            key.fShift = True
        }

        /**
         * when ctrl is pressed, combined key with A-Z will turn to a-z
         * and without ctrl, like alt+shift, a-z is used, so we turn
         * all lower case to upper
         */
        if(key.fCtrl && ikey >= 97 && ikey < 97+26)
        {
            ikey = ikey - 32
        }

        key.ch = ""
        
        if(ikey < 32)
        {
            if(ikey == k_bksp)
            {
                key.ch = "BKSP"
            }
            else if(ikey == k_enter)
            {
                key.ch = "ENTER"
            }
            else if(ikey == k_tab)
            {
                key.ch = "TAB"
            }
            else if(ikey == k_esc)
            {
                key.ch = "ESC"
            }
        }
        else if(ikey < 128)
        {
            key.ch = CharFromAscii(ikey)
        }
        else if(ikey > 32800 && ikey < 32820)
        {
            if(ikey == k_ins)
            {
                key.ch = "INS"
            }
            else if(ikey == k_del)
            {
                key.ch = "DEL"
            }
            else if(ikey == k_pgdown)
            {
                key.ch = "PGDN"
            }
            else if(ikey == k_pgup)
            {
                key.ch = "PGUP"
            }
            else if(ikey == k_home)
            {
                key.ch = "HOME"
            }
            else if(ikey == k_end)
            {
                key.ch = "END"
            }
            else if(ikey == k_left)
            {
                key.ch = "LEFT"
            }
            else if(ikey == k_right)
            {
                key.ch = "RIGHT"
            }
            else if(ikey == k_down)
            {
                key.ch = "DOWN"
            }
            else if(ikey == k_up)
            {
                key.ch = "UP"
            }
        }
        else if(ikey >= 16420 && ikey <= 16431)
        {
            if(ikey == k_pad_add)
            {
                key.ch = "ADD"
            }
            else if(ikey == k_pad_sub)
            {
                key.ch = "SUB"
            }
            else if(ikey == k_pad_mult)
            {
                key.ch = "MULT"
            }
            else if(ikey == k_pad_div)
            {
                key.ch = "DIV"
            }
        }
        else if(ikey >= 4208 && ikey <= 4219)
        {
            idx = ikey - 4208 + 1
            key.ch = "F@idx@"
        }

        if(key.ch != "")
        {
            key.ascii = ikey
        }
        else
        {   key.ascii = 0
        }
    }

    return key
}



