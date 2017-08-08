export CPUStat

struct CPUStat

    pid::Int
    cpu::Array{Float64,1}
    mem::Array{Float64,1}

end
