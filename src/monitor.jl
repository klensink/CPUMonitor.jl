export monitor

"""
Use: monitor(username::String;
                delay::Number = 0.05,
                iterations::Int = 10,
                command::String = "julia",
                logfile::String = Pkg.dir("CPUMonitor")*"/log/$(now()).txt",
                verbose::Bool = true)

Tracks CPU stats on local processor.

Saves the results in /myjulia/CPUMonitor/log/
"""
function monitor(username::String;
                    delay::Number = 0.05,
                    iterations::Int = 10,
                    command::String = "julia",
                    logfile::String = Pkg.dir("CPUMonitor")*"/log/$(now()).txt",
                    verbose::Bool = true)

    logfile = track(username, delay, iterations, command, logfile, verbose)

    stat = parselog(logfile, verbose)
end

