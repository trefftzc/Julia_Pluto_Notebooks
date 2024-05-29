### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 3d4f96d2-5f0e-44cb-a773-badd79191715
md"""
# Conditionals
### Logical Operators
"""

# ╔═╡ cb92b20b-09f8-4ffb-9ff7-4322e7e4e9f7
md"""
Logical Operators in Julia:

Logical operators are tools for combining boolean values. Remember, in Julia, a boolean can be either `true` or `false`. Two boolean values can be combined using one of the three logical operators:

& (or `&&` for short-circuiting) : Returns `true` if both operands are `true`.
| (or `||` for short-circuiting) : Returns `true` if at least one of the operands is `true`.
! : Returns `true` if the operand is `false`.

"""

# ╔═╡ c7911273-9a1a-4348-9955-d9619b0aa416
md"""
#### Examples
Let's look at a few examples. Note that for operators with 2 operands, the order of the operands does not matter.

Examples: &&
"""

# ╔═╡ 6248395f-059a-43e0-9703-ab20524e5797
begin
    tvar1 = true
    tvar2 = true
    fvar1 = false
    fvar2 = false

    println(tvar1 && tvar2)
    println(tvar1 && fvar1)
    println(fvar1 && tvar1)
end

# ╔═╡ 31186572-d98f-4ded-ab2a-a6b3133fe6a7
md"""
##### Examples: || 
"""

# ╔═╡ 62658c25-22ff-4618-ba03-d29a4fade9a7
begin
	println(tvar1 || tvar2)
	println(tvar1 || fvar2)
	println(fvar1 || fvar2)
end

# ╔═╡ 631ba48f-149d-4486-b656-cf79a2474599
md"""
##### Examples: !
"""

# ╔═╡ b53699c3-9120-4220-b627-1366db61f6d3
begin
	println(!tvar1)
	println(!fvar1)
end

# ╔═╡ ade415d5-bcd0-441f-a0c1-d7c6be367848
println(!fvar1 && !fvar2)

# ╔═╡ 3889dde7-3aa4-438f-9cea-f2abd132dfa4
md"""
#### Combinations
Like with the numerical operators, we can combine multiple logical operations together. Like with the previously discussed operators for numerical types these operators have a precedence. From highest precedence to lowest precedence: !, &&, ||.

Let's look at a few examples:
"""

# ╔═╡ 629fc37f-e6d1-4b72-a3e0-2f2ac255bb30
begin
	println(!fvar1 || tvar1 && tvar2)
	println(!(fvar1 || tvar1 && tvar2))  # added parentheses
end

# ╔═╡ 6e0648eb-1389-4b1e-a668-cb19bb590680
md"""
#### Boolean Expressions in Julia:

While logical operators are foundational, their real utility shines when combined with boolean expressions. A boolean expression evaluates to either `true` or `false`. In Julia, boolean expressions commonly arise from comparisons between values using one of the following comparison operators: `==`, `!=`, `<`, `>`, `<=`, `>=`. These comparisons can be made between variables, literal values, or the results of other operations.

- `val1 == val2` : True when `val1` is equal to `val2`
- `val1 != val2` : True when `val1` is not equal to `val2`
- `val1 < val2` : True when `val1` is less than `val2`
- `val1 <= val2` : True when `val1` is less than or equal to `val2`
- `val1 > val2` : True when `val1` is greater than `val2`
- `val1 >= val2` : True when `val1` is greater than or equal to `val2`

**Note:** It's crucial to remember that equality is tested using two equal signs (`==`). The single `=` sign is reserved for assignment in Julia. A frequent pitfall, especially for beginners, is attempting to use a single `=` for comparisons. Always be cautious of this.

"""

# ╔═╡ a5c1c38b-e6b0-4e56-a220-ba0cfa224002
md"""
Note: It's important to remember that equality is tested with two equal signs (==). The single equal sign (=) is used for assignment statements. Using a single equal sign for comparison is a common mistake, so be cautious and use == when comparing values.
"""

# ╔═╡ a386e3b8-5941-47c1-ad4e-e850774c7fd1
begin
	x = 4
	y = 8
	
	# Check if x is equal to y
	println(x == y)
	
	# Check if x is not equal to y
	println(x != y)
	
	# Check if x is less than 4
	println(x < 4)
	
	# Check if x is less than or equal to 4
	println(x <= 4)
	
	# Check if x is greater than y
	println(x > y)
	
	# Check if y is greater than or equal to 8
	println(y >= 8)
end

# ╔═╡ 14baf58a-02bb-453a-9220-bb9b9a6534b2
md"""
This code will print false for the first two println statements because x is not equal to y, and it will print true for the rest of the println statements based on the comparisons between x and y.

###### Comparison with is:

Julia has an additional comparison operator called is. It differs from == in
that it checks if the underlying objects are the same object, not just equal to one another. The best rule of thumb is to use is only when comparing to nothing (equivalent to None in some other languages).

###### Combining Boolean Expressions:

Boolean expressions, which evaluate to boolean values (either true or false), 
can be combined using the logical operators discussed earlier. For instance, consider the following code snippet that checks if x is both less than 5 and even by combining multiple boolean expressions with the && (and) operator:
"""

# ╔═╡ 49664433-c661-4d8d-a556-8383cef60d06
    println(x < 5 && x % 2 == 0)

