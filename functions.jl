### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 47eef000-6ddf-11ee-109e-e56c46c419bf
md"""
# Functions
Motivation

Often in Julia, we encounter situations where we repeat the same code or computation multiple times with different values or on different datasets.

For example, imagine writing a Julia program to print the "Happy Birthday" song. Initially, you might script it for "Alice" like this:
"""

# ╔═╡ 6d796144-e7ae-4d88-9611-a70e307b8ab7
begin
	println("Happy Birthday to you!")
	println("Happy Birthday to you!")
	println("Happy Birthday dear Alice!")
	println("Happy Birthday to you!")
end

# ╔═╡ 02f72ea6-478f-4bde-b70b-72ee1835501f
md"""
Now, if we wanted to print happy birthday to somebody else, we could copy this whole block of code and change the name. Let's go ahead and do that to sing happy birthday to Bob.
"""

# ╔═╡ 0440790b-1003-4d37-bd79-081ad221362a
begin
	println("Happy birthday to you")
	println("Happy birthday to you")
	println("Happy birthday to Bob")
	println("Happy brithday to you")
end

# ╔═╡ 263f638f-5ddb-4050-979a-5712fa866ced
md"""
### Avoiding Redundancy

Oops! We misspelled "birthday" in the last line of our script. Now, we must correct the mistake in two different places. While this might seem manageable, consider if we had duplicated the song for 10 different names. Or even worse, what if we lost track of the number of copies we made when we realized the error?

Generally, copying and pasting code is not recommended. If you find yourself doing it frequently, it's an indication that you might want to adopt a more efficient approach. Specifically, repeated code is a hint that it might be beneficial to implement a function.

We've previously seen functions in Julia, such as println(), which outputs its arguments to the console. However, we can also create our own custom functions to tailor them to specific needs.
"""

# ╔═╡ 7a5ea7aa-ef63-4e80-8bd9-76475078874a
md"""
#### What is a function?
A function is simply a grouped sequence of statements with a name.
"""

# ╔═╡ f4d9a307-9ff8-4211-bb0a-5dce43d787a6
md"""
#### Why use a function?
- **Decomposition**: Take a larger, complex problem and break it up into smaller individual parts. This can actually make it easier to program because the goal is no longer to program the entire solution, but instead to work on each of the individual pieces. A single function might be one of many in the problem decomposition.
- **Abstraction**: Focus on the general aspects, ignoring the individual details to identify common aspects.
"""

# ╔═╡ 30b62cc1-9cd4-40a5-9af4-1e6f85ed770c
md"""
##### What does a function look like in Julia?



Here's a breakdown of the components of a Julia function:

1. **name**: The identifier we will use when we want to call our function.

2. **parameters**: The external variables or inputs that the function will use in its computations.

3. **body**: The sequence of statements that will be executed when the function is called.

4. **return**: Specifies the result that the function will send back to where it was called from. Every Julia function returns a value, and if no explicit return is given, the value of the last statement is returned by default.

To make use of the function, we invoke it using:


Here, the `...` is not a specific Julia syntax. It just denotes that you can have any number of arguments based on the function's parameter list.

"""

# ╔═╡ 31b64b12-09ae-4d39-89ed-de1ea988c202
md"""
##### Argument vs Parameter in Julia

Parameters are the names listed in the function definition, representing the expected inputs the function needs to operate. Arguments, on the other hand, are the real values passed to the function when you call it. Within the function's body, these values are linked to the corresponding parameters.
"""


# ╔═╡ e76c2079-b686-46a4-9c27-6471f77b0a63
md"""
#### Happy Birthday - Function Version
Let's look at the simple happy birthday again. Really, all versions of these have the form:

print("Happy birthday to you")

print("Happy birthday to you")

print("Happy birthday dear NAME")

print("Happy birthday to you")

This would be an idea of abstraction, the name isn't critical to the general idea of what we need to do.

Let's go ahead and look at what this looks like as a function:
"""

# ╔═╡ c58fb1ca-28e8-4e12-9258-492b5e5da918
function happy_birthday_song(name::String)
    println("Happy birthday to you")
    println("Happy birthday to you")
    println("Happy birthday dear $name")
    println("Happy birthday to you")
end

# ╔═╡ 7e94797d-70bd-494b-a163-9abe031c14d9
md"""
Note, that when we ran the previous cell it didn't actually print out anything. Remember, that is expected as that was just the function definition. To actually print out happy birthday, we would need to call the function:
"""

