This is the answer of exercises of ***modern operation system*** chapter 2.

<!--more-->

[toc]



### Ex 2.1
In Fig. 2-2, three process states are shown. In theory, with three states, there could be six transitions, two out of each state. However, only four transitions are shown. Are there any circumstances in which either or both of the missing transitions might occur?

**Answer**:

>If the transition from blocked state to running state occurs, there will be a processor which is unblocked by some event, and the kernel schedules it to run immediately bypassing put it into ready process list. This action will make the implementation of scheduler more complicated. And if there are more processes unblocked for same event, even more complicate consideration will be brought in. So put unblocked process into ready process list will keep kernel scheduler simpler and more efficient.

>Ready process will never be blocked because it will be in ready state if it is not running.

### Ex 2.2
Suppose that you were to design an advanced computer architecture that did process switching in hardware, instead of having interrupts. What information would the CPU need? Describe how the hardware process switching might work.

**Answer**:

>Process switching will sequentially do the following job:
>    1. Save registers, PC, stack pointer and other status of current process into PCB
>    2. Get next process PCB
>    3. Restore registers, PC, stack pointer and other status of next process
>    4. Run from PC
>So CPU shall at least get current running and next process PCBs and structure of PCB so the info could be fetched and restored.
>When process switch begins, CPU shall fetch current PCB, save process status, and then fetch next process and restore status.

### Ex 2.3
On all current computers, at least part of the interrupt handlers are written in assembly language. Why?

**Answer**:

>Some instruction can not be represented by modern language like C, and sometimes ASM is more efficient.

### Ex 2.4
When an interrupt or a system call transfers control to the operating system, a kernel stack area separate from the stack of the interrupted process is generally used. Why?

**Answer**:
>1. stack of process is in user space, and will be mapped
>2. seperate kernel and process stack will enhence the security of memory

### Ex 2.5
A computer system has enough room to hold five programs in its main memory. These programs are idle waiting for I/O half the time. What fraction of the CPU time is wasted?

**Answer**:
>CPU utilization: 1 - p^n = 1 - 0.5^5
>So the CPU wasted = p^n = (1/2)^5 = 1/32


### Ex 2.6
A computer has 4 GB of RAM of which the operating system occupies 512 MB. The processes are all 256 MB (for simplicity) and have the same characteristics. If the goal is 99% CPU utilization, what is the maximum I/O wait that can be tolerated?

**Answer**:
>1-p^n>=0.99
>so p^n <= 0.01
>we know that max processes computer can take in mem is 2+4X3=14, that is n <=14
>so p<=0.719

### Ex 2.7
Multiple jobs can run in parallel and finish faster than if they had run sequentially. Suppose that two jobs, each needing 20 minutes of CPU time, start simultaneously. How long will the last one take to complete if they run sequentially? How long if they run in parallel? Assume 50% I/O wait.

**Answer**:
>40 min if sequentially
>in parallel, cpu utilization is 1-0.5^2=0.75, each one get cpu utilization of 0.375, and the cpu time needed for each is 20 X 0.5 = 10 min, so the time needed is 10 / 0.375 = 26.67 min.

### Ex 2.8
Consider a multiprogrammed system with degree of 6 (i.e., six programs in memory at the same time). Assume that each process spends 40% of its time waiting for I/O. What will be the CPU utilization?

**Answer**:
>1-0.4^6=99.6%

### Ex 2.9
Assume that you are trying to download a large 2-GB file from the Internet. The file is available from a set of mirror servers, each of which can deliver a subset of the file’s bytes; assume that a given request specifies the starting and ending bytes of the file. Explain how you might use threads to improve the download time.

