This blog shows interfaces abstract from << linux system programming >>.

<!--more-->

[toc]

# Error process
***errno*** is a lvalue, and valid only immediately after return of function. Consequently, an error *-1* is returned to indicate an error, and caller shall get ***errno*** to see which error it is.
```c
extern int errno;
```
## errno define
errno is defined with several errors. About 30 errors are supported by kernel depending on the arch. Each error is associated with a number and a literal string for human being reading. Usual errors are:

Error   | String
-----   | -----
E2BIG   | Argument list too long
EACCES  | Permission denied
EAGAIN  | Try again
EBADF   | Bad file number
EBUSY   | Device or resource busy
ECHILD  | No child processes
EDOM    | Math argument outside of domain of function
EEXIST  | File already exists
EFAULT  | Bad address
EFBIG   | File too large
EINTR   | System call was interrupted
EINVAL  | Invalid argument
EIO     | I/O error
EISDIR  | Is a directory
EMFILE  | Too many open files
EMLINK  | Too many links
ENFILE  | File table overflow
ENODEV  | No such device
ENOENT  | No such file or directory
ENOEXEC | Exec format error
ENOMEM  | Out of memory
ENOSPC  | No space left on device
ENOTDIR | Not a directory
ENOTTY  | Inappropriate I/O control operation
ENXIO   | No such device or address
EPERM   | Operation not permitted
EPIPE   | Broken pipe
ERANGE  | Result too large
EROFS   | Read-only filesystem
ESPIPE  | Invalid seek
ESRCH   | No such process
ETXTBSY | Text file busy
EXDEV   | Improper link

## errno utilities

### perror()
print errno with string representation to *stderr* by prefixed string *str*.

```c
#include <stdio.h>
void perror (const char *str);
```

example:
```c
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>


int main(void)
{
    /**
         * ./wtf is a fake file
              */
                  int fd = open("./wtf", O_APPEND);
                      if(fd == -1)
                            perror("open");
                                else
                                      close(fd);

                                          return 0;

}

```
output:

>open: No such file or directory

