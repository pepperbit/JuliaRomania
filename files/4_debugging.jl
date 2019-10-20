cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 1. DEBUGGING """
""" Let's define a function which we will debug later """
function to_debug(x,y)
    a = 3
    b = a/inner_function(x)
    c = b+y
end
inner_function(x) = 2x
"""
In REPL:
]add JuliaInterpreter
using JuliaInterpreter
Juno.@enter to_debug(5,2)
"""
