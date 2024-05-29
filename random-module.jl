### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 75266e7a-4d64-4dc5-a40e-b0b224d9d98e
using Random

# ╔═╡ a2400480-6480-11ee-20a8-097dfd3419c9
md"""
## Random Numbers

The code we have encountered and crafted thus far is deterministic in nature: each execution is identical and yields the same output. However, another prevalent need in programming is the use of random numbers. This becomes crucial as random numbers underpin stochastic simulations. Such simulations harness randomness to emulate certain processes. Examples include modeling the stock market and representing various physical, biological, and chemical phenomena. Beyond genuinely random procedures, stochastic simulations also find use in approximating solutions to issues which are otherwise challenging to resolve analytically.

Generating authentic random numbers poses a significant challenge. Pondering on how to produce them presents a conundrum – we can't direct a computer to toss a coin without explicitly defining the coin toss outcome, rendering the action deterministic. Consequently, the alternative is pseudorandom numbers, which seemingly appear random but lack true randomness. These numbers originate from pseudorandom number generators. While multiple algorithms cater to these generators, most programming languages, Julia included, furnish predefined methods for generating such pseudorandom numbers.
"""

# ╔═╡ 3d24f163-97e3-4782-9dcf-5015ccc67d85
md"""
### Random Module

In Julia, the `Random` module offers a plethora of functions dedicated to producing "random" (in essence, pseudorandom) numbers in various formats. The exhaustive list of functions can be gleaned from the official Julia documentation pertaining to the `Random` module. While we'll touch upon a handful of these functions momentarily, it's pertinent to note that a vast array caters to nuanced tasks involving randomness and spans multiple distributions.
"""

# ╔═╡ 840f144f-d5fd-4928-b866-8477e4b1819c
md"""
Examples

Before diving in, similar to other modules in Julia, we first need to bring the `Random` module into scope.
"""

# ╔═╡ 4361888c-6cf1-4b26-a9de-f24cd89f2127
md"""
Single random integer

In Julia, to produce a single random integer between `a` and `b` (inclusive), we employ the `rand` function alongside a specified range: `rand(a:b)`.

Let's simulate a coin flip using this approach, where `0` symbolizes heads and `1` stands for tails.
"""



# ╔═╡ bf97d2e6-e53b-4355-ace1-286e292771ce
begin
	# Example code for the coin flip:
	coin = rand(0:1)
	println(coin)
	
end

# ╔═╡ 3304417a-c7aa-4be4-bf57-7ba68610f32f
md"""
Each time we execute the aforementioned code, it's akin to a fresh random coin toss. To simulate numerous coin flips consecutively, we can encapsulate the code within a loop. Let's demonstrate this with 10 flips.
"""

# ╔═╡ 91d850da-8189-41d0-aff3-c19730f772b8
for i in 1:10
    coin = rand(0:1)
    println(coin)
end

# ╔═╡ 8d283754-c83d-44ca-9714-75025d922bcc
md"""
We can amalgamate this with our prior constructs to tally the number of "heads" (0s) in `n` flips.
"""

# ╔═╡ b45ca632-2633-4839-8463-6cc4af19bd43
begin
	n = 10
		num_heads = 0
		for i in 1:n
		    coin = rand(0:1)
		    if coin == 0
		        num_heads += 1
		    end
		end
		println(num_heads)
end

# ╔═╡ cbb46fcd-acb1-48ac-8559-f2533291a141
md"""
We can modify the arguments passed to the `rand` function to generate integers over a distinct range (the specific range would be contingent upon your application).
"""

# ╔═╡ 810d5489-5ed5-4872-abe2-27f61ee496a4
begin
	result = rand(1:1000)
	println(result)
end

# ╔═╡ cb2c6818-0b1e-4ed7-87f8-744463dab9fa
md"""
Real-valued Random Numbers

The prior examples showcased integer generation. However, at times, one might require numbers from real-valued distributions. Numerous distributions exist for this purpose. Amongst the most prevalent ones are:

- `rand()` within a range `[a, b]`: Yields a random floating point number in the range \[a, b\].
- `randn()`: Produces a random number drawn from a standard Gaussian distribution (mean 0 and standard deviation 1). To obtain a random number from a Gaussian distribution with mean `mu` and standard deviation `sigma`, you can use: `mu + sigma * randn()`.

Let's delve into a few illustrative examples:
"""

# ╔═╡ e5123223-ff50-4478-bd0a-7fc9dc9c5d4c
begin
	x = rand(-1.0:1.0)  # Generate a random float between -1 and 1
	println(x)
end

# ╔═╡ fa50ba3c-a4d6-416b-970d-7187c24dce9c
begin
	y = randn()  # Generate a random number from a standard Gaussian distribution
	println(y)
