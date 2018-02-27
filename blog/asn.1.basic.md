# 字符集
- A-Z
- a-z
- 0-9
- [],(),{},<>, =
- !, @,^, &, *
- ”, ’, :, ;
- ,, ., /, |
- 0xA843(–), -, _
- 空白字符：0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x32(space)
- 换行字符：0x0A, 0x0B, 0x0C, 0x0D

<!--more-->

注意：

- 大小写敏感
- 0xA843在名称中出现时，应与-视为等同作用（OSS不支持0xA843)
- 换行符视为空白字符处理

# 词法单元
除了comment/bstring/hstring/cstring外，词法单元中不应包括空白字符

行长不受限

下面这段不知道怎么理解：

    12.1.4 Lexical items may be separated by one or more occurrences of white-space (see 12.1.6) or comments (see 12.6) except when the non-spacing indicator "&" (see 5.4) is used. Within an "XMLTypedValue" production (see 16.2), white-space may appear between lexical items, but the "comment" lexical item shall not be present.

    NOTE – This is to avoid ambiguity resulting from the presence of adjacent hyphens or asterisk and solidus within an "xmlcstring" lexical item. Such characters never indicate the start of a "comment" lexical item when they appear within an "XMLTypedValue" production.

词法单元名称约束如下：

- 一个类型参考(typereference)词法单元由任意字幕、数字、横线组成，其首字符必须为大写字母，横线不得为最后一个字符且不能出现两个连续横线。
- 标识符（ID, identifier）与类型参考词法单元规则一致，除了其首字母必须为小写
- 值参考(valuereference)词法单元等同于标识符，事实上在处理时其应被视为一个ID
- 模块参考(modulereference)规则等同于类型参考
- 编码参考(encodingreference)规则等同于类型参考，但是不允许有小写字母，当前仅支持TAG, XER, PER三种


注释被视为一个独立的词法单元，其有三种形式：

- 单行嵌入注释：在同一行内，由’--’开始，到’--’结束
- 单行注释：由’--’开始，在行内后方没有再出现’--’，则从’--’至行尾均为注释
- 多行注释：由’/\*’ 开始，到’\*/’结束

注释的内部字符不受ASN.1字符集的控制，任何字符均可被接受。

单行注释’--’内部的多行注释’/\*’或’\*/’将会被视为一般的注释内容，同样地，多行注释内部的’--’也被视为一般注释内容。

多行注释是嵌套的，也就是说，一个注释体内部的’/\*’和’\*/’必须成对出现。例如下方是一个合法的多层注释：

    /* this type is removed
    BCCH-DL-SCH-MessageType ::= CHOICE {
        /** asdfasdf */
       c1             CHOICE {
         systemInformation            SystemInformation,
         systemInformationBlockType1        SystemInformationBlockType1
       },
       messageClassExtension SEQUENCE {}
    }
    */
    


# 操作符
赋值Assignment ::=
范围Range ..
省略Ellipsis ...
左/右版本括号[[和]]
XML结束tag的开始 </
XML单tag结束 />

# 关键字
XML关键字

- true：XML布尔真
- true或1：XML扩展布尔真
- false：XML布尔假
- false或0：XML扩展布尔假
- NaN：XML real not-a-number
- INF: XML real infinity

XML类型名(xmlasn1typename)

ASN.1 type production name      | Characters in xmlasn1typename
------------------------------- | ----------------------------
BitStringType                   | BIT_STRING
BooleanType                     | BOOLEAN
ChoiceType                      | CHOICE
DateType                        | DATE
DateTimeType                    | DATE_TIME
DurationType                    | DURATION
EmbeddedPDVType                 | SEQUENCE
EnumeratedType                  | ENUMERATED
ExternalType                    | SEQUENCE
InstanceOfType                  | SEQUENCE
IntegerType                     | INTEGER
IRIType                         | OID_IRI
NullType                        | NULL
ObjectClassFieldType            | See Rec. ITU-T X.681  ISO/IEC 8824-2, 14.10 and 14.11
ObjectIdentifierType            | OBJECT_IDENTIFIER
OctetStringType                 | OCTET_STRING
PrefixedType                    | See 12.36.5
RealType                        | REAL
RelativeIRIType                 | RELATIVE_OID_IRI
RelativeOIDType                 | RELATIVE_OID
RestrictedCharacterStringType   | The type name (e.g. IA5String)
SequenceType                    | SEQUENCE
SequenceOfType                  | SEQUENCE_OF
SetType                         | SET
SetOfType                       | SET_OF
TimeType                        | TIME
TimeOfDayType                   | TIME_OF_DAY
UnrestrictedCharacterStringType | SEQUENCE


保留字如下

 keywords       | keywords         | keywords         | keywords
 -------------- | ---------------- | ---------------- | -------------
ABSENT          | ENCODED          | INTERSECTION     | SEQUENCE
ABSTRACT-SYNTAX | ENCODING-CONTROL | ISO646String     | SET
ALL             | END              | MAX              | SETTINGS
APPLICATION     | ENUMERATED       | MIN              | SIZE
AUTOMATIC       | EXCEPT           | MINUS-INFINITY   | STRING
BEGIN           | EXPLICIT         | NOT-A-NUMBER     | SYNTAX
BIT             | EXPORTS          | NULL             | T61String
BMPString       | EXTENSIBILITY    | NumericString    | TAGS
BOOLEAN         | EXTERNAL         | OBJECT           | TeletexString
BY              | FALSE            | ObjectDescriptor | TIME
CHARACTER       | FROM             | OCTET            | TIME-OF-DAY
CHOICE          | GeneralizedTime  | OF               | TRUE
CLASS           | GeneralString    | OID-IRI          | TYPE-IDENTIFIER
COMPONENT       | GraphicString    | OPTIONAL         | UNION
COMPONENTS      | IA5String        | PATTERN          | UNIQUE
CONSTRAINED     | IDENTIFIER       | PDV              | UNIVERSAL
CONTAINING      | IMPLICIT         | PLUS-INFINITY    | UniversalString
DATE            | IMPLIED          | PRESENT          | UTCTime
DATE-TIME       | IMPORTS          | PrintableString  | UTF8String
DEFAULT         | INCLUDES         | PRIVATE          | VideotexString
DEFINITIONS     | INSTANCE         | REAL             | VisibleString
DURATION        | INSTRUCTIONS     | RELATIVE-OID     | WITH
EMBEDDED        | INTEGER          | RELATIVE-OID-IRI
# 数值定义
十进制整数(number)由数字组成，除非该整数只有一个数字0，否则0不可作为第一个字符。