# ╔═╡ cfccf754-9a42-49e0-a5f0-0ac3407f5c92
md"""
##### Conditionals
After building the concept of boolean expressions using comparison and logical operators, the next step is to use them in our code.
Typically, we use boolean expressions as conditions to "check" something and change the program's behavior based on the result.
For example, at an amusement park, they might check if a rider is taller than 48 inches. If so, the rider can go on the ride; otherwise, they cannot.
Similarly, in schools, prerequisites are checked before allowing students to register for a class. 
These are examples of conditionals where program flow changes based on the result of a condition.

In code, we can alter what code is executed by evaluating conditions. 
These evaluations are performed using conditional statements, including if, elseif, and else statements, along with associated code blocks.
The general form of these conditional statements is as follows:

if condition1
    # Code to execute if condition1 is true
elseif condition2
    # Code to execute if condition1 is false but condition2 is true
else
    # Code to execute if neither condition1 nor condition2 is true
end

You can have multiple elif (else if) statements to check multiple conditions in sequence.

"""

# ╔═╡ 98866330-7125-4107-a339-d248d3339716
begin
	a = 6
	
	if a % 2 == 0
	    println("even")
	end
end

# ╔═╡ 3b06d514-1fbc-473d-95a3-420f8ef0a0ac
begin
	b = 5
	
	if b % 2 == 0
	    println("even")
	else
	    println("odd")
	end
end

# ╔═╡ 2f912a82-e6af-4e72-a475-f564738e21bd
md"""
Let's look at a slightly more complex example. Suppose we wish to write a function that checks prints out a message of congratulations based on who wins a football game. A game can end in one of three ways:

- TeamA wins
- TeamB wins
- They tie
"""

# ╔═╡ f83a563d-306b-4340-850c-609b116fadd8


begin
	# Define a function congrats that takes two scores as arguments
	function congrats(scoreA, scoreB)
	    if scoreA > scoreB
	        println("Congrats Team A")
	    elseif scoreA < scoreB
	        println("Congrats Team B")
	    else
	        println("Team A and Team B tied :(")
	    end
	end
	
	# Call the congrats function with different scores
	congrats(24, 27)
	congrats(18, 18)
	congrats(21, 18)
end

# ╔═╡ f2a53223-1c2a-4f86-9b38-b959f379ae95
begin
	year = 2000
	
	if year % 4 == 0
	    if year % 100 != 0
	        println(year, " is a leap year")
	    else
	        if year % 400 == 0
	            println(year, " is a leap year")
	        end
	    end
	end
end

# ╔═╡ 16d24c50-3ba9-4039-a72a-03f2426b358b
begin
	c = 6
	d = 0
	
	# Check if y > 0 before evaluating c/d > 2
	if d > 0 && c / d > 2
	    println("Both conditions are true")
	else
	    println("At least one condition is false (or y is zero)")
	end
end

# ╔═╡ e2618e0f-0850-4110-b149-a08b52f771d0
md"""
##### Short-Circuiting
When working with logical expressions, the order of operands can be important, especially when avoiding potential errors like division by zero.

Short-circuiting is a behavior where, if the result of an expression can be determined based on a part of the expression without evaluating the rest, the evaluation stops.

This can be helpful when you want to avoid errors or unnecessary calculations.
"""

# ╔═╡ 51ddb478-80f6-4256-8f75-a6c69d2c0067
begin
	e = 6
	f = 0
	
	# Using short-circuiting to avoid division by zero error
	if f > 0 && e / f > 2
	    println("Both conditions are true")
	else
	    println("At least one condition is false (or f is zero)")
	end
	
end

# ╔═╡ Cell order:
# ╠═3d4f96d2-5f0e-44cb-a773-badd79191715
# ╠═cb92b20b-09f8-4ffb-9ff7-4322e7e4e9f7
# ╠═c7911273-9a1a-4348-9955-d9619b0aa416
# ╠═6248395f-059a-43e0-9703-ab20524e5797
# ╠═31186572-d98f-4ded-ab2a-a6b3133fe6a7
# ╠═62658c25-22ff-4618-ba03-d29a4fade9a7
# ╠═631ba48f-149d-4486-b656-cf79a2474599
# ╠═b53699c3-9120-4220-b627-1366db61f6d3
# ╠═ade415d5-bcd0-441f-a0c1-d7c6be367848
# ╠═3889dde7-3aa4-438f-9cea-f2abd132dfa4
# ╠═629fc37f-e6d1-4b72-a3e0-2f2ac255bb30
# ╠═6e0648eb-1389-4b1e-a668-cb19bb590680
# ╠═a5c1c38b-e6b0-4e56-a220-ba0cfa224002
# ╠═a386e3b8-5941-47c1-ad4e-e850774c7fd1
# ╠═14baf58a-02bb-453a-9220-bb9b9a6534b2
# ╠═49664433-c661-4d8d-a556-8383cef60d06
# ╠═cfccf754-9a42-49e0-a5f0-0ac3407f5c92
# ╠═98866330-7125-4107-a339-d248d3339716
# ╠═3b06d514-1fbc-473d-95a3-420f8ef0a0ac
# ╠═2f912a82-e6af-4e72-a475-f564738e21bd
# ╠═f83a563d-306b-4340-850c-609b116fadd8
# ╠═f2a53223-1c2a-4f86-9b38-b959f379ae95
# ╠═16d24c50-3ba9-4039-a72a-03f2426b358b
# ╠═e2618e0f-0850-4110-b149-a08b52f771d0
# ╠═51ddb478-80f6-4256-8f75-a6c69d2c0067