end

# ╔═╡ 54084dac-eb8c-42ed-b04a-43e0ba170ee5
md"""
Random Choices from Sequences

Previously, when discussing loops, we touched upon the concept of arrays and iterating over sequences. In Julia, we can harness arrays to select a random element from a predefined sequence using the `rand(seq)` function.

Let's inspect a rudimentary example to re-enact our earlier coin flip:
"""

# ╔═╡ 532ad189-b020-4278-b402-eda425c3a383
begin
	options = ['H', 'T']
	coin2 = rand(options)
	println(coin2)
end

# ╔═╡ 5c159e93-a4a1-4d4a-beaf-d7472a584dc1
begin
	options2 = [-10, -1, -0.5, 0, 0.5, 1, 10, 100]
	result2 = rand(options2)
	println(result2)
end

# ╔═╡ 1e0a58f7-c764-4589-85a8-356697c63a13
md"""
Debugging Random Code

Although nondeterminism can be advantageous for simulations, deciphering code that yields varying results upon each run can pose a debugging challenge (given the anticipated fluctuation in output). Given that these numbers are in fact pseudorandom, derived from algorithms, there typically exists an initial value termed as the 'seed' that kickstarts the generation process. By default, this seed is often anchored to a perpetually altering metric, such as the current date and time. However, in Julia, you can explicitly set this seed using the `Random.seed!(a)` function, where `a` is an integer. It's worth noting that while seeding is instrumental for debugging, it's not ideal for actual simulations as it compromises the randomness. Setting a static seed is a tool that can be exceptionally handy when debugging erratic behaviors in randomized code.
"""

# ╔═╡ 77aca63e-352d-47a6-8429-5d49cef53579
md"""
Example Application - Estimating Pi

Let's explore an example, the Monte Carlo method, which employs randomness to approximate the value of π (assuming we are unaware of π's true value).

Imagine a square with side length 1 that encompasses a circle with a radius of 0.5, centered at the coordinates (0.5, 0.5). By generating random points within the square, we can subsequently determine if they reside within the circle using the equation:
\[ (x - 0.5)^2 + (y - 0.5)^2 ≤ 0.25 \]
The fraction of points inside the circle provides an approximation for the circle's area. Given an area estimate, we can deduce an estimate for π since:
\[ \text{area} = π \times r^2 \]
Given that \( r = 0.5 \), the area is equivalent to \( \pi/4 \).

Let's delve into the code that accomplishes this:
"""

# ╔═╡ f26b49c4-8df0-4054-830b-4d05cc7d04f1
begin
	n1 = 10000
	radius = 0.5
	count_inside = 0
	
	for i in 1:n1
	    x = rand()
	    y = rand()
	    if (x - 0.5)^2 + (y - 0.5)^2 <= radius^2
	        count_inside += 1
	    end
	end
	
	proportion_inside = count_inside / n1
	pi_estimate = proportion_inside / radius^2
	println(pi_estimate)
	
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "fa3e19418881bf344f5796e1504923a7c80ab1ed"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
"""

# ╔═╡ Cell order:
# ╠═a2400480-6480-11ee-20a8-097dfd3419c9
# ╠═3d24f163-97e3-4782-9dcf-5015ccc67d85
# ╠═840f144f-d5fd-4928-b866-8477e4b1819c
# ╠═75266e7a-4d64-4dc5-a40e-b0b224d9d98e
# ╠═4361888c-6cf1-4b26-a9de-f24cd89f2127
# ╠═bf97d2e6-e53b-4355-ace1-286e292771ce
# ╠═3304417a-c7aa-4be4-bf57-7ba68610f32f
# ╠═91d850da-8189-41d0-aff3-c19730f772b8
# ╠═8d283754-c83d-44ca-9714-75025d922bcc
# ╠═b45ca632-2633-4839-8463-6cc4af19bd43
# ╠═cbb46fcd-acb1-48ac-8559-f2533291a141
# ╠═810d5489-5ed5-4872-abe2-27f61ee496a4
# ╠═cb2c6818-0b1e-4ed7-87f8-744463dab9fa
# ╠═e5123223-ff50-4478-bd0a-7fc9dc9c5d4c
# ╠═fa50ba3c-a4d6-416b-970d-7187c24dce9c
# ╠═54084dac-eb8c-42ed-b04a-43e0ba170ee5
# ╠═532ad189-b020-4278-b402-eda425c3a383
# ╠═5c159e93-a4a1-4d4a-beaf-d7472a584dc1
# ╠═1e0a58f7-c764-4589-85a8-356697c63a13
# ╠═77aca63e-352d-47a6-8429-5d49cef53579
# ╠═f26b49c4-8df0-4054-830b-4d05cc7d04f1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