# ╔═╡ 5c63287d-0163-4cf5-83db-aed2220cd71d
md"""
##### Removing More Repetition:
Even in our function version of happy birthday, we still have some repeated code. In the concept of problem decomposition, we can break this down into smaller parts (for instance, "happy birthday to you") which occurs three times. Thus, we could extract this into its own function and invoke that from within the happy_birthday_song function to minimize redundancy.

It's worth noting that the function to replace the repetitive line doesn't require any arguments, as it isn't dependent on any specific values.
"""

# ╔═╡ 249daf01-a2ee-41f1-a55c-2f895110ca3a
begin
	function happy_birthday()
	    println("Happy birthday to you")
	end
	
	function happy_birthday_song(name)
	    happy_birthday()
	    happy_birthday()
	    println("Happy birthday dear ", name)
	    happy_birthday()
	end
	
	happy_birthday_song("Alice")
	
end

# ╔═╡ 4e5e74c0-0e7e-423c-9994-ce173dc52be5
md"""
##### Default Values

Often, when defining a function in Julia, we might want some (or all) of the parameters to have default values. These default values will be used if no argument is provided for those parameters when the function is called. This can be achieved conveniently in Julia. Taking the birthday example, if we desire the default name for the song to be "Alice", we can specify it as follows:
"""

# ╔═╡ bcb9a4fe-3abb-4fcc-a309-e7f674740234
begin
	function happy_birthdays()
	    println("Happy birthday to you")
	end
	
	function happy_birthday_song(name="Alice")
	    happy_birthday()
	    happy_birthday()
	    println("Happy birthday dear ", name)
	    happy_birthday()
	end
	
	happy_birthday_song()
	happy_birthday_song("Bob")
	
end

# ╔═╡ ac71f8ef-4555-443a-9726-984512691553
happy_birthday_song("Alice")

# ╔═╡ a22a1f1c-54cc-4c01-b85b-960029ed35ba
happy_birthday_song("Bob")

# ╔═╡ 1a263a7b-a056-4843-ba1b-756c64340348
md"""
Let's look at what happens now when we call happy_birthday_song without an argument:
"""

# ╔═╡ d39c3783-6c61-4935-b39a-956bc0e5f4b5
happy_birthday_song()

# ╔═╡ 967f2cee-7c64-4a65-bdd5-be02140d8d45
md"""

##### Quadratic Formula Example
Let's look at another example of where a function may be useful. Recall that the quadratic formula 

\[ x = \frac{-b \pm \sqrt{b^2-4ac}}{2a} \]

can be used to find the roots of a quadratic equation \( ax^2 + bx + c = 0 \). This is another example of abstraction: the precise values for \( a \), \( b \), and \( c \) don't change the computations we need to perform.

Note that in this example we need to return a value. In Julia, the last evaluated expression in a function is automatically returned. However, if needed, you can also use the `return` keyword explicitly.

Let's start by assuming we only care about computing the root with the \( + \sqrt{b^2-4ac} \) and we'll test it out.
"""

# ╔═╡ 7aa0cc56-092d-4298-8cdb-a08860aebcba
begin
	function quadratic_formula(a, b, c)
	    temp = sqrt(b^2 - 4*a*c)
	    return (-b + temp) / (2*a)
	end
	
	coeffx2 = 1
	coeffx = 2
	coeff1 = -15
	root1 = quadratic_formula(coeffx2, coeffx, coeff1)
	println(root1)
	
end

# ╔═╡ f14425eb-17da-4db9-8127-0cd763b10622
md"""
What if we had wanted to compute and return both roots? Thankfully, julia is very flexible and allows you to return as many values as you'd like (most languages are not this flexible). To do so, we simply separate the values to be returned by commas in the return statement. Let's adapt this function to return both:
"""

# ╔═╡ 7bd23cc0-9cca-44ee-a0b9-99cad8d8a346
function quadratic_formulaa(a, b, c)
    temp = sqrt(b^2 - 4*a*c)
    return (-b + temp) / (2*a), (-b - temp) / (2*a)
end

# ╔═╡ 419199d0-e867-454d-80c2-715fac5779f8
md"""
We need to make one additional modification when calling the function -- we need to store both results. We do this through a process called destructuring where we simply have multiple variables on the left side that we use to assign the different values to (need to have the same number of variables as we have values returned). For example,
"""

