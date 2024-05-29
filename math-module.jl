### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ ce2e2860-648a-11ee-0dc3-6339b6a86dd7
md"""
## Math Module 
In Julia, most of the basic mathematical functions are already built into the base language, but for more advanced mathematical operations and constants, you can use various standard libraries or modules. One frequently used module for more advanced mathematical operations is the `Math` module in packages or the built-in special functions.

While the base language provides most of the basic arithmetic, the special functions provided by Julia can be accessed without any additional imports.

For a comprehensive list of functions and constants in Julia's mathematical ecosystem, refer to the official documentation.
"""

# ╔═╡ a949a541-d791-4638-9e7d-98c2a488982b
md"""
### Importing Modules
To access functions and features from external Julia packages, we first need to ensure that the package is installed and then bring it into scope using the `using` or `import` keyword. As we delve deeper into Julia, we'll find ourselves using more packages. By convention, it's a good practice to place all `using` or `import` statements at the beginning of your script or notebook.
"""

# ╔═╡ b7b71698-5a6c-4abc-8b90-f8eabd710477
md"""
In Julia, you don't need to import a math module like you do in Python since most 
of the basic mathematical functions are already available in the base language.
"""

# ╔═╡ b9d2c423-2f19-4ebf-998e-2c59370c1fce
md"""
#### Math Functions
We'll highlight some commonly used mathematical functions in Julia here:

- `floor(x)` - return the largest integer less than or equal to x
- `ceil(x)` - return the smallest integer greater than or equal to x
- `factorial(x)` - return the factorial of x
- `exp(x)` - return the exponential function e^x
- `log(x)` - returns the natural logarithm of x
- `log10(x)` - returns the base-10 logarithm of x
- `log2(x)` - returns the base-2 logarithm of x
- `cos(x)` - returns cosine of x in radians
- `sin(x)` - returns sine of x in radians
- `tan(x)` - returns tangent of x in radians

In Julia, these functions are part of the base language and do not need any prefix or namespace to be accessed, unlike Python's `math` module. This makes their usage straightforward without the need for qualifiers.
"""

# ╔═╡ bd889e60-4698-42a5-aaa6-70c64c7b58dc
begin
	x = 2.89
	y = 4
	println(factorial(y))  # Outputs: 24
	println(floor(x))      # Outputs: 2.0
	println(ceil(x))       # Outputs: 3.0
	
end

# ╔═╡ 3119c0ae-07db-4e3a-b2c4-19f4014fdbd4
md"""
### Math Constants 
In addition to the functions already discussed, Julia also provides several mathematical constants as part of its base language. The most commonly used ones are:

- `π` (or `pi`) - mathematical constant representing the ratio of a circle's circumference to its diameter
- `ℯ` (or `e`) - mathematical constant representing the base of the natural logarithm

In Julia, these constants are part of the base language and can be accessed directly without any prefix or namespace. For example:
"""

# ╔═╡ 134471b9-ccf4-4f49-b93e-31927cb2c583
begin
	println(π)  # Outputs: 3.141592653589793
	
	r = 2
	area = π * r^2
	println(area)  # Outputs the area using the value of π
	
end

# ╔═╡ Cell order:
# ╠═ce2e2860-648a-11ee-0dc3-6339b6a86dd7
# ╠═a949a541-d791-4638-9e7d-98c2a488982b
# ╠═b7b71698-5a6c-4abc-8b90-f8eabd710477
# ╠═b9d2c423-2f19-4ebf-998e-2c59370c1fce
# ╠═bd889e60-4698-42a5-aaa6-70c64c7b58dc
# ╠═3119c0ae-07db-4e3a-b2c4-19f4014fdbd4
# ╠═134471b9-ccf4-4f49-b93e-31927cb2c583
