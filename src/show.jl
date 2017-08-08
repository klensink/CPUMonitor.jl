import Base
import PyPlot
export show

function show(stat::Array{CPUStat,1})

    for i = 1:length(stat);
        ax = PyPlot.gca()
        ax[:set_ylim]([0,100])
        PyPlot.plot(stat[i].cpu) 
        PyPlot.title(stat[i].pid) 
    end

end
