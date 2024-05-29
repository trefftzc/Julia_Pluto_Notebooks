### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 0639e686-52eb-4041-be8d-1d1b0aa70c0f
using Random

# ╔═╡ 0b73ecf0-5bbc-11ee-1b47-6d66933f6971
#In Julia, the equivalent of Python lists is called an Array. Arrays are also ordered, mutable collections of objects that can store various data types, including strings, numerical types, booleans, and other arrays, similar to Python lists.

# ╔═╡ cd407dc6-fbd0-45c7-a871-cb359f6eafd9
# Basic Idea:
# In Julia, we use arrays to work with collections of data. An array is an ordered, mutable collection of objects.
# Mutable means that we can change the contents of the array, such as adding or removing elements.

# Julia arrays can store various data types, including strings, numerical types, booleans, and other arrays.
# Unlike some other languages, Julia arrays have no set size, and we can dynamically add or remove elements as needed.

# ╔═╡ 2bf54ecb-6ce8-4dbe-8b51-90bb38c0c63a
begin
	# List Creation:
	# In Julia, we create arrays by enclosing elements in square brackets [].
	
	# For example, we can create an array of strings with color names:
	colors = ["orange", "red", "green", "blue", "yellow"]
	println(colors)
	println(typeof(colors))
	
end

# ╔═╡ 7ef5ce1d-f8e4-44eb-854c-1f7b8a719f00
begin
	#Lists are not limited to strings, however; we could also have a list with numerical values:
	# Define an array of heights
	heights = [67, 62.5, 69, 71, 72.5, 75]
	
	# Print the array
	println(heights)
end

# ╔═╡ e2c175c8-d2f6-4512-a61a-7a0ba543965d
#Notice that the previous list contains both float and int values. We could also have a list with an even wider range of types. For example, the following list has an int for its first element, a str for its second element, another list as its 3rd element, and a bool as its fourth element.

# ╔═╡ 8061a35a-56c0-49c4-9a5a-a4a0deb66fe0
begin
	# Define a mixed array
	mixed_list = [10, "lays bbq", [3.99, 4.49, 2.99], true]
	
	# Print the mixed array
	println(mixed_list)
end

# ╔═╡ 1ad75f1f-4c2b-48d7-bf2b-acaf290624be
#In Julia, you can create an empty array by using square brackets with no elements inside, just like in Python. Here's the equivalent Julia code:

# ╔═╡ 6772d3f5-2887-418c-af20-0ea231c531af
# ╠═╡ disabled = true
#=╠═╡
# Create an empty array in Julia
countries = []
  ╠═╡ =#

# ╔═╡ a04bb6da-045a-42a4-868d-4e3b591ea171
#In Julia, you can create a range of numbers using the 1:10 syntax and then convert it into an array using the collect() function to achieve the same result. 

# ╔═╡ d2bfe3c6-ccd7-4da6-a51b-d409ac9ba592
begin
	# Create a range and convert it to an array
	numbers = collect(1:10)
	
	# Print the array
	println(numbers)
	
end

# ╔═╡ 2c9288f8-d235-4239-b50a-c8f969678d07
#In Julia, you can check if an element exists in an array using the in operator as well.

# ╔═╡ 71506b30-e88d-4b5a-b28b-e9d57cd85e59
begin
	# Define the array
	countries = ["Italy", "Mexico", "Canada", "USA", "South Africa", "Greece", "Spain"]
	
	# Check if an element exists in the array
	println("Spain" in countries)
	println("Australia" in countries)
	
end

# ╔═╡ 99a71dc4-cb75-4d5d-9131-6e598858439d
begin
	#In Julia, you can create an empty array and add items to it using the push! function
	#Push method
	
	# Add items to the array
	push!(countries, "Italy")
	push!(countries, "Mexico")
	push!(countries, "Canada")
	push!(countries, "USA")
	push!(countries, "South Africa")
	push!(countries, "Greece")
	push!(countries, "Spain")
	
	# Print the array
	println(countries)
end

# ╔═╡ c831cf0b-f199-4666-857d-2053abd1545c
#In Julia, you can concatenate arrays using the vcat() function.