实数(realnumber)由整数部分、可选的’.’、可选的小数部分，以及可选的指数部分。整数部分和小数部分均由一个或多个数字组成，但是规范没有明确说整数部分必须符合十进制整数的定义（也就是说，00也是可以接受的）。指数部分由e/E开始，然后是可选的符号’+’或’-’，然后是一个十进制整数（00是不可接受的）。

实数的一些示例如下：

    1.
    0.0002
    123.321e0
    321.E+32
    12E-3

二进制数(bstring)由单引号开始，然后是一个或多个0/1或空白字符的组合，最后是’B，空白字符在定义中没有任何含义，需被忽略，范例：

    ’010’B
    ’0 1 11 0 1’B

XML二进制数(xmlbstring)由任意个（包括0个）0、1、空白字符组成，空白字符无意义。xmlbstring同时也是合法的xmlhstring和xmlcstring，分析过程中需要根据上下文判断其类型。

十六进制数(hstring)由单引号开始，然后是大写的字母A-Z/数字或空白字符，最后以’H结尾。示例：

    ’A BC D’H
    ’1 234 5A B C ’H

XML十六进制数(xmlhstring)由任意个(包括0个)a-f，A-F，0-9,空白字符组成。

整数Unicode标签(integerUnicodeLabel)同number

非整数Unicode标签(non-integerUnicodeLabel)任何满足X660 7.2.5的ISO10646字符序列。

# 字符串
字符串(cstring)以”开始，以”结束，两者之间包括任意个（包括0个）书写字符（graphic symbol)或空白字符，如内部包括”，则需要以两个连续的”来表示。字符串可以跨越多行，此时换行符前方的空白字符和后方的空白字符，包括换行符本身，都需要被忽略。

    ”中国 美国     一个鸟样”
    ”A BCD E   F GHI
          IJ K””XYZ”
    的表达值为:
        A BCD E   F GHIIJ K”XYZ

XML字符串(xmlcstring)由0个或多个一下ISO10646字符组成：

- 0x09(\t)
- 0x0A(\n)
- 0x0D(\r)
- 0x20 - 0xD7FF
- 0xE000 - 0xFFFD
- 0x10000 - 0X10ffff

由于&是xml的转义字符，<和>是xml的关键字，所以需要转义为”&amp;”, “&lt;”, “&gt;”

由于xmlcstring中不可以出现大多数控制字符，所以，对这些控制字符也需要进行转义如下：

ISO/IEC 10646 character code    | "xmlcstring" representation
:-----------------------------: | :-----------------------------:
0 (0 hex)                       | <nul/\>
1 (1 hex)                       | <soh/\>
2 (2 hex)                       | <stx/\>
3 (3 hex)                       | <etx/\>
4 (4 hex)                       | <eot/\>
5 (5 hex)                       | <enq/\>
6 (6 hex)                       | <ack/\>
7 (7 hex)                       | <bel/\>
8 (8 hex)                       | <bs/\>
11 (B hex)                      | <vt/\>
12 (C hex)                      | <ff/\>
14 (E hex)                      | <so/\>
15 (F hex)                      | <si/\>
16 (10 hex)                     | <dle/\>
17 (11 hex)                     | <dc1/\>
18 (12 hex)                     | <dc2/\>
19 (13 hex)                     | <dc3/\>
20 (14 hex)                     | <dc4/\>
21 (15 hex)                     | <nak/\>
22 (16 hex)                     | <syn/\>
23 (17 hex)                     | <etb/\>
24 (18 hex)                     | <can/\>
25 (19 hex)                     | <em/\>
26 (1A hex)                     | <sub/\>
27 (1B hex)                     | <esc/\>
28 (1C hex)                     | <is4/\>
29 (1D hex)                     | <is3/\>
30 (1E hex)                     | <is2/\>
31 (1F hex)                     | <is1/\>

***通用转义***: 除了上述的转义定义外，任何字符均可被转义，方法是采用”&#m;”或”&#xn;”， 此处m是十进制数，n是十六进制数，m和n表示的是ISO10646的字符值。

简单字符串(simplestring)是cstring的简化, 其由双引号扩起来的一个或多个（非0个）值为32 - 126之间的字符（可见字符）组成，且中间不能出现双引号本身（0x22)，简单字符串可跨越多行，且换行符前后的空白和换行符本身需要被忽略。

简单字符串只在时间类型的子类型中使用。

时间值字符串(tstring)是由双引号包括的非0个以下字符组成：

    0 1 2 3 4 5 6 7 8 9 + - : . , / C D H M R P S T W Y Z

XML时间字符串(xmltstring)与tstring类似，只不过不用双引号包括

属性与设置名(psname)词法单元词法规则同类型参考(typereference)，仅用于当简单字符串用于时间类型时，表达其内容。


