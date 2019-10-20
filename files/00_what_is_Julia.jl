cd(raw"C:\Projects\JuliaMeetup\JuliaIntro\Julia_basics")

"""
##############################################################################################################################
A. Why another programming language?

1. Motivation and official paper:
    - https://julialang.org/blog/2012/02/why-we-created-julia
    - https://arxiv.org/pdf/1411.1607.pdf
    - Julia aims to solve the "two language problem": in most cases revolving around high performance computing
      the prototyping of an algorithm is done in a slow dynamically typed interpreted language (ex: Python) and then rewritten in a fast
      statically typed compiled language (ex: C). This approach has several issues:
        - creates higher demands on the programming skills of the user or even necesitates multiple developers
          for different programming languages (low level code -> wrapper code)
        - pushes the release date of the software if a certain skill is not available or is overloaded
        - creates a barrier between developer (usually the one writing the hardcore stuff in C) and library user
          (the one using the high level wrappers). One might argue that there is no need for "reinventing the wheel"
          and simply using a library written by someone else is the recommended way to go. While it is true that not
          everyone wants to dig deep into code, one should not generalize this. There is always room for improvement
          and having more developers who can prototype and also produce high performance code is always beneficial
          (not only from financial point of view, but also because it enables better and deeper knowledge sharing)
          This is where Julia comes in.
2. Why is Julia fit to solve the "two language problem":
    - Quote from: https://docs.julialang.org/en/v1.1/
        - "Although one sometimes speaks of dynamic languages as being "typeless", they are definitely not:
           every object, whether primitive or user-defined, has a type. The lack of type declarations in most dynamic languages,
           however, means that one cannot instruct the compiler about the types of values, and often cannot explicitly talk
           about types at all. In static languages, on the other hand, while one can – and usually must – annotate types for
           the compiler, types exist only at compile time and cannot be manipulated or expressed at run time. In Julia,
           types are themselves run-time objects, and can also be used to convey information to the compiler."
        - This means that, in general, a dynamically typed language does not force the user to declare variable types and even
          offers the possibility of a variable to change type during execution. While from the user's point of view this comes in handy when
          prototyping because he can code faster and doesn't need to think about types, the compiler (or interpreter) needs
          to work harder because of the lack of information about types. For example running a "for loop" in an interpreter in
          a dynamically typed language will be slow because the interpreter will blindly check the type of variables at each iteration.
        - How to make peace between the user and the compiler/interpreter?
          Meet Julia, a high performance dynamic, multiple dispatch, Just-In-Time compiled language:
          Julia does not enforce type declarations (so it can be considered a dynamically typed language), but instead of having an
          interpreter constantly checking for types at runtime, or a compiler adding type checks and conversions ahead of time
          (both of which will slow down execution), it will specialize and cache different methods for different concrete types recorded at
          runtime.
          For example, let's write a function which sums two elements:
"""
two_elem_sum(x,y) = x + y
"""
          Calling this function with two integer arguments: two_elem_sum(2,3) will generate a specialized method: two_elem_sum(x::Int,y::Int)
          First run will be slower, due to type specialization and precompilation, but subsequent runs will be as fast as C written code.
          One can directly inspect the assembly code for this method and see how it is translated to basic instructions for integer addition.
          *Note: @code_native is called macro. There are many macros in Julia doing different magical stuff, and you can even write your own.
"""
@code_native two_elem_sum(2,3)
"""
          Subsequent calls with other argument types (ex: two_elem_sum(2.0,3.0), notice the different assembly code) will generate other
          specialized methods:
"""
@code_native two_elem_sum(2.0,3.0)
"""
          Congratulations! You've just used multiple dispatch, one of Julia's key features.
          This nice way of auto-optimising the code without having to explicitly declare variable types has a caveat: type stability:
            - Julia will know how to specialize methods as long as the variable types won't change inside your code. In that case, it will
              behave like any other (slower, dynamically typed, interpreted language): it will simply add type checks and conversions all
              over the place.
          Conclusions:
            - Julia is a high performance dynamic, multiple dispatch, Just-In-Time compiled language:
            - If the user ensures type stability, the code will run fast (in most cases close to optimised C code)
            - If type stability cannot be guaranteed, the code will run at the same speed as other languages (like Python, R or Matlab)
            - Multiple dispatch allows for method specialization based on combinations of input argument types
              (it is also a very efficient tool for writing clean code, as we will see in the next chapters)
"""
"""
...next: 1_basic_types.jl
"""