# ╔═╡ ef253489-fc45-4615-9c1c-511418f13750
begin
	# Define two arrays
	list1 = [-1, 0, 1]
	list2 = [2, 3, 4]
	
	# Concatenate the arrays
	list3 = vcat(list1, list2)
	
	# Print the original arrays and the concatenated array
	println(list1)
	println(list2)
	println(list3)
	
end

# ╔═╡ c8a18f7d-74ce-430b-b3d7-7fe1e5d023b7
#In Julia, you can repeat an array using the repeat() function.

# ╔═╡ 04efc640-0728-46d9-8cc7-0f508d94f5f3
begin
	
	# Repeat the array three times
	repeated = repeat(list1, 3)
	
	# Print the repeated array
	println(repeated)
	
end

# ╔═╡ e0053d27-ad77-4682-8c84-c37f86e9d850
#In Julia, you can access individual elements in an array using square brackets as well. However, indexing in Julia starts at 1, not 0 as in Python. Here's how you can access elements in a Julia array

# ╔═╡ 84ad8d12-67dd-4106-bad9-2601f1df379a
begin
	
	# Access individual elements by index
	println(countries)
	println(countries[1])  # Access the 1st element (index 1)
	println(countries[2])  # Access the 2nd element (index 2)
	
end

# ╔═╡ e5e5343c-e5e0-4371-9233-ae239b976116
#In Julia, you can use index notation to set a specific element in an array as well, and the index notation also starts at 1. Here's how you can modify an element in a Julia array

# ╔═╡ 28202373-133f-495a-a6bb-560aa8829d58
begin
	# Modify the 3rd element (index 3)
	countries[3] = "Argentina"
	
	# Print the updated array
	println(countries)
end

# ╔═╡ d9eb6741-b448-4480-8954-f126213a7552
#n addition to positive indices (which start at 0 with the beginning of the list), Julia also allows you to use negative indices, which work from the back of the list where [-1] is the last item, [-2] is the 2nd to last item, etc.

# ╔═╡ 559d8b91-e651-4df2-ba50-9d1da131d371
begin
	# Access the last element using negative index
	println(countries[end])  # Prints the last element
	
	# Access the second-to-last element using negative index
	println(countries[end - 1])  # Prints the second-to-last element
end

# ╔═╡ 874872e1-4021-41f5-9a3a-e9b39b042674
begin
	#In Julia, you can work with lists of lists like this.
	# Define a list of lists (nested list)
	cities = [["Grand Rapids", "Detroit", "Traverse City"],
	          ["Chicago", "Urbana-Champaign", "Peoria"],
	          ["San Diego", "San Francisco", "Los Angeles", "Santa Barbara"]]
	
	# Access the entire sub-list at index 3
	println(cities[3])  # Prints ["San Diego", "San Francisco", "Los Angeles", "Santa Barbara"]
	
	# Access an element within a sub-list using double indexing
	ca = cities[3]
	println(ca[2])  # Prints "San Francisco"
	
end

# ╔═╡ ae68ed24-79e0-40c0-8377-5f2eceaa054b
#In Julia, you can achieve the same result by using multiple square brackets for indexing within nested lists, 

# ╔═╡ c2740605-8731-432d-a319-af344b956b0d
begin
		# Access an element within a sub-list using multiple indices
	println(cities[3][2])  # Prints "San Francisco"
	
end

# ╔═╡ ab1a25c0-8eac-4626-866e-c3c00fb02dcd
#Slicing
#In Julia, you can perform slicing on arrays using similar syntax as in Python.

# ╔═╡ fd78989a-2fd4-46ff-824f-d5139b0cce62
begin
	# Slice from index 1 (inclusive) to 4 (exclusive)
	println(countries[2:4])  # Prints ["Mexico", "Canada", "USA"]
	
	# Slice with a stride of 2
	println(countries[2:4:2])  # Prints ["Mexico", "USA"]
end

# ╔═╡ acc1ab23-e13c-450a-b76f-303402c962b0
begin
	# Slice with negative start and stop
	println(countries[end-1:-1:1])  # Prints ["Greece", "South Africa", "USA", "Canada", "Mexico"]
	
	# Slice with negative stride to reverse the list
	println(countries[end:-1:1])  # Prints ["Spain", "Greece", "South Africa", "USA", "Canada", "Mexico", "Italy"]
	
end

