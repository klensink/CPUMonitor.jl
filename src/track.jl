export track

"""
Use: track(   username::String, 
                delay::Number, 
                iterations::Int, 
                command::String,
                logfile::String)

Tracks CPU stats on local processor using the `top` command.

Returns the path to the run's log file.
"""
function track( username::String, 
                delay::Number, 
                iterations::Int, 
                command::String,
                logfile::String,
                verbose::Bool)
    
    # Generate commands from input
    top_cmd = `top -b -u $username -d $delay -n $iterations`
    grep_cmd = `grep "julia"`

    verbose && println("CPUMonitor: Begin Tracking...")

    # top -b -u $username -d $delay -n $iterations | grep "julia" > logfile
    @time run(pipeline(pipeline(top_cmd, grep_cmd), stdout = logfile))
   
    verbose && println("CPUMonitor: End Tracking...")

    return logfile
end