**Answer**:
>Assume that the servers number is N, so we may start N threads to download, each of them is assigned a URL.
>The target file shall be splitted in pieces, and we give a fixed size of each piece, let’s say, 32MB. So the file shall be divided into 2 X 1024 / 32 = 64 pieces. Create a bitmap with 64 bits, each of which represents a single piece.
>Then the bitmap is shared by downloading threads, so it shall be pretected by mutex.
>Each thread shall check the bitmap to find a free bit. If found, set that bit to 1 and calculate the start and end bytes to download, then start downloading.
```c
semaphore mutex=1;
semaphore thmutex=0;
unsigned char bitmap[8];
char *urls[N];
void download_proc(char * url) {
    boolean done = false;
    int piece = 0;
    while ( !done ) {
        down(&mutex);
        piece = find_free(bitmap);
        if (piece != 0) {
            set_bit(bitmap, piece);
        }
        up(&mutex);

        if (piece == 0) {
            done = ture;
        } else {
            downloading(url, piece);
        }
    }

    up(&thmutex);
}

void control(void) {
    int i;
    for(i = 0; i < N; i++) {
        start_thread(download_proc(url[i]));
    }
    
    for(i = 0; i < N; i++) {
        down(&thmutex);
    }
}
```


### Ex 2.10
In the text it was stated that the model of Fig. 2-11(a) was not suited to a file server using a cache in memory. Why not? Could each process have its own cache?

**Answer**:
>Process has independant address space. If file server with cache use process to access file, the cache must be shared by processes, that is what multi-threads does.
>If each process has its own cache, the conflication between process caches on same file may occur.

### Ex 2.11
If a multithreaded process forks, a problem occurs if the child gets copies of all the parent’s threads. Suppose that one of the original threads was waiting for keyboard input. Now two threads are waiting for keyboard input, one in each process. Does this problem ever occur in single-threaded processes?

**Answer**:
>No. Process will be blocked in waiting for keyboard input, and can not fork.

### Ex 2.12
In Fig. 2-8, a multi-threaded Web server is shown. If the only way to read from a file is the normal blocking read system call, do you think user-level threads or kernel-level threads are being used for the Web server? Why?

**Answer**:
>Kernel-level threads must be used due to read system call will block the process if using user-level threads.

### Ex 2.13
In the text, we described a multi-threaded Web server, showing why it is better than a single-threaded server and a finite-state machine server. Are there any circumstances in which a single-threaded server might be better? Give an example.

**Answer**:
>When requests must be processed sequentially, the single-threaded server must be taken.
>or, if there is no blocking in processing, there is unnecessary to use multi-threads. Single thread will be more efficient.

### Ex 2.14
In Fig. 2-12 the register set is listed as a per-thread rather than a per-process item. Why? After all, the machine has only one set of registers.

**Answer**:
>Registers is related to the processing context, and each threads has its own context.

### Ex 2.15
Why would a thread ever voluntarily give up the CPU by calling thread yield? After all, since there is no periodic clock interrupt, it may never get the CPU back.

**Answer**:
>Sometimes thread need cooperation of other thread to complete an action. If not yield CPU, the other thread may never be scheduled.

### Ex 2.16
Can a thread ever be preempted by a clock interrupt? If so, under what circumstances? If not, why not?

**Answer**:
>User thread can not be preepmted by clock interrupt because clock interrupt is invisible to process.
>Kernel level thread can be preempted. Just like processes in preemptable system like time sharing system.

### Ex 2.17
In this problem you are to compare reading a file using a single-threaded file server and a multithreaded server. It takes 12 msec to get a request for work, dispatch it, and do the rest of the necessary processing, assuming that the data needed are in the block cache. If a disk operation is needed, as is the case one-third of the time, an additional 75 msec is required, during which time the thread sleeps. How many requests/sec can the server handle if it is single threaded? If it is multithreaded?

**Answer**:
>For single thread, time for one request is 12 + 75 * 1/3 = 37ms, so 1000/37=27 requests can be handled.
>For multi-thread, all waiting operation are overlapped, so the request number is 1000/12=83.33

### Ex 2.18
What is the biggest advantage of implementing threads in user space? What is the biggest disadvantage?

**Answer**:
>Advantage: no system call in switching, so improves the efficiency;
>Disadvantage: extra action must be wrapped into all block system call.

### Ex 2.19
In Fig. 2-15 the thread creations and messages printed by the threads are interleaved at random. Is there a way to force the order to be strictly thread 1 created, thread 1 prints message, thread 1 exits, thread 2 created, thread 2 prints message, thread 2 exists, and so on? If so, how? If not, why not?

**Answer**:
>after creating thread main control shall join it.

### Ex 2.20
In the discussion on global variables in threads, we used a procedure create global to allocate storage for a pointer to the variable, rather than the variable itself. Is this essential, or could the procedures work with the values themselves just as well?