# ╔═╡ 0fd70abb-c1d7-43f8-bfed-3acde21d8b8f
#Additionally, either (or both) start and stop can be left empty:

#empty start -> start at the beginning
#empty end -> go until very end

# ╔═╡ b7d41a18-32fe-46d1-9c24-73282b694214
begin
	# Slice from the beginning to the end
	println("all but first =", countries[2:end])  # Prints ["Mexico", "Canada", "USA", "South Africa", "Greece", "Spain"]
	
	# Slice from the beginning to all but the last element
	println("all but last =", countries[1:end-1])  # Prints ["Italy", "Mexico", "Canada", "USA", "South Africa", "Greece"]
	
	# Reverse the list
	println("reversed =", reverse(countries))  # Prints ["Spain", "Greece", "South Africa", "USA", "Canada", "Mexico", "Italy"]
	
end

# ╔═╡ b7c5a894-4901-40fa-b3f4-0555b0d9c1f3
#In Julia, you can achieve a similar operation using a for loop with the enumerate() function to get both the indices and values of a list. Here's how you can square the numbers in a list:

# ╔═╡ 0c025a2d-75b1-45e8-9f00-e5fa9167a258
begin
	# Define a list of numbers
	nums = [-2, 1, 2, 4]
	
	# Loop through the list using enumerate to get both indices and values
	for (i, num) in enumerate(nums)
	    nums[i] = num^2
	end
	
	# Print the updated list
	println(nums)
	
end

# ╔═╡ 798f9fb2-c00d-4b5d-8a7b-9f455ee70c9e
#In Julia, you can achieve the same result using list comprehensions, which are a concise and elegant way to create lists by applying an operation to each element in a range or another iterable. Here's how you can create a list of squares for numbers up to 6 using a list comprehension:

# ╔═╡ ab95d9a1-8049-4182-b466-8ae96d30ff69
begin
	# Create a list of squares for numbers up to 6
	lstA = [i^2 for i in 0:6]
	
	# Print the list
	println(lstA)
	
end

# ╔═╡ 5ae34092-9e79-486f-a6ae-dadd02a64a5a
#In Julia, you can achieve the same result using a list comprehension, which is a concise and elegant way to create lists by applying an operation to each element in a range or another iterable. Here's how you can create a list of squares for numbers up to 6 using a list comprehension:

# ╔═╡ 0dee633a-07e8-4fc7-aea3-fa8608f7cc41
begin
	# Create a list of squares for numbers up to 6
	lstB = [x^2 for x in 0:6]
	
	# Print the list
	println(lstB)
	
end

# ╔═╡ adcf7fac-92d8-4a4f-8ecb-c05b391b487c
#In Julia, you can use list comprehensions with conditionals in a similar way to Python.

# ╔═╡ e627a3e0-4ee8-4a5d-b3a0-b0425d6ebe72
begin
	# Create a list of squares that are odd for numbers up to 6
	lstC = [x^2 for x in 0:6 if x % 2 == 1]
	
	# Print the list
	println(lstC)
	
end

# ╔═╡ e7780e39-f0c9-41f4-a528-4da814550f9f


# ╔═╡ c98a577a-2076-42f4-b548-6ff9336c9980


# ╔═╡ 15c4d5e3-42af-4236-8d56-96b14e66f93a
begin
	# Define an array
	counts = [30, 25, 10, 14, 6]
	
	# Calculate the number of elements in the array
	num_elements = length(counts)
	println("Number of elements =", num_elements)
	
	# Calculate the sum of the elements in the array
	array_sum = sum(counts)
	println("Sum =", array_sum)
	
	# Find the minimum and maximum elements in the array
	array_min = minimum(counts)
	array_max = maximum(counts)
	println("Min =", array_min)
	println("Max =", array_max)
	
end

# ╔═╡ 3d392bb6-3469-4bb4-b745-55520f5ea310
begin
	#In Julia, you can use similar methods to manipulate arrays (Julia's equivalent of Python lists).
	# Define an array
	names = ["Matt", "Luke", "Julia", "Miles", "Alice", "Paul", "Matt", "Mia"]
	
	# Add an element to the end of the array
	push!(names, "Michelle")
	println(names)
	
	# Insert an element at a specific index
	insert!(names, 2, "John")
	println(names)
	
