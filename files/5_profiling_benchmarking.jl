cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 5. PROFILING FOR PERFORMANCE/BENCHMARKING """
""" https://docs.julialang.org/en/v1/manual/profile/ """
using BenchmarkTools
using FileIO
using Images
using LinearAlgebra
"""
In Julia, vectorization is not always necessary and not always the fastest solution
using @. or explicit for loops for fusing operations is the optimal approach
https://julialang.org/blog/2017/01/moredots
"""
# """ Example 1 - implementing BLAS axpy! with for loop and Threads """
@time a = 2.0 # assign a Float to variable a
b = Float64.(collect(1:100_000_000)) # assign a big array of Floats to variable b
c = Float64.(collect(1:100_000_000)) # assign a big array of Floats to variable c

@time c = a.*b.+c # the right hand side result is reassigned to c -> memory allocation!
@time c .= a.*b.+c # c is updated in place at each iteration, single threaded
# or
@time @. c = a*b+c  # c is updated in place at each iteration, single threaded
# our custom axpy!, multithreaded / single threaded
function custom_threaded_axpy!(a,b,c)
        Threads.@threads for i = 1:length(c)
                @inbounds c[i] = a*b[i]+c[i]
        end
        return nothing
end
function custom_non_threaded_axpy!(a,b,c)
        for i = 1:length(c)
                @inbounds c[i] = a*b[i]+c[i]
        end
        return nothing
end


# now let's test!
# Single threaded
LinearAlgebra.BLAS.set_num_threads(1)
@btime LinearAlgebra.BLAS.axpy!(a,b,c)
@btime custom_non_threaded_axpy!(a,b,c)
# Multi threaded
LinearAlgebra.BLAS.set_num_threads(4)
@btime LinearAlgebra.BLAS.axpy!(a,b,c)
@btime custom_threaded_axpy!(a,b,c)


# """ Example 2 - a more complex function operating on an array"""
function f!(x::Vector{Float64})
        Threads.@threads for i = 1:length(x)
                x[i] = 3.0*x[i]^2 + 5.0*x[i] + 2.0
        end
        return nothing
end
@time f!(c)

# """ Example 3 """
@time a = Float64.(collect(1:100_000_000)) # assign a big array of Ints to variable a
#1. multiply a by 3 and reassign the result to a -> reassigning pays
#the price of memory allocation and slow code
@time a = a*3
#2. perform loop fusion -> no reassigning is done, a is updated in place at each iteration
@time a .= a.*3
#3. same as 2, with explicit for loop -> loops in Julia are fast!
function multiply_by_x!(a,x)
        for i = 1:length(a)
                a[i] = a[i]*x
        end
        return nothing
end

@time multiply_by_x!(a,3)

# """ Example 4 """
## Extras: example of image saturation adjustment
img = load("julia_logo_3.jpg")
# img = imresize(img,1000,1000)
function modif_saturation(img,val)
        img_hsv = HSV.(img);
        ch = channelview(img_hsv);
        ch[2,:,:] .= ch[2,:,:] .* val;
        img_sat_incr = colorview(HSV,ch)
end

@time i1 = modif_saturation(img,0.1)
@time i1 = modif_saturation(img,2)
