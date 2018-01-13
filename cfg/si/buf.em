
/* remove spaces and tabs off the string header and tail */
macro e_JumpBuf()
{
    idxFound = 0
    foundCnt = 0
    bufFound = hNil
    cbuf = BufListCount()
    target = ""
    
    while(true)
    {
        if(strlen(target) > 10)
        {
            return
        }
        foundFileName = ""
        if(bufFound != hNil)
        {
            foundFileName = GetBufName(bufFound)
            foundFileName = __GetFileName(foundFileName)
        }
        if(target == "")
        {
            StartMsg("Type to search")
        }
        else if(foundFileName == "")
        {
            StartMsg("Srch @target@")
        }
        else
        {
            StartMsg("Srch @target@ -> @foundFileName@")
        }
        key = getkey()
        EndMsg()

        if(key == 9)//tab
        {
            if(foundCnt == 0)
            {
                continue
            }

            idxFound = idxFound + 1
            if(idxFound >= foundCnt)
            {
                idxFound = 0
            }
        }

        else if(key == 13)//enter
        {
            if(bufFound != hNil)
            {
                SetCurrentBuf(bufFound)
                return
            }
            continue
        }
        else
        {
            if(key >= 97 && key <= 122)//a-z
            {
                key = key -97 + 65
            }

            if(key < 65 || key > 90)
            {
                continue
            }
            
            ch = CharFromAscii(key)
            target = "@target@@ch@"
        }
        //msg target
        
        ibuf = 1
        bufFound = hNil
        foundCnt = 0
        while (ibuf < cbuf)
        {
            hbuf = BufListItem(ibuf)
            fname = GetBufName(hbuf)
            fname = toupper(fname)
            len = strlen(fname)

            idx = len-1;

            c = fname[idx]
            //msg "fname=@fname@ c=@c@"
            if(c != "C" && c != "H")
            {
                ibuf = ibuf + 1
                continue
            }
            
            while(idx > 0)
            {
                c = fname[idx]
                //msg "fname=@fname@ idx=@idx@ fname[@idx@]=@c@"
                if(c == "\\")
                {
                    break
                }
                idx = idx - 1
            }
            //msg "idx=@idx@"
            if(idx > 0)
            {
                name = strmid(fname, idx+1, len)
                msg "name=@name@, target=@target@"
                if(__StartWith(name, target))
                {
                    //msg "foundCnt @foundCnt@ idxFound @idxFound@ name @name@"
                    if(foundCnt == idxFound)
                    {
                        bufFound = hbuf
                    }
                    foundCnt = foundCnt + 1
                }
            }
            
            
            ibuf = ibuf + 1
        }

        //msg "buf cnt @foundCnt@, hbuf @bufFound@"
        if(foundCnt == 0)
        {
            return
        }

        if(foundCnt == 1)
        {
            SetCurrentBuf(hbuf)
            return
        }
    }

}