end

# ╔═╡ cb1927d8-84e5-4fde-ae79-acab60862496
#In Julia, you can use similar methods to remove elements from arrays. Here are the equivalent methods for removing elements from an array in Julia:

#Removing Elements:
#splice!(array, index): Removes and returns the element at the specified index.
#filter!(x -> x != element, array): Removes all elements equal to the specified element from the array.

# ╔═╡ 75705798-4f72-4cda-9129-ce7d3554487c
begin	
	# Remove and return an element at a specific index
	removed = splice!(names, 3)
	println(removed)
	println(names)
	
	# Remove all occurrences of a specific element
	filter!(x -> x != "Luke", names)
	println(names)
	
end

# ╔═╡ defe3d22-2e83-45b3-a048-a5c127844a2b
begin
	#Finding the Index:
	
	#To find the index of the first element equal to x, you can use findfirst(isequal(x), array).
	#Sorting:
	
	#To sort an array in place, you can use sort!(array).
	#Counting Occurrences:
	
	#To count the number of times x occurs in an array, you can use count(==(x), array).
	#Copying:
	
	#To make a copy of an array, you can use the copy() function.
	
	
	# Finding the index of an element
	location = findfirst(==( "Mia"), names)
	println(location)
	
	# Sorting the array in place
	sort!(names)
	println(names)
	
	# Counting occurrences of an element
	count_matt = count(==( "Matt"), names)
	println(count_matt)
	
	# Making a copy of the array
	names_copy = copy(names)
	println(names_copy)
	
end

# ╔═╡ a53d2b26-69ef-44c9-8e69-cffbcb7691d2
#In Julia, you can check if two variables refer to the same object by comparing their memory addresses using the pointer function. If two variables reference the same object, their memory addresses will be the same. Here's how you can do it:

# ╔═╡ 63d635ee-9f54-4545-b00a-b16ea5c9883e
begin
a = 1
b = a

println(a === b)

b = 2

println(a === b)	
end

# ╔═╡ 2e707bdc-6466-415f-8d18-dc6375b54c2b
#In Julia, you can achieve similar behavior with arrays, but you'll need to be aware of the differences in how references and copying work.

# ╔═╡ 173caa6f-3e11-4f62-9481-f0dd2d7c4ac7
begin
	lsta = [10, 12, 14]  # Create an array lsta
	lstb = lsta         # Create a reference lstb that points to the same array as lsta
	println(lsta)       # Print the array lsta
	println(lstb)       # Print the array lstb (which is the same as lsta)
	println(pointer(lsta), pointer(lstb), lsta === lstb)  # Print their pointers and check if they are the same object
	lstb[1] = 8         # Modify the array using lstb
	println(lsta)       # Print the modified array lsta
	println(lstb)       # Print the modified array lstb (which is the same as lsta)
	
end

# ╔═╡ 27a561f0-14da-44da-9c8a-6cf9fcea391a
#To achieve a similar effect in Julia, you would need to use mutable objects, such as arrays, and pass them as arguments to functions.

# ╔═╡ 9256d43c-73f8-4a1f-be26-7f99f2cd1778
begin
	function foo!(val1, val2)
	    val1[] = val1[] * 2
	    val2[] = val2[] * 2
	end
	
	c = [3]
	d = [4]
	foo!(c, d)
	println(c[1], " ", d[1])
	
end

# ╔═╡ d27baca2-250a-4c26-82c5-3d4383229ba5
begin
	function bar!(lst1, lst2)
	    lst1[1] = "it changed"
	    lst2 = [7, 8, 9]
	end
	
	alist = ["1", "2", "3"]
	blist = ["4", "5", "6"]
	bar!(alist, blist)
	println(alist)
	println(blist)
	
end

# ╔═╡ 23e95ce7-cc2e-4b32-ae2b-d9a5104d1324
#Special Functions with Lists - Revisiting Random Numbers

# ╔═╡ eaf24d52-bf92-4fe6-8aa9-cfd7c0aefb16
#In Julia, you can achieve a similar random sampling without replacement using the randperm function to generate random indices and then select elements from the list accordingly. Here's how you can do it:

# ╔═╡ cb03f6ae-f7a3-4b78-97e3-0e34a5cd13d8
begin
	bag = ['r', 'r', 'b', 'g', 'o', 'o']
	n = 3
	
	# Generate random indices without replacement
	indices = randperm(length(bag))[1:n]
	
	# Select elements from the list using the generated indices
	marbles = [bag[i] for i in indices]
	
	println(marbles)
	
end

# ╔═╡ 4273e03f-2590-41e2-ada5-ee62f6123b21
#In Julia, you can achieve random sampling without replacement from a consecutive range of integers using the randperm function. Here's how you can do it for your example:

# ╔═╡ a7158cbb-f86c-4ab8-afeb-894d6868e3b2
begin
	# Define the range of integers
	start = 1
	stop = 100
	
	# Number of samples to select
	m = 20

	# Create a random number generator
    rng = Random.default_rng()
	
	# Generate random indices without replacement
	indices2 = randperm(rng, stop - start + 1)[1:m]
	
	# Map the indices to the desired range of integers
	nums2 = start .+ indices2 .- 1
	
	println(nums2)
end

# ╔═╡ 84e3bd68-2c0d-4d1d-a750-6e4b21269d08
#Random Choices with Replacement

# ╔═╡ 62ae4990-62b4-49d0-a2e8-e9768cf79e75
#In Julia, you can achieve similar functionality using the rand() function. Here's how you can simulate rolling 8 10-sided dice in Julia:

# ╔═╡ 9f7d0d47-c752-44da-a66a-00b6c3439303
begin
	# Define the number of dice and sides
	num_dice = 8
	num_sides = 10
	
	# Simulate rolling the dice
	rolls = rand(1:num_sides, num_dice)
	
	# Print the results
	println(rolls)
	
end

# ╔═╡ 66921d6c-cadd-4868-a458-d916a212a6f6
#In Julia, you can achieve similar functionality to the Python random.choices function with weights using the Random.choices() function. Here's how you can simulate 10 flips of an unfair coin that lands heads 80% of the time and tails 20% of the time in Julia:

# ╔═╡ 0e11f520-eb8e-4dac-9cc7-87aef8e7ee00
begin
	# Define the choices and their weights
	choices = ['H', 'T']
	weights = [0.8, 0.2]
	
	# Simulate the coin flips
	flips = [choices[findfirst(x -> x > rand(), cumsum(weights))][1] for _ in 1:10]
	
	# Print the results
	println(flips)
	
end

# ╔═╡ e814e738-1684-4299-bd06-239df827fe45
#Randomly Permuting Order of Items

# ╔═╡ 90113e79-6ed7-4469-aee6-c51520b3454d
begin

# Define a deck of cards (ignoring suit)
cards = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
deck = [card for card in cards for _ in 1:4]

# Shuffle the deck in-place
shuffle!(deck)

# Print the shuffled deck
println(deck)
end