# ╔═╡ 7e626b8e-d32a-457f-bb7f-15d5b1fe418e
begin
	root2, root3 = quadratic_formulaa(coeffx2, coeffx, coeff1)
	println(root2)
	println(root3)
end

# ╔═╡ 93439c5a-51ec-4bbe-8961-17e7f144f2b5
md"""
#### Keyword Arguments

The examples so far have all relied on positional arguments. This means that the position (aka order) of the arguments is used to determine which argument ends up as the value of each parameter inside the function. For instance, Julia knew that 1 is supposed to be the value for a inside the function, because 1 is the first argument and a is the first parameter.

Sometimes, it can be helpful to explicitly indicate which parameter the argument should be assigned to. This is called keyword arguments and means that those arguments do not rely on the order they are passed in. You don't need to worry much about these now, but we'll see them at various points throughout the course.

Let's just look at the simple example of the quadratic formula to see what this means. When we called the function above, we passed in the values for a, b, and c in the order they were listed. We could have instead done (or any other order) because we explicitly say which value is for each parameter.

"""

# ╔═╡ 4a6ff4dd-17e8-4a73-946a-34ecc2510536
begin
	function quadratic_formulaaa(;a::Float64, b::Float64, c::Float64)
    temp = sqrt(b^2 - 4*a*c)
    return (-b + temp) / (2*a), (-b - temp) / (2*a)
end
	root4, root5 = quadratic_formulaaa(c=-15.0, a=1.0, b=2.0)
	println(root4)
	println(root5)
end

# ╔═╡ 73a56e50-0cc6-49b8-9318-bddc412b867e
md"""
Technically keyword and positional can be mixed, but for now you should assume that for most user defined functions, it is best to stick with all positional or all keyword.
"""

# ╔═╡ d6d61462-ed51-4cc3-a748-a26e8ef9e352
md"""
#### Scope in Julia
In Julia, functions have their own local scope. Variables created within a function are not visible outside of that function unless they are returned. Conversely, functions do not typically modify or even see variables from outside the function unless they are passed in as arguments.

However, in contrast to many languages, blocks (like for, while, and comprehensions) introduce their own local scope. 
"""

# ╔═╡ 4618a06f-dd76-42cf-9630-29f937377a03
md"""
#### Creating Docstrings in Julia
In Julia, a docstring is placed before the object it documents and is written inside triple double quotes. 
"""

# ╔═╡ d2b611bc-4cc1-4af0-af36-26635cd9b52c
"""
    my_function(x)

Returns the square of `x`.
"""
function my_function(x)
    return x^2
end

# ╔═╡ 60632e08-e8ca-45ea-9b43-663740eafbd4
md"""
### Built-In Functions
Above, we looked at how to create our own functions (known as user-defined functions).

There are also quite a few functions built into Julia. Some of these built-in functions are in the base part of Julia, meaning you can simply call them. We've already seen a few of these functions:

println() - prints arguments
@doc - documentation for the argument
typeof() - returns the type of the argument

Print
This function prints the arguments passed to it. It can print a single object, or it can be called with multiple objects in which case it prints all of them (by default separated by a space). For more details on this function, you can refer to the Julia documentation. As an example in Julia:
"""

# ╔═╡ 5a2ce439-3d29-4a59-a84d-ba8ec4d2f31f
begin
	x = 4
	y = 5
	println(x, " ", y)
	println(x, ",", y)
	
end

# ╔═╡ 2124ecaa-7795-47c9-a294-da31b55b1176
md"""
Type Conversion
Some of the built-in functions are used to convert between different types. For instance, Int() is designed to take its argument and turn it into an integer (by truncating towards 0).
"""

# ╔═╡ a9748c37-af06-4e4d-be26-8396ed8a89df
begin
    aa = 15.6
    bb = Int(round(aa))
    println(bb)   # This will print 16
end


# ╔═╡ ad0823d9-2bc4-4178-bce7-16de6425f0af
md"""
Likewise, there are Bool(), string(), Float64(), and Complex() to convert to boolean, string, float, and complex types, respectively.
"""

# ╔═╡ ea671010-34ee-49a5-9329-000ef99cc888
begin
	
	a_string = string(aa)
	println(typeof(aa))
	println(typeof(a_string))
	
end