**Answer**:

### Ex 2.21
Consider a system in which threads are implemented entirely in user space, with the run-time system getting a clock interrupt once a second. Suppose that a clock interrupt occurs while some thread is executing in the run-time system. What problem might occur? Can you suggest a way to solve it?

**Answer**:

### Ex 2.22
Suppose that an operating system does not have anything like the select system call to see in advance if it is safe to read from a file, pipe, or device, but it does allow alarm clocks to be set that interrupt blocked system calls. Is it possible to implement a threads package in user space under these conditions? Discuss.

**Answer**:

### Ex 2.23
Does the busy waiting solution using the turn variable (Fig. 2-23) work when the two processes are running on a shared-memory multiprocessor, that is, two CPUs sharing a common memory?

**Answer**:

### Ex 2.24
Does Peterson’s solution to the mutual-exclusion problem shown in Fig. 2-24 work when process scheduling is preemptive? How about when it is nonpreemptive?

**Answer**:

### Ex 2.25
Can the priority inversion problem discussed in Sec. 2.3.4 happen with user-level threads? Why or why not?

**Answer**:

### Ex 2.26
In Sec. 2.3.4, a situation with a high-priority process, H, and a low-priority process, L, was described, which led to H looping forever. Does the same problem occur if roundrobin scheduling is used instead of priority scheduling? Discuss.

**Answer**:

### Ex 2.27
In a system with threads, is there one stack per thread or one stack per process when user-level threads are used? What about when kernel-level threads are used? Explain.

**Answer**:

### Ex 2.28
When a computer is being developed, it is usually first simulated by a program that runs one instruction at a time. Even multiprocessors are simulated strictly sequentially like this. Is it possible for a race condition to occur when there are no simultaneous ev ents like this?

**Answer**:

### Ex 2.29
The producer-consumer problem can be extended to a system with multiple producers and consumers that write (or read) to (from) one shared buffer. Assume that each producer and consumer runs in its own thread. Will the solution presented in Fig. 2-28, using semaphores, work for this system?

**Answer**:

### Ex 2.30
Consider the following solution to the mutual-exclusion problem involving two processes P0 and P1. Assume that the variable turn is initialized to 0. Process P0’s code is presented below.
```c
/* Other code */
while (turn != 0) { } /* Do nothing and wait. */
Critical Section /* . . . */
turn = 0;
/* Other code */
```
For process P1, replace 0 by 1 in above code. Determine if the solution meets all the required conditions for a correct mutual-exclusion solution.

**Answer**:

### Ex 2.31
How could an operating system that can disable interrupts implement semaphores?

**Answer**:

### Ex 2.32
Show how counting semaphores (i.e., semaphores that can hold an arbitrary value) can be implemented using only binary semaphores and ordinary machine instructions.


**Answer**:

### Ex 2.33
If a system has only two processes, does it make sense to use a barrier to synchronize them? Why or why not?


**Answer**:

### Ex 2.34
Can two threads in the same process synchronize using a kernel semaphore if the threads are implemented by the kernel? What if they are implemented in user space? Assume that no threads in any other processes have access to the semaphore. Discuss your answers.


**Answer**:

### Ex 2.35
Synchronization within monitors uses condition variables and two special operations, wait and signal. A more general form of synchronization would be to have a single primitive, waituntil, that had an arbitrary Boolean predicate as parameter. Thus, one could say, for example,

**waituntil x < 0 or y + z < n**

The signal primitive would no longer be needed. This scheme is clearly more general than that of Hoare or Brinch Hansen, but it is not used. Why not? (Hint: Think about the implementation.)


**Answer**:

### Ex 2.36
A fast-food restaurant has four kinds of employees: (1) order takers, who take customers’ orders; (2) cooks, who prepare the food; (3) packaging specialists, who stuff the food into bags; and (4) cashiers, who give the bags to customers and take their money. Each employee can be regarded as a communicating sequential process. What form of interprocess communication do they use? Relate this model to processes in UNIX.


**Answer**:

