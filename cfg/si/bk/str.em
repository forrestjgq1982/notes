
/**
 * Judge if from str[pos] to str[end] are all white spaces 
 */
macro _AllWSAfter(str, pos)
{
    var len
    len = strlen(str)

    if(pos == len)
        return False
        
    while(pos < len)
    {
        if(!_IsWS(str[pos]))
        {
            return False
        }
        pos = pos + 1
    }

    return True
}

/** 
 * Judge if from str[0] to str[pos-1] are all white spaces 
 */
macro _AllWSBefore(str, pos)
{
    var idx
    if(pos < 1)
        return False
        
    idx = 0
    while(idx < pos)
    {
        if(!_IsWS(str[idx]))
        {
            return False
        }
        idx = idx + 1
    }

    return True
}

/**
 * Clear continours spaces/tabs into one single space for a string 
 */
macro _ClearInnerSpace(str)
{
    var first
    var last
    var len
    var ret 
    var subs

    ret = ""
    first = -1
    last = 0
    len = strlen(str)

    while(last < len)
    {
        if(first == -1)
        {
            if(!_IsWS(str[last]))
            {
                first = last
            }
        }
        else
        {
            if(_IsWS(str[last]))
            {
                //msg("@str@, @first@, @last@")
                subs = strmid(str, first, last)
                if(ret == "")
                {
                    ret = "@subs@"
                }
                else if(_StartWithOneOf(subs,"{[("))
                {
                    ret = "@ret@@subs@"
                }
                else
                {
                    ret = "@ret@ @subs@"
                }
                //msg("subs=@subs@, ret=@ret@")
                first = -1
            }
        }

        last = last + 1
    }

    if(first != -1 && !_IsWS(str[last]))
    {
        subs = strmid(str, first, len)
        if(ret == "")
        {
            ret = "@subs@"
        }
        else if(_StartWithOneOf(subs,"{[("))
        {
            ret = "@ret@@subs@"
        }
        else
        {
            ret = "@ret@ @subs@"
        }
    }

    return ret
}

/**
 * return True if str1 ends with str2 
 */
macro _EndWith(str1, str2)
{
    var len1
    var len2
    var s
    
    len1 = strlen(str1)
    len2 = strlen(str2)
    if(len1 < len2)
        return False
        
    s = strmid(str1, len1-len2, len1)
    //msg("endwith @s@, @str1@, @str2@")
    if(s == str2)
    {
        return True
    }
    else
    {
        return False
    }
}
/**
 * return True if str1 starts with str2 
 */
macro _StartWith(str1, str2)
{
    var len1
    var len2
    var s
    
    len2 = strlen(str2)
    len1 = strlen(str1)
    if(len1 < len2)
        return False
        
    s = strmid(str1, 0, len2)
    if(s == str2)
    {
        return True
    }
    else
    {
        return False
    }
}
/** 
 * Check if first char of str is inside chStr 
 */
macro _StartWithOneOf(str, chStr)
{
    if(strlen(str) == 0)
        return False
        
    var chStart
    chStart = str[0]
    
    var len
    len = strlen(chStr)

    var pos
    pos = 0
    while(pos < len)
    {
        if(chStr[pos] == chStart)
            return True

        pos = pos + 1
    }

    return False
}
/** 
 * Find position of ch inside str, -1 if not found
 */
macro _StrFind(str, ch)
{
    var len
    len = strlen(str)

    var pos
    pos = 0
    while(pos < len)
    {
        if(str[pos] == ch)
        {
            return pos
        }
    }

    return -1
}
/**
 * Check if last char of str is inside chStr
 */
macro _EndWithOneOf(str, chStr)
{
    var len
    len = strlen(str)
    if(len == 0)
        return False
        
    var chEnd
    chEnd = str[len - 1]
    
    len = strlen(chStr)

    var pos
    pos = 0
    while(pos < len)
    {
        if(chStr[pos] == chEnd)
            return True

        pos = pos + 1
    }

    return False
}
/**
 * remove spaces and tabs off the string header and tail 
 */
macro _Trim(szStr)
{
    var len
    len = strlen(szStr)
    if(len == 0)
        return szStr
        
    first = 0;
    last = len-1;
    while(_IsWS(szStr[first]))
    {
        first=first+1;
    }
    while(last > first)
    {
        if(_IsWS(szStr[last]))
            last=last-1;
        else
            break;
    }

    if(first > last)
    {
        return ""
    }
    else
    {
        return strmid(szStr, first, last+1)
    }
}
/** 
 * trim str first, and if str starts with prefix , remove that prefix
 */
macro _RemovePrefix(str, prefix)
{
    str = _Trim(str)
    if(_StartWith(str, prefix))
    {
        return strmid(str, strlen(prefix), strlen(str))
    }
    return str
}
/* Get the spaces/tabs in the header of the string */
macro _GetEmptyPrefix(szStr)
{
    var len
    var first
    len = strlen(szStr)
    first = 0;
    while(first < len)
    {
        if(!_IsWS(szStr[first]))
        {
            break;
        }
        first=first+1;
    }
    if(first > 0)
        return strmid(szStr, 0, first)

    return ""
}

/* Check if szPart is the start of szFull */
macro _CompareKeywords(szPart, szFull)
{
    var lenPart
    var lenFull
    var szMid
    
    lenPart = strlen(szPart)
    lenFull = strlen(szFull)
    if(lenPart > lenFull)
    {
        return False
    }

    szMid = strmid(szFull, 0, lenPart)
    if(szPart == szMid)
    {
        return True
    }

    return False;
}
/* Check if szPart is the end of szFull */
macro _CompareKeywordsReverse(szPart, szFull)
{
    var lenPart
    var lenFull
    var szMid
    
    lenPart = strlen(szPart)
    lenFull = strlen(szFull)
    if(lenPart < lenFull)
    {
        return False
    }

    szMid = strmid(szPart, lenPart-lenFull, lenPart)
    if(szFull == szMid)
    {
        return True
    }
    return False;
}

/* Check if char is a space like char */
macro _IsWS(ch)
{
    if(ch != " " && ch != "	")
    {
        return False
    }

    return True
}
macro _IsEmptyLine(str)
{
	len = strlen(str)
	i = 0
	
	while(i < len)
	{
		if ( !_IsWs(str[i]))
		{
			return False
		}
    }
    return True
}
