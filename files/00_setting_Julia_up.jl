cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")

"""
##############################################################################################################################
A. Setting local Julia environment(for Windows):

1. Download and install Julia from https://julialang.org/downloads/ (stable release 1.2, as of sept. 2019)
2. Download and install Atom from https://atom.io/
3. Install Atom dependencies in order to bind to Julia:
    - open Atom -> File -> Settings -> Install
    - install: "uber-juno" ("julia-client", "ink" and "language-julia" should install automatically; if not, install manually)
    - install: additional dependencies for code formatting in Atom: "autosave-onchange", "highlight-selected", "auto-indent"
4. Once the dependencies fom 3. are installed, a new tab "Juno" (or Julia) will appear in the window toolbar.
Now let's bind Julia to Atom and we're good to go!
    - Juno (or Julia) -> Settings -> Settings -> Julia Path -> set path to julia .exe (ex: C:\Julia\bin\julia.exe)
5. Juno -> open Console -> this opens the Julia REPL in Atom
6. Install Atom/Juno packages from Julia repl with ]add Atom and ]add Juno
7. (optional) Tweak Julia: Juno (or Julia) -> Settings -> Julia Options:
    - Optimisation level: set to 3
    - Number of threads: equal to number of physical cores of your cpu
8. Happy Coding in Julia!
##############################################################################################################################
B. Package Management:

Similar to Python or R, Julia specialized libraries live outside of "base" (core language) and are called Packages.
In most cases they are located in GitHub repositories.
The Julia language provides a built in Package Manager for registering packages, versioning, dependencies etc.
Here is the database of currently available packages: https://juliaobserver.com/packages
And here is the centralized documentation for packages: https://pkg.julialang.org/docs/

Julia provides an easy way to install and manage packages, using the REPL (Read-Eval-Print-Loop (console)):
1. Enter package mode by typing ] in the REPL
    - add a package: add PackageName (ex: add CSV)
    - update a package: update CSV
    - update all packages: update
    - remove package: rm CSV
##############################################################################################################################
C. Other REPL modes:

The Julia REPL offers several modes:
1. Pkg mode: press ]
2. Help mode: press ? followed by function name, etc (ex: ?sum)
3. Shell mode: press ;
4. Debug mode: we will have a full chapter dedicated to debugging (entering debug mode, breakpoints...)
##############################################################################################################################
D. Information sources:

0. The official site: https://docs.julialang.org contains plenty of details about community, docs, blogs, tutorials. The Julia Computing
site https://juliacomputing.com/ offers case studies, collaborations with companies and trainings. More info about the Julia organizations
here: https://julialang.org/blog/2019/02/julia-entities
1. Community:
    - the official Julia forum is on: https://discourse.julialang.org/
    - the multinational anual Julia conference: https://juliacon.org/2019/
    - other locations are also used by users: StackOverflow, Reddit, Medium, GitHub repositories
2. Tutorials and info about the language:
    - official manual: https://docs.julialang.org/en/v1/
    - package docs: https://pkg.julialang.org/docs/ (also found on each of the GitHub repositories)
    - quick cheat sheet: https://juliadocs.github.io/Julia-Cheat-Sheet/
    - another cheat sheet: https://learnxinyminutes.com/docs/julia/
    - official youtube channel: https://www.youtube.com/channel/UC9IuUwwE2xdjQUT_LMLONoA
    - one of the official Julia tutorials: https://github.com/JuliaComputing/JuliaBoxTutorials
        - these are Jupyter notebooks which can be run on the JuliaBox (https://www.juliabox.com/) online free platform, or locally
        - they consist of different lessons with increasing degree of complexity, starting from for loops up to distributed computing
"""
"""
...next: what_is_Julia.jl
"""