# ╔═╡ 1605f8d9-f209-4f7f-98b0-51331a348d8e
begin
	# Shuffle the deck in-place
	shuffle!(deck)
	
	# Print the shuffled deck
	println(deck)
	
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
# ╠═0b73ecf0-5bbc-11ee-1b47-6d66933f6971
# ╠═cd407dc6-fbd0-45c7-a871-cb359f6eafd9
# ╠═2bf54ecb-6ce8-4dbe-8b51-90bb38c0c63a
# ╠═7ef5ce1d-f8e4-44eb-854c-1f7b8a719f00
# ╠═e2c175c8-d2f6-4512-a61a-7a0ba543965d
# ╠═8061a35a-56c0-49c4-9a5a-a4a0deb66fe0
# ╠═1ad75f1f-4c2b-48d7-bf2b-acaf290624be
# ╠═6772d3f5-2887-418c-af20-0ea231c531af
# ╠═99a71dc4-cb75-4d5d-9131-6e598858439d
# ╠═a04bb6da-045a-42a4-868d-4e3b591ea171
# ╠═d2bfe3c6-ccd7-4da6-a51b-d409ac9ba592
# ╠═2c9288f8-d235-4239-b50a-c8f969678d07
# ╠═71506b30-e88d-4b5a-b28b-e9d57cd85e59
# ╠═c831cf0b-f199-4666-857d-2053abd1545c
# ╠═ef253489-fc45-4615-9c1c-511418f13750
# ╠═c8a18f7d-74ce-430b-b3d7-7fe1e5d023b7
# ╠═04efc640-0728-46d9-8cc7-0f508d94f5f3
# ╠═e0053d27-ad77-4682-8c84-c37f86e9d850
# ╠═84ad8d12-67dd-4106-bad9-2601f1df379a
# ╠═e5e5343c-e5e0-4371-9233-ae239b976116
# ╠═28202373-133f-495a-a6bb-560aa8829d58
# ╠═d9eb6741-b448-4480-8954-f126213a7552
# ╠═559d8b91-e651-4df2-ba50-9d1da131d371
# ╠═874872e1-4021-41f5-9a3a-e9b39b042674
# ╠═ae68ed24-79e0-40c0-8377-5f2eceaa054b
# ╠═c2740605-8731-432d-a319-af344b956b0d
# ╠═ab1a25c0-8eac-4626-866e-c3c00fb02dcd
# ╠═fd78989a-2fd4-46ff-824f-d5139b0cce62
# ╠═acc1ab23-e13c-450a-b76f-303402c962b0
# ╠═0fd70abb-c1d7-43f8-bfed-3acde21d8b8f
# ╠═b7d41a18-32fe-46d1-9c24-73282b694214
# ╠═b7c5a894-4901-40fa-b3f4-0555b0d9c1f3
# ╠═0c025a2d-75b1-45e8-9f00-e5fa9167a258
# ╠═798f9fb2-c00d-4b5d-8a7b-9f455ee70c9e
# ╠═ab95d9a1-8049-4182-b466-8ae96d30ff69
# ╠═5ae34092-9e79-486f-a6ae-dadd02a64a5a
# ╠═0dee633a-07e8-4fc7-aea3-fa8608f7cc41
# ╠═adcf7fac-92d8-4a4f-8ecb-c05b391b487c
# ╠═e627a3e0-4ee8-4a5d-b3a0-b0425d6ebe72
# ╠═e7780e39-f0c9-41f4-a528-4da814550f9f
# ╠═c98a577a-2076-42f4-b548-6ff9336c9980
# ╠═15c4d5e3-42af-4236-8d56-96b14e66f93a
# ╠═3d392bb6-3469-4bb4-b745-55520f5ea310
# ╠═cb1927d8-84e5-4fde-ae79-acab60862496
# ╠═75705798-4f72-4cda-9129-ce7d3554487c
# ╠═defe3d22-2e83-45b3-a048-a5c127844a2b
# ╠═a53d2b26-69ef-44c9-8e69-cffbcb7691d2
# ╠═63d635ee-9f54-4545-b00a-b16ea5c9883e
# ╠═2e707bdc-6466-415f-8d18-dc6375b54c2b
# ╠═173caa6f-3e11-4f62-9481-f0dd2d7c4ac7
# ╠═27a561f0-14da-44da-9c8a-6cf9fcea391a
# ╠═9256d43c-73f8-4a1f-be26-7f99f2cd1778
# ╠═d27baca2-250a-4c26-82c5-3d4383229ba5
# ╠═23e95ce7-cc2e-4b32-ae2b-d9a5104d1324
# ╠═0639e686-52eb-4041-be8d-1d1b0aa70c0f
# ╠═eaf24d52-bf92-4fe6-8aa9-cfd7c0aefb16
# ╠═cb03f6ae-f7a3-4b78-97e3-0e34a5cd13d8
# ╠═4273e03f-2590-41e2-ada5-ee62f6123b21
# ╠═a7158cbb-f86c-4ab8-afeb-894d6868e3b2
# ╠═84e3bd68-2c0d-4d1d-a750-6e4b21269d08
# ╠═62ae4990-62b4-49d0-a2e8-e9768cf79e75
# ╠═9f7d0d47-c752-44da-a66a-00b6c3439303
# ╠═66921d6c-cadd-4868-a458-d916a212a6f6
# ╠═0e11f520-eb8e-4dac-9cc7-87aef8e7ee00
# ╠═e814e738-1684-4299-bd06-239df827fe45
# ╠═90113e79-6ed7-4469-aee6-c51520b3454d
# ╠═1605f8d9-f209-4f7f-98b0-51331a348d8e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
