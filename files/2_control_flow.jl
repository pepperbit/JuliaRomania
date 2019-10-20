cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 2. Control flow """

# """ If Else """
cond = false
if cond == true
    println("true")
else
    println("false")
end
# short version
cond ? println("true") : println("false")

# """ there is no switch case construct """

# """ for loops """
for i = 1:length(a)
    println(a[i])
end
for i = 1:3
    println(i)
end
for i in 1:3
    println(i)
end
for i in ['a','b','c']
    println(i)
end
for i in 1:3, j in 4:6
    println(string(i,' ',j))
end
