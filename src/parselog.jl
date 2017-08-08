export parselog

function parselog(logfile::String, verbose::Bool)

    verbose && println("CPUMonitor: Begin Parsing Log...")
    # Read log file as array with " " delim
    log = readdlm(logfile)

    # Find unique process IDs
    pids = unique(log[:,1])
    count = 1

    stat = Array{CPUStat,1}(length(pids))
    
    # Collect stats from each PID into an instance of CPUStat
    for pid in pids

        inds = find(x -> x == pid, log[:,1])

        stat[count] = CPUStat(pid, log[inds, 9], log[inds, 10])
        
        count += 1

    end

    verbose && println("CPUMonitor: End Parsing Log...")

    return stat 
end