### Ex 2.37
Suppose that we have a message-passing system using mailboxes. When sending to a full mailbox or trying to receive from an empty one, a process does not block. Instead, it gets an error code back. The process responds to the error code by just trying again, over and over, until it succeeds. Does this scheme lead to race conditions?

**Answer**:

### Ex 2.38
The CDC 6600 computers could handle up to 10 I/O processes simultaneously using an interesting form of round-robin scheduling called processor sharing. A process switch occurred after each instruction, so instruction 1 came from process 1, instruction 2 came from process 2, etc. The process switching was done by special hardware, and the overhead was zero. If a process needed T sec to complete in the absence of competition, how much time would it need if processor sharing was used with n processes?

**Answer**:

### Ex 2.39
Consider the following piece of C code:
```c
void main( ) {
	fork( );
	fork( );
	exit( );
}
```
How many child processes are created upon execution of this program?

**Answer**:

### Ex 2.40
Round-robin schedulers normally maintain a list of all runnable processes, with each process occurring exactly once in the list. What would happen if a process occurred twice in the list? Can you think of any reason for allowing this?

**Answer**:

### Ex 2.41
Can a measure of whether a process is likely to be CPU bound or I/O bound be determined by analyzing source code? How can this be determined at run time?

**Answer**:

### Ex 2.42
Explain how time quantum value and context switching time affect each other, in a round-robin scheduling algorithm.

**Answer**:

### Ex 2.43
Measurements of a certain system have shown that the average process runs for a time T before blocking on I/O. A process switch requires a time S, which is effectively wasted (overhead). For round-robin scheduling with quantum Q, giv e a formula for the CPU efficiency for each of the following:

(a) Q = ∞
(b) Q > T
(c) S < Q < T
(d) Q = S
(e) Q nearly 0

**Answer**:

### Ex 2.44
Five jobs are waiting to be run. Their expected run times are 9, 6, 3, 5, and X. In what order should they be run to minimize average response time? (Your answer will depend on X.)

**Answer**:

### Ex 2.45
Five batch jobs. A through E, arrive at a computer center at almost the same time. They hav e estimated running times of 10, 6, 2, 4, and 8 minutes. Their (externally determined) priorities are 3, 5, 2, 1, and 4, respectively, with 5 being the highest priority. For each of the following scheduling algorithms, determine the mean process turnaround time. Ignore process switching overhead.
	(a) Round robin.
	(b) Priority scheduling.
	(c) First-come, first-served (run in order 10, 6, 2, 4, 8).
	(d) Shortest job first.
For (a), assume that the system is multiprogrammed, and that each job gets its fair share of the CPU. For (b) through (d), assume that only one job at a time runs, until it finishes. All jobs are completely CPU bound.

**Answer**:

### Ex 2.46
A process running on CTSS needs 30 quanta to complete. How many times must it be swapped in, including the very first time (before it has run at all)?

**Answer**:

### Ex 2.47
Consider a real-time system with two voice calls of periodicity 5 msec each with CPU time per call of 1 msec, and one video stream of periodicity 33 ms with CPU time per call of 11 msec. Is this system schedulable?

**Answer**:

### Ex 2.48
For the above problem, can another video stream be added and have the system still be schedulable?

**Answer**:

### Ex 2.49
The aging algorithm with a = 1/2 is being used to predict run times. The previous four runs, from oldest to most recent, are 40, 20, 40, and 15 msec. What is the prediction of the next time?

**Answer**:

### Ex 2.50
A soft real-time system has four periodic events with periods of 50, 100, 200, and 250 msec each. Suppose that the four events require 35, 20, 10, and x msec of CPU time, respectively. What is the largest value of x for which the system is schedulable?

**Answer**:

### Ex 2.51
In the dining philosophers problem, let the following protocol be used: An even-numbered philosopher always picks up his left fork before picking up his right fork; an odd-numbered philosopher always picks up his right fork before picking up his left fork. Will this protocol guarantee deadlock-free operation?

**Answer**:

### Ex 2.52
A real-time system needs to handle two voice calls that each run every 6 msec and consume 1 msec of CPU time per burst, plus one video at 25 frames/sec, with each frame requiring 20 msec of CPU time. Is this system schedulable?

**Answer**:

### Ex 2.53
Consider a system in which it is desired to separate policy and mechanism for the scheduling of kernel threads. Propose a means of achieving this goal.

