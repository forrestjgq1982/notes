写了个程序在64位机器上演示各个基本类型长度：

<!--more-->

```c
#include <stdio.h>

int main(void)
{
    printf("char: %d\n", sizeof(char));
        printf("int: %d\n", sizeof(int));
            printf("short: %d\n", sizeof(short));
                printf("long: %d\n", sizeof(long));
                    printf("long long: %d\n", sizeof(long long));
                        printf("float: %d\n", sizeof(float));
                            printf("double: %d\n", sizeof(double));
                                printf("void *: %d\n", sizeof(void *));
                                    return 0;

}
```
用gcc 64位编译：
>gcc t.c -o t

然后执行，得到结果：

>char: 1
int: 4
short: 2
long: 8
long long: 8
float: 4
double: 8
void *: 8

用gcc 32位模式编译：
>gcc -m32 t.c -o t

然后执行，得到结果：
>char: 1
int: 4
short: 2
long: 4
long long: 8
float: 4
double: 8
void *: 4

所以：
- int在gcc里面总是4字节
- long才可以表达指针长度
- long long总是8字节，即使在32位模式下