# ╔═╡ 52481140-881b-4a58-8991-25e63ba3e180
md"""
Other Helpful Built-in Functions
Many of the other (non-type conversion) functions can also be useful. For now, we'll highlight a few of them:

abs() - Return the absolute value of a number (float or integer). For complex numbers, returns its magnitude.
min() - return the minimum of the arguments
max() - return the maximum of the arguments
round() - round the number to the specified number of digits
length() - returns the length of the string

Let's look at some examples:

"""

# ╔═╡ ba172feb-666c-433c-8ecd-dcb4d45fda53
begin
	u = -1.5
	v = 4
	m = 3 + 4im
	println(abs(u))
	println(abs(m))
end

# ╔═╡ f52cc086-201a-4bd5-ae1d-a2e7775ab800
begin
	println("min =", min(u, v))
	println("max =", max(u, v))
	
end

# ╔═╡ c6b62a5b-c3c6-4f06-ba94-2c62d2abf16d
begin
	w = 1342.85998348
	println(round(w, digits=2))
	
end

# ╔═╡ 8dadc608-6f77-4132-bfb5-2b84c4310993
begin
	msg = "hello how are you today"
	println(length(msg))
	
end

# ╔═╡ Cell order:
# ╠═47eef000-6ddf-11ee-109e-e56c46c419bf
# ╠═6d796144-e7ae-4d88-9611-a70e307b8ab7
# ╠═02f72ea6-478f-4bde-b70b-72ee1835501f
# ╠═0440790b-1003-4d37-bd79-081ad221362a
# ╠═263f638f-5ddb-4050-979a-5712fa866ced
# ╠═7a5ea7aa-ef63-4e80-8bd9-76475078874a
# ╠═f4d9a307-9ff8-4211-bb0a-5dce43d787a6
# ╠═30b62cc1-9cd4-40a5-9af4-1e6f85ed770c
# ╠═31b64b12-09ae-4d39-89ed-de1ea988c202
# ╠═e76c2079-b686-46a4-9c27-6471f77b0a63
# ╠═c58fb1ca-28e8-4e12-9258-492b5e5da918
# ╠═7e94797d-70bd-494b-a163-9abe031c14d9
# ╠═ac71f8ef-4555-443a-9726-984512691553
# ╠═a22a1f1c-54cc-4c01-b85b-960029ed35ba
# ╠═5c63287d-0163-4cf5-83db-aed2220cd71d
# ╠═249daf01-a2ee-41f1-a55c-2f895110ca3a
# ╠═4e5e74c0-0e7e-423c-9994-ce173dc52be5
# ╠═bcb9a4fe-3abb-4fcc-a309-e7f674740234
# ╠═1a263a7b-a056-4843-ba1b-756c64340348
# ╠═d39c3783-6c61-4935-b39a-956bc0e5f4b5
# ╠═967f2cee-7c64-4a65-bdd5-be02140d8d45
# ╠═7aa0cc56-092d-4298-8cdb-a08860aebcba
# ╠═f14425eb-17da-4db9-8127-0cd763b10622
# ╠═7bd23cc0-9cca-44ee-a0b9-99cad8d8a346
# ╠═419199d0-e867-454d-80c2-715fac5779f8
# ╠═7e626b8e-d32a-457f-bb7f-15d5b1fe418e
# ╠═93439c5a-51ec-4bbe-8961-17e7f144f2b5
# ╠═4a6ff4dd-17e8-4a73-946a-34ecc2510536
# ╠═73a56e50-0cc6-49b8-9318-bddc412b867e
# ╠═d6d61462-ed51-4cc3-a748-a26e8ef9e352
# ╠═4618a06f-dd76-42cf-9630-29f937377a03
# ╠═d2b611bc-4cc1-4af0-af36-26635cd9b52c
# ╠═60632e08-e8ca-45ea-9b43-663740eafbd4
# ╠═5a2ce439-3d29-4a59-a84d-ba8ec4d2f31f
# ╠═2124ecaa-7795-47c9-a294-da31b55b1176
# ╠═a9748c37-af06-4e4d-be26-8396ed8a89df
# ╠═ad0823d9-2bc4-4178-bce7-16de6425f0af
# ╠═ea671010-34ee-49a5-9329-000ef99cc888
# ╠═52481140-881b-4a58-8991-25e63ba3e180
# ╠═ba172feb-666c-433c-8ecd-dcb4d45fda53
# ╠═f52cc086-201a-4bd5-ae1d-a2e7775ab800
# ╠═c6b62a5b-c3c6-4f06-ba94-2c62d2abf16d
# ╠═8dadc608-6f77-4132-bfb5-2b84c4310993