**Answer**:

### Ex 2.54
In the solution to the dining philosophers problem (Fig. 2-47), why is the state variable set to HUNGRY in the procedure take forks?

**Answer**:

### Ex 2.55
Consider the procedure put forks in Fig. 2-47. Suppose that the variable state[i] was set to THINKING after the two calls to test, rather than before. How would this change affect the solution?

**Answer**:

### Ex 2.56
The readers and writers problem can be formulated in several ways with regard to which category of processes can be started when. Carefully describe three different variations of the problem, each one favoring (or not favoring) some category of processes. For each variation, specify what happens when a reader or a writer becomes ready to access the database, and what happens when a process is finished.

**Answer**:

### Ex 2.57
Write a shell script that produces a file of sequential numbers by reading the last number in the file, adding 1 to it, and then appending it to the file. Run one instance of the script in the background and one in the foreground, each accessing the same file. How long does it take before a race condition manifests itself? What is the critical region? Modify the script to prevent the race. (Hint: use ln file file.lock to lock the data file.)

**Answer**:

### Ex 2.58
Assume that you have an operating system that provides semaphores. Implement a message system. Write the procedures for sending and receiving messages.

**Answer**:

### Ex 2.59
Solve the dining philosophers problem using monitors instead of semaphores.

**Answer**:

### Ex 2.60
Suppose that a university wants to show off how politically correct it is by applying the U.S. Supreme Court’s ‘‘Separate but equal is inherently unequal’’ doctrine to gender as well as race, ending its long-standing practice of gender-segregated bathrooms on campus. However, as a concession to tradition, it decrees that when a woman is in a bathroom, other women may enter, but no men, and vice versa. A sign with a sliding marker on the door of each bathroom indicates which of three possible states it is currently in:
- Empty
- Women present
- Men present
  In some programming language you like, write the following procedures: woman wants to enter, man wants to enter, woman leaves, man leaves. You may use whatever counters and synchronization techniques you like.

**Answer**:

### Ex 2.61
Rewrite the program of Fig. 2-23 to handle more than two processes.

**Answer**:

### Ex 2.62
Write a producer-consumer problem that uses threads and shares a common buffer. However, do not use semaphores or any other synchronization primitives to guard the shared data structures. Just let each thread access them when it wants to. Use sleep and wakeup to handle the full and empty conditions. See how long it takes for a fatal race condition to occur. For example, you might have the producer print a number once in a while. Do not print more than one number every minute because the I/O could affect the race conditions.

**Answer**:

### Ex 2.63
A process can be put into a round-robin queue more than once to give it a higher priority. Running multiple instances of a program each working on a different part of a data pool can have the same effect. First write a program that tests a list of numbers for primality. Then devise a method to allow multiple instances of the program to run at once in such a way that no two instances of the program will work on the same number. Can you in fact get through the list faster by running multiple copies of the program? Note that your results will depend upon what else your computer is doing; on a personal computer running only instances of this program you would not expect an improvement, but on a system with other processes, you should be able to grab a bigger share of the CPU this way.

**Answer**:

### Ex 2.64
The objective of this exercise is to implement a multithreaded solution to find if a given number is a perfect number. N is a perfect number if the sum of all its factors, excluding itself, is N; examples are 6 and 28. The input is an integer, N. The output is true if the number is a perfect number and false otherwise. The main program will read the numbers N and P from the command line. The main process will spawn a set of P threads. The numbers from 1 to N will be partitioned among these threads so that two threads do not work on the name number. For each number in this set, the thread will determine if the number is a factor of N. If it is, it adds the number to a shared buffer that stores factors of N. The parent process waits till all the threads complete. Use the appropriate synchronization primitive here. The parent will then determine if the input number is perfect, that is, if N is a sum of all its factors and then report accordingly. (Note: You can make the computation faster by restricting the numbers searched from 1 to the square root of N.) 

**Answer**:

### Ex 2.65
Implement a program to count the frequency of words in a text file. The text file is partitioned into N segments. Each segment is processed by a separate thread that outputs the intermediate frequency count for its segment. The main process waits until all the threads complete; then it computes the consolidated word-frequency data based on the individual threads’ output.

**Answer**:

