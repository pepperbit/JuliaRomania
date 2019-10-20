cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 3. FUNCTIONS """

# """ Standard notation """
function foo(a,b)
    return a*b-3
end

# """ Short notation """
foo(a,b) = a*b-3
foo(2,3)

# """ Operators are functions """
+(2,3)

# """ Function naming conventions """
ar = reverse(a)
reverse!(a) # functions ending with "!" mutate their arguments

# """ multiple dispatch """
bar(x,y) = x+y
@code_native bar(1,2)
@code_llvm bar(1,2)
@code_native bar(1.0,2.0)
@code_llvm bar(1.0,2.0)
# you can define your own specialized methods
bar(x) = "Hello"
bar(1)
bar

# """ enforce argument types: this acts like filtering, not necesarily critical for performance """
bar(x::Int64,y::Float64,z::String) = println(z)
bar(1,2.0,"abs")
bar(1,2,"abs")

# default values for arguments
function fct1(x,y,z=2)
    x+y*z
end
fct1(2,3)

# """ Type stability """
function type_unstable() ## poor performance, x is changing type during execution
    x = 1
    for i = 1:2
        x /= 2.2
    end
    return x
end
@code_warntype type_unstable()
function type_stable() ## good performance, x is not changing type during execution
    x = 1.0
    for i = 1:2
        x /= 2.2
    end
    return x
end
@code_warntype type_stable()
