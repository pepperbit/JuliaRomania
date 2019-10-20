cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")
"""
Eval line with Ctrl+Enter
Eval and step to next line with Shift+Enter
Hit ] in REPL to enter Package mode
Hit ? in REPL to search documentation
"""
""" 1. BASIC TYPES """

# """ Numeric types """
# ints,floats
i = 10
f = 3.1
typeof(i)
# type conversions
i32 = Int32(i)
typeof(i32)
# rationals
r = 3//2
typeof(r)
r + 2

# """ booleans """
tt = true
ff = false

# """ Strings and chars """
c = 'c'
s = "this is a string"
typeof(c)
# string indexing -> Julia uses 1-based indexing for arrays
s[0]
s[1]
# string concatentation
s*s
# or
string(s,s)
# conversion to string
string(f)

# """ Tuples """
tup = (1,3)
tup[1]

# """ Dictionaries """
myphonebook = Dict("Harry" => "671", "Marv" => "671")

myphonebook["Marv"]
myphonebook["Kevin"] = "1990"
myphonebook
delete!(myphonebook,"Marv")

# """ Arrays """
a = [1,2,3]
b = Array{Float32,2}(undef,2,3)
sz = size(b)
@time slice = b[:,1]
@time view_slice = @view b[:,1] # avoid allocation cost
# appending to the end of an array
a[end]
a[end+1] = 10
push!(a,10)
pop!(a)
a
rng = 1:3 # this creates a range object
rng2vec = collect(rng) # this generates an array based in the range object
