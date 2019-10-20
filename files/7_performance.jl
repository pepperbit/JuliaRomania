cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 7. PERFORMANCE """
"""
Julia creates a copy when slicing an array. Sometimes, this can be expensive
so one can use a "view", which is allocatin free
"""
mat = zeros(1000,1000)
@time m1 = mat[:,2]
@time m2 = @view mat[:,2]
m2[1] = 5
mat
