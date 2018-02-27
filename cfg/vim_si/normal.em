macro normal_cmd_def_init()
{   
    /**
     * Abort current command
     */
    global ncAbort // C-C

    /**
     * Motion
     */
    global ncBeginOfLine // 0
    global ncNonBlankBeginOfLine // ^
    global ncEndOfLine // $
    global ncNextWord // w
    global ncNextWORD // W
    global ncEndOfWord // b
    global ncEndOfWord // B

    /**
     * goto start with g, and followed by <where>
     * multi-char cmd, followed by:
     * _: last non-blank of line end
     * g: line
     */
    global ncGoto // g
    
    global ncLastLine //G
    /**
     * beginning of current and next sentence
     */
    global ncBeginOfSent    // (
    global ncNextSent       // )
    
    global ncBeginOfPara    // {
    global ncNextPara       // }

    /**
     * Backward/forward search for a { or } in first column
     */
    global ncBwdFirstBrace  //  [([/])
    global ncFwdFirstBrace  //  ]([/])

    /**
     * multi-char cmd to goto line of a mark(a-z), 
     * or '' to goto last gg jump or mark
     */
    global ncLineMark // '<mark>
    /**
     * multi-char cmd to goto char of a mark(a-z)
     * or `` to goto last gg jump or mark
     */
    global ncCharMark // `<mark>
    /**
     * Set mark(a-z)
     */
    global ncMark //m<mark>

    /**
     * forward or backward first occurrence
     */
    global ncFwdFirst //f<ch>
    global ncBwdFirst  //F<ch>

    /**
     * Before forward or backward first occurrence
     */
    global ncToFwdFirst //t<ch>
    global ncToBwdFirst //T<ch>

    /**
     * Repeat f/F/t/T (in opposite direction)
     */
    global ncRepeatFirst    // ;
    global ncRepeatOpFirst  // ,
    /**
     * Line down/up on first non-blank char
     */
    global ncLineUpNonBlankChar     // -
    global ncLineDownNonBlankChar   // +
    
    ncAbort = // C-C
    ncBeginOfLine = // 0
    ncNonBlankBeginOfLine = // ^
    ncEndOfLine = // $
    ncNextWord = // w
    ncNextWORD = // W
    ncEndOfWord = // b
    ncEndOfWord = // B
    ncGoto = // g
    ncLastLine = //G
    ncBeginOfSent =    // (
    ncNextSent =       // )
    ncBeginOfPara =    // {
    ncNextPara =       // }
    ncBwdFirstBrace =  //  [([/])
    ncFwdFirstBrace =  //  ]([/])
    ncLineMark = // '<mark>
    ncCharMark = // `<mark>
    ncMark = //m<mark>
    ncFwdFirst = //f<ch>
    ncBwdFirst =  //F<ch>
    ncToFwdFirst = //t<ch>
    ncToBwdFirst = //T<ch>
    ncRepeatFirst =    // ;
    ncRepeatOpFirst =  // ,
    ncLineUpNonBlankChar =     // -
    ncLineDownNonBlankChar =   // +

}
/**
 * normal mode init
 */
macro normal_init()
{
    /**
     * Cmd repeat time
     */
    global nParam
    nParam=1

    global nStarted
    global nOp

    /**
     * Cmd sequence like 
     */
    global nSeq

    global nWaiting

}
macro normal_mode()
{
    
}
