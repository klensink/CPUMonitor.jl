# CPUMonitor

CPUMonitor is a package designed to make it easier to monitor and visualize multiple CPU processes on a single Linux host.

CPU and Memory use are monitored using Linux's `top` command. As per their documentation, the returned CPU values are defined as:
*The task's share of the elapsed CPU time since the last screen update, expressed as a percentage of total CPU time. In a true SMP environment, if 'Irix mode' is Off, top will operate in 'Solaris mode' where a task's cpu usage will be divided by the total number of CPUs. You toggle 'Irix/Solaris' modes with the 'I' interactive command.*

The returned memory values are defined as : *A task's currently used share of available physical memory.*

## Installation
-----

CPUMonitor can be installed using the Julia package manager. If you have a Github account, run the following from the Julia REPL:

    https://github.com/klensink/CPUMonitor.jl.git

Otherwise run:

    git@github.com:klensink/CPUMonitor.jl.git

## Example
-----

The monitor requires it's own process, so start an additional instance of Julia on the same host as the processes you wish to track. This process will be reffered to as the `monitoring process`, and the processes being tracked will be referred to as the `workers`. The following example uses 4 `workers` and 1 `monitoring process`.

The `username` argument will restrict the monitor to processes from a user.

    julia> stats = monitor("klensink")
    CPUMonitor: Begin Tracking...
    CPUMonitor: End Tracking...
    CPUMonitor: Begin Parsing Log...
    CPUMonitor: End Parsing Log...
    5-element Array{CPUMonitor.CPUStat,1}:
     CPUMonitor.CPUStat(20277, [13.6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1])
     CPUMonitor.CPUStat(12885, [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2]) 
     CPUMonitor.CPUStat(13032, [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]) 
     CPUMonitor.CPUStat(13054, [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]) 
     CPUMonitor.CPUStat(13055, [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]) 

[ex_1.png]

Inorder to have something to monitor, define a function to be evaluated on each `worker`.


    julia> @everywhere busy_work(x) = sum(norm(fft(rand(x))))









