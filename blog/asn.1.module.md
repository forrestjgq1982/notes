```bison
ModuleDefinition ::=
    ModuleIdentifier
    DEFINITIONS
    EncodingReferenceDefault
    TagDefault
    ExtensionDefault
    "::="
    BEGIN
    ModuleBody
    EncodingControlSections
    END
```
<!--more-->

# ModuleIdentifier
asn.1以模块(Module)以入口来进行语法解析，模块名称必须独一无二，ModuleIdentifier是一个ID，而DefinitiveIdentification是该ID的一个可选补充，定义了OID路径。
```bison
ModuleIdentifier ::=
    modulereference
    DefinitiveIdentification

```
此处DefinitiveIdentification定义了模块的名称modulereference和一个可选的模块OID，OID的定义有多种形式，但是一般来说可以将其看成是一个目录树的路径。  
```bison
DefinitiveIdentification ::=
        DefinitiveOID
    |   DefinitiveOIDandIRI
    |   empty
```
一种形式是将每个路径的节点按序给出，如DefinitiveOID, 其用大括号囊括了按序排列的OID路径的组件，组件可以是一个X660定义的名称，如iso，也可以是一个标准OID数值，例如1，又或者两者都给出，例如iso(1)。  
```bison
DefinitiveOID ::=
    "{" DefinitiveObjIdComponentList "}"

DefinitiveObjIdComponentList ::=
        DefinitiveObjIdComponent
    |   DefinitiveObjIdComponent DefinitiveObjIdComponentList

DefinitiveObjIdComponent ::=
        NameForm
    |   DefinitiveNumberForm
    |   DefinitiveNameAndNumberForm

DefinitiveNumberForm ::= 
    number
DefinitiveNameAndNumberForm ::= 
    identifier 
    "(" DefinitiveNumberForm ")"

```
这里的NameFrom是identifier，后文中有描述。  
另一种是在DefinitiveOID后再附加一个IRIValue， 
```bison
DefinitiveIdentification ::=
        DefinitiveOID
    |   DefinitiveOIDandIRI
    |   empty

DefinitiveOID ::=
    "{" DefinitiveObjIdComponentList "}"

DefinitiveOIDandIRI ::= 
    DefinitiveOID IRIValue
```
IRIValue后文有叙述，其事实上是一个以/分割的路径。
# EncodingReferenceDefault
```bison
EncodingReferenceDefault ::=
        encodingreference INSTRUCTIONS
    |   empty
```
EncodingReferenceDefault是编码参考，其值可为TAG/PER/XER

# TagDefault
```bison
TagDefault ::=
        EXPLICIT TAGS
    |   IMPLICIT TAGS
    |   AUTOMATIC TAGS
    |   empty
```
TAGS定义，如为空，则默认为EXPLICIT TAGS。其只影响在模块内部定义的类型，不影响import进来的类型的解释。

>X680 13.3
>
>When the AUTOMATIC TAGS alternative of "TagDefault" is selected, automatic tagging is said to be selected for the module, otherwise it is said to be not selected. Automatic tagging is a syntactical transformation which is applied (with additional conditions) to the "ComponentTypeLists" and "AlternativeTypeLists" productions occurring within the definition of the module. This transformation is formally specified by 25.8 to 25.10, 27.3 and 29.2 to 29.5 regarding the notations for sequence types, set types and choice types, respectively.

# ExtensionDefault
```bison
ExtensionDefault ::=
        EXTENSIBILITY IMPLIED
    |   empty
```
当ExtensionDefault非空时（EXTENSIBILITY IMPLIED)，则表示所有该module内部定义的类型都默认支持扩展，就好像每个type都在定义的末尾增加了一个扩展符"..."。

ExtensionDefault仅对类型声明有效，对目标集(Object Set)和子类型的约束无效。

# ModuleBody
```bison
ModuleBody ::=
        Exports Imports AssignmentList
    |   empty
```
## ParameterizedAssignment
TODO:
ParameterizedAssignment由X.683定义
```bison
ParameterizedAssignment ::=
    ParameterizedTypeAssignment
    |   ParameterizedValueAssignment
    |   ParameterizedValueSetTypeAssignment
    |   ParameterizedObjectClassAssignment
    |   ParameterizedObjectAssignment
    |   ParameterizedObjectSetAssignment
```
### ParameterList

```bison
ParameterList ::= 
    "{" Parameter "," + "}"

Parameter ::= 
        ParamGovernor ":" DummyReference 
    |   DummyReference

ParamGovernor ::= 
        Governor 
    |   DummyGovernor

Governor ::= 
        Type 
    |   DefinedObjectClass

DummyGovernor ::= 
    DummyReference

DummyReference ::= 
    Reference
```
### ParameterizedTypeAssignment
```bison
ParameterizedTypeAssignment ::=
    typereference
    ParameterList
    "::="
    Type
```
### ParameterizedValueAssignment
```bison
ParameterizedValueAssignment ::=
    valuereference
    ParameterList
    Type
    "::="
    Value
```
### ParameterizedValueSetTypeAssignment
```bison
ParameterizedValueSetTypeAssignment ::=
    typereference
    ParameterList
    Type
    "::="
    ValueSet
```
### ParameterizedObjectClassAssignment
```bison
ParameterizedObjectClassAssignment ::=
    objectclassreference
    ParameterList
    "::="
    ObjectClass
```
### ParameterizedObjectAssignment
```bison
ParameterizedObjectAssignment ::=
    objectreference
    ParameterList
    DefinedObjectClass
    "::="
    Object
```
### ParameterizedObjectSetAssignment
```bison
ParameterizedObjectSetAssignment ::=
    objectsetreference
    ParameterList
    DefinedObjectClass
    "::="
    ObjectSet
```
### SymbolList
```bison
SymbolList ::=
        Symbol
    |   SymbolList "," Symbol

Symbol ::=
        Reference
    |   ParameterizedReference

Reference ::=
        typereference
    |   valuereference
    |   objectclassreference
    |   objectreference
    |   objectsetreference

```
***ParameterizedReference***参见X683。

***Symbol***列表。
## Exports
```bison
Exports ::=
        EXPORTS SymbolsExported ";"
    |   EXPORTS ALL ";"
    |   empty
SymbolsExported ::=
        SymbolList
    |   empty
```
***SymbolsExported***中的***Symbol***要么被该module定义，要么在***SymbolsImported***中。模块的***Symbol***只有被Export后才可以被其他模块Import。如果如果***SymbolList***为空，则***SymbolsExported***可以为***empty***；也就是说下面的语法是正确的：
    
    EXPORTS ;
而如果***Exports***选择了***empty***或者***EXPORTS ALL ;***则所有该模块定义的***Symbol***都被输出，并且其Import的***Symbol***也被输出。
## Imports
```bison
Imports ::=
        IMPORTS SymbolsImported ";"
    |   empty
    
SymbolsImported ::=
        SymbolsFromModuleList
    |   empty

SymbolsFromModuleList ::=
        SymbolsFromModule
    |   SymbolsFromModuleList SymbolsFromModule

SymbolsFromModule ::=
    SymbolList FROM GlobalModuleReference

GlobalModuleReference ::=
    modulereference AssignedIdentifier

AssignedIdentifier ::=
        ObjectIdentifierValue
    |   DefinedValue
    |   empty
```
## AssignmentList
```bison

```

