### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 4d51e6a2-68bd-4d08-bafd-4a4c1074c88f
md"""
# Creating Dictionaries
In Julia, to create an empty dictionary, you can use an empty set of curly braces `{}`. Alternatively, you can also use the `Dict()` constructor. It's important not to name your dictionary "Dict" to avoid conflicts with the constructor.
"""

# ╔═╡ 22004600-53ea-11ee-0c7a-e9a74a5a21db
begin
	dct1 = Dict()
	dct2 = Dict{Any, Any}()  # An empty dictionary with Any key and Any value types
	
	println(typeof(dct1))
	println(typeof(dct2))
	
end

# ╔═╡ d20cd6d6-2839-4b8b-9315-12243b6c392f
md"""
###### Creating a Dictionary with Key-Value Pairs
To create a dictionary with key-value pairs, you can list them within curly braces, separating each key-value pair with a colon (:).
"""

# ╔═╡ 5a0916fa-f667-4d24-a2aa-9fcffb22d8b7
begin	
	populations = Dict("Grand Rapids" => 200217, "Holland" => 33327, "Lansing" => 118427, "Detroit" => 672662)
	
	println(populations)
end

# ╔═╡ 30122039-a8d9-4a25-9319-9b16a4843cbd
md"""
###### Accessing Values in a Dictionary
In Julia, you can access values in dictionaries using square brackets [], with the key as the index.
	
"""

# ╔═╡ ef4e190c-6b15-4046-8303-8edde0d1774b
begin
	popGR = populations["Grand Rapids"]
	println(popGR)
	
end

# ╔═╡ 2b2065fe-e1ce-447a-b58c-ef8ee297cf43
md"""
###### Accessing Values with Tuple Keys
In Julia, you can use various types as dictionary keys, including tuples.
"""

# ╔═╡ dcde6ecc-6bd5-4889-b63a-b4c0b321639c
begin
	grades = Dict(("Bob", "Billy") => [100, 80, 80],
	              ("Patricks", "Patty") => [50, 65, 60],
	              ("Smith", "Summer") => [75, 90, 90])
	
	# Accessing grades for the student ("Patricks", "Patty")
	patty_grades = grades[("Patricks", "Patty")]
	println(patty_grades)
end

# ╔═╡ dca60e04-bea1-4689-9140-1aef962495e1
md"""
In Julia, when you attempt to access a key that is not in a dictionary, it will not raise a KeyError as in Python. Instead, it will return a special value nothing. Here's how you can handle the case where the key is not in the dictionary:
"""

# ╔═╡ 5d82383e-e5b4-4c34-b529-dada4e5ecc1b
md"""
###### Accessing a Key That May Not Exist
In Julia, attempting to access a key that does not exist in a dictionary returns `nothing`, rather than raising an error.

Attempt to access a key that may not exist
"""

# ╔═╡ d814e6d4-717f-494b-9575-46211cb58028
begin	

	city = "Ann Arbor"
	population = get(populations, city, "City not found")
	
	if population == "City not found"
	    println("$city not found in the dictionary.")
	else
	    println("$city has a population of $population")
	end
	
end

# ╔═╡ 702870d9-7577-4112-bd37-817247149e16
md"""
In Julia, you can achieve the same behavior of getting a default value when a key is not found using the get() method. Here's the equivalent Julia code:
"""

# ╔═╡ e4a26e7b-5125-40fc-97ef-4d7ec9c17bd2
md"""
Using the get(key, default) Method
In Julia, you can use the `get()` method to access a dictionary and specify a default value to return when the key is not found.
"""

# ╔═╡ d0d9372b-5d5c-4a10-99a3-0424eecf86aa
begin	
	library = Dict("To Kill a Mockingbird" => 3, "East of Eden" => 2, "Brave New World" => 2)
	
	# Attempt to get the number of copies for "The Great Gatsby," default to 0 if not found
	copies = get(library, "The Great Gatsby", 0)
	
	println(copies)
	
end

# ╔═╡ e7cac646-73eb-4ddf-bbf7-46646c9fa34e
md"""
Accessing All Keys, Values, and Items in a Dictionary
In Julia, you can use the `keys()`, `values()`, and `pairs()` functions to access all keys, values, and key-value pairs (items) in a dictionary.
"""

# ╔═╡ b6e649d0-e4a1-48ee-8f76-01a5e7c56bcd
begin	
	println("----- keys -----")
	println(keys(grades))
	
	println("----- values -----")
	println(values(grades))
	
	println("----- items -----")
	println(collect(keys(grades)) .=> collect(values(grades)))
	
end

# ╔═╡ aa210e80-cf4d-4262-83dd-0cb522f6d423
md"""
###### Checking the Type of Keys
In Julia, you can use the `typeof()` function to check the type of objects returned by dictionary functions like `keys()`, `values()`, and `pairs()`.
"""

# ╔═╡ 479e93d0-d0b9-4b1c-b260-1c708155820d
begin
	key_collection = keys(grades)
	
	println(typeof(key_collection))
	
end

# ╔═╡ 963f1d25-a922-492b-80b9-e37cb0a70039
md"""
###### Iterating Through Keys
In Julia, you can iterate through the keys of a dictionary directly using a for loop without the need to convert them to a list.
"""

# ╔═╡ 87906db7-1f05-4cdf-884a-468539548129
begin
	println("----- Iterating Through Keys -----")
	for key in keys(grades)
	    println(key)
	end
end

# ╔═╡ 3d51ef21-e208-47e8-981d-b576cf7f112f
md"""
###### Adding New Keys to a Dictionary.
In Julia, you can add new key-value pairs to a dictionary by assigning a new value to a new or existing key.

Adding a new book and its number of copies
"""

# ╔═╡ 9e98ea41-4319-4b89-9487-821552ae9e0e
begin
	library["Jurassic Park"] = 2
	
	println(library)
end

# ╔═╡ f2b99b2c-88dc-4947-afa3-70e77cc5744c
md"""
###### Modifying Values in a Dictionary and Removing Keys
In Julia, you can modify values associated with existing keys in a dictionary and remove keys using the `pop()` function.
"""

# ╔═╡ 890dcd6c-6943-4989-9020-e93687b07d7d
begin
	# Modifying values
	library["To Kill a Mockingbird"] = 1
	library["East of Eden"] += 1
	
	println("----- After Modifying Values -----")
	println(library)
	
	# Removing a key
	pop!(library, "To Kill a Mockingbird")
	
	println("----- After Removing a Key -----")
	println(library)
	
end

# ╔═╡ 36fedf25-7815-4c50-8679-00c950b8c339
md"""
In Julia, you can check if a dictionary contains a specific key using the in operator. If the key is in the dictionary, it will return true; otherwise, it will return false. Here's how you can check for key containment in a dictionary:
"""

# ╔═╡ 64c8725b-88b5-4fd3-8265-dcdb23a78701
md"""
###### Checking if a Dictionary Contains a Key

In Julia, you can check if a dictionary contains a specific key using the `in` operator.
	
Checking if specific keys are in the dictionary
"""

# ╔═╡ b6d68d77-b730-4583-9a50-21cfb9f5ed2b
begin
	println("Is 'To Kill a Mockingbird' in the library? ", "To Kill a Mockingbird" in keys(library))
	println("Is 'East of Eden' in the library? ", "East of Eden" in keys(library))
	
end

# ╔═╡ 537228b8-7194-4755-90ad-4265a44d4b29
md"""
In Julia, you can iterate through a dictionary using a for loop. Here's how you can loop through a dictionary and access both keys and values:
"""

# ╔═╡ 1e148920-6db5-4abb-ab8e-bc8012b2fc2c
md"""
###### Iterating Through a Dictionary in Julia
In Julia, you can iterate through a dictionary using a `for` loop to access both keys and values
"""

# ╔═╡ 74923f44-d0f8-46ce-bc31-910ed6ed6bf4
begin
	println("----- Iterating Through the Dictionary -----")
	for (city, population) in populations
	    println("$city: $population")
	end
end

# ╔═╡ fea38ae3-7635-4ee1-89c5-6897072f91ba
md"""
In Julia, you can loop through just the values of a dictionary using the values() function. However, you cannot directly iterate through the key-value pairs as tuples in the same way as in Python. Instead, you can use a for loop to iterate through the keys and access the values using indexing. Here's how you can loop through just the values of a dictionary:
"""

# ╔═╡ 1221e6c6-a2c5-4927-b8c7-2bfcb95e437d
md"""
###### Iterating Through Values in a Dictionary
In Julia, you can loop through just the values of a dictionary using the `values()` function.
"""

# ╔═╡ 40837132-7bdf-487a-8415-6ea2b11ddae2
begin	
	println("----- Iterating Through Values -----")
	for val in values(populations)
	    println(val)
	end
	
end

# ╔═╡ 93aac6cd-f288-4391-8747-dd080cb218a9
md""" 
In Julia, dictionaries have been ordered since version 1.6, and the key-value pairs are guaranteed to occur in the order they are inserted. To sort a dictionary's keys alphabetically or numerically, you can convert the dictionary keys into an array and then use the sort() function. To sort by values, you can use the sort() function with a custom comparator function. Here's how you can do it:
"""

# ╔═╡ 93f89400-bd87-409e-aaf1-a044862916fc
md"""
###### Sorting a Dictionary in Julia
In Julia, you can sort a dictionary's keys alphabetically or numerically using the `sort()` function. To sort by values, you can use a custom comparator function.
"""

# ╔═╡ 3778c0c8-a3db-4399-b7c5-aed90154311d
begin
	println("----- Sorting by Keys (Alphabetically) -----")
	sorted_keys = sort(collect(keys(populations)))
	for city in sorted_keys
	    println("$city: $(populations[city])")
	end
	
	println("----- Sorting by Values (Numerically) -----")
	sorted_values = sort(collect(keys(populations)), by=x -> populations[x])
	for city in sorted_values
	    println("$city: $(populations[city])")
	end
	
end

# ╔═╡ a9485db0-36bd-4d44-8f6b-aba62de98c98
md"""
In Julia, there are similar functions that you can use to achieve similar results for dictionaries:

- minimum() to get the minimum key.
- maximum() to get the maximum key.
- length() to get the number of key-value pairs.
Here's how you can use these functions with a dictionary:
"""

# ╔═╡ 1e672a20-9a49-4de5-87da-01029beb8d55
md"""
###### Relevant Functions for Dictionaries in Julia
In Julia, you can use functions like `minimum()`, `maximum()`, and `length()` for dictionaries to get the minimum key, maximum key, and the number of key-value pairs.
"""

# ╔═╡ a2753ece-6657-43f2-ae40-4b06016c2f63
begin	
	println("Minimum Key: ", minimum(keys(populations)))
	println("Maximum Key: ", maximum(keys(populations)))
	println("Number of Key-Value Pairs: ", length(populations))
end

# ╔═╡ 5333dbc0-4231-4391-96fe-115ebc941f50
md"""
In Julia, you can achieve similar functionality to finding the key associated with the minimum and maximum values by using a custom comparator function with the minimum() and maximum() functions. Here's how you can find the keys associated with the minimum and maximum values:
"""

# ╔═╡ 6255054a-2207-437b-bb80-e284c99162a9
md"""
###### Finding Keys Associated with Minimum and Maximum Values in Julia
In Julia, you can find the keys associated with the minimum and maximum values by using a custom comparator function with the `minimum()` and `maximum()` functions.
"""

# ╔═╡ 797c4320-2551-4e39-8078-e24db3194f32
begin
	# Finding the key associated with the minimum value
	key_of_min = argmin(collect(values(populations)), dims=1)[1]
	println("Key of Minimum Value: $key_of_min")
	
	# Finding the key associated with the maximum value
	key_of_max = argmax(collect(values(populations)), dims=1)[1]
	println("Key of Maximum Value: $key_of_max")
	
end

# ╔═╡ c809f0cc-375b-42f6-b542-6e51764bc504
md"""
###### Counting Occurrences in Julia
In Julia, you can count occurrences of items in a list, string, or any iterable using a Dict.
"""

# ╔═╡ 43f8d84e-c5e9-480a-82c2-ce155efa0044
begin
	# Example list of items
	items = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
	
	# Create a dictionary to count occurrences
	counts = Dict{Any, Int}()
	
	# Count occurrences of each item
	for item in items
	    if haskey(counts, item)
	        counts[item] += 1
	    else
	        counts[item] = 1
	    end
	end
	
	# Print the counts
	for (item, count) in counts
	    println("$item: $count")
	end
	
end

# ╔═╡ f948617e-ceaa-43d6-a676-d6f1b045e37a
md"""
### Counter
In Julia, you can create a counter-like dictionary to count the occurrences of characters in a string without needing to import additional modules. Here's how you can create a character counter from a string:
"""

# ╔═╡ e3fe77fd-bfc9-48de-b0b7-2baca362b66f
md"""
###### Creating a Character Counter from a String in Julia
In Julia, you can create a character counter from a string to count the occurrences of each character.
"""

# ╔═╡ 9571f090-ca03-4eb9-859e-a6af68470d97
begin	
	# Example string
	text = "abracadabra alakazam"
	
	# Create a dictionary to count characters
	char_counts = Dict{Char, Int}()
	
	# Count occurrences of each character
	for char in text
	    if haskey(char_counts, char)
	        char_counts[char] += 1
	    else
	        char_counts[char] = 1
	    end
	end
	
	# Print the character counts
	for (char, count) in char_counts
	    println("$char: $count")
	end
	
end

# ╔═╡ ecb72bcd-8154-41a9-a38f-8c7829e8af27
md"""
In Julia, you can create a counter-like dictionary to count the occurrences of items in a list without needing to import additional modules. Here's how you can create a counter from a list:
"""

# ╔═╡ 43da7937-deff-4deb-a170-03fb6c3c11e7
md"""
###### Creating a Counter from a List in Julia
In Julia, you can create a counter from a list to count the occurrences of each item.
"""

# ╔═╡ 32728b9b-4837-41fb-8b97-15f45064b456
begin
	# Example list of items
	foods = ["bacon", "eggs", "ham", "eggs", "spam", "orange", "apple", "apple", "bacon", "bacon"]
	
	# Create a dictionary to count items
	item_counts = Dict{String, Int}()
	
	# Count occurrences of each item
	for item in foods
	    if haskey(item_counts, item)
	        item_counts[item] += 1
	    else
	        item_counts[item] = 1
	    end
	end
	
	# Print the item counts
	for (item, count) in item_counts
	    println("$item: $count")
	end
	
end

# ╔═╡ fcd40234-1099-4464-8113-348f92a3c657
md"""
In Julia, you can create a counter-like dictionary from other iterable objects, including the result of the 1:step:stop range constructor. Here's how you can create a counter from a range:

###### Creating a Counter from a Range in Julia
In Julia, you can create a counter from a range or other iterable objects.
"""

# ╔═╡ 4d9c42f0-e557-483b-9b35-ba8873947838
begin
	# Example range
	count_range = 0:2:10
	
	# Create a dictionary to count items
	range_counts = Dict{Int, Int}()
	
	# Count occurrences of each item
	for item in count_range
	    if haskey(range_counts, item)
	        range_counts[item] += 1
	    else
	        range_counts[item] = 1
	    end
	end
	
	# Print the item counts
	for (item, count) in range_counts
	    println("$item: $count")
	end
	
end

# ╔═╡ d38a6ae9-b7b6-4c54-bfe7-521aaf612c3b
md"""
In Julia, dictionaries and counters share similar behavior in terms of handling missing keys. When you access a key that doesn't exist in a dictionary, it will not raise an error but instead return the default value for the value type of the dictionary (typically nothing if not explicitly set).

#Here's how accessing a missing key in a dictionary would work in Julia:
"""

# ╔═╡ 41a27221-dba7-4f1a-9ef5-a3bb1086523a
begin
	# Create a dictionary
	food_counts = Dict("bacon" => 3, "eggs" => 2, "ham" => 1)
	
	# Accessing a missing key
	count = get(food_counts, "kiwi", 0)  # Returns 0 for a missing key
	println(count)  # Output: 0
	
end

# ╔═╡ ec3a7896-b432-4150-b31c-c3d5d2ed2d97
md"""
In Julia, you can achieve similar functionality to the elements and most_common methods of Python's Counter using the following approach:

#Here's how you can iterate through elements with counts and find the most common elements in a Julia dictionary:
"""

# ╔═╡ 24b65649-358a-4e70-8515-2420c335fd52
begin
	# Define a function to replicate elements based on counts
	replicate_elements(dict) = [item for (item, count) in pairs(dict) for _ in 1:count]
	
	# Iterate through elements (each element repeated count times)
	for food in replicate_elements(food_counts)
	    println(food)
	end
	
	# Define a function to get the most common elements
	most_common_elements(dict, n) = sort(collect(pairs(dict)), by=last, rev=true)[1:min(n, length(dict))]
	
	# Get the most common elements (top 3 in this case)
	most_common = most_common_elements(food_counts, 3)
	println(most_common)
	
end

# ╔═╡ Cell order:
# ╠═4d51e6a2-68bd-4d08-bafd-4a4c1074c88f
# ╠═22004600-53ea-11ee-0c7a-e9a74a5a21db
# ╠═d20cd6d6-2839-4b8b-9315-12243b6c392f
# ╠═5a0916fa-f667-4d24-a2aa-9fcffb22d8b7
# ╠═30122039-a8d9-4a25-9319-9b16a4843cbd
# ╠═ef4e190c-6b15-4046-8303-8edde0d1774b
# ╠═2b2065fe-e1ce-447a-b58c-ef8ee297cf43
# ╠═dcde6ecc-6bd5-4889-b63a-b4c0b321639c
# ╠═dca60e04-bea1-4689-9140-1aef962495e1
# ╠═5d82383e-e5b4-4c34-b529-dada4e5ecc1b
# ╠═d814e6d4-717f-494b-9575-46211cb58028
# ╠═702870d9-7577-4112-bd37-817247149e16
# ╠═e4a26e7b-5125-40fc-97ef-4d7ec9c17bd2
# ╠═d0d9372b-5d5c-4a10-99a3-0424eecf86aa
# ╠═e7cac646-73eb-4ddf-bbf7-46646c9fa34e
# ╠═b6e649d0-e4a1-48ee-8f76-01a5e7c56bcd
# ╠═aa210e80-cf4d-4262-83dd-0cb522f6d423
# ╠═479e93d0-d0b9-4b1c-b260-1c708155820d
# ╠═963f1d25-a922-492b-80b9-e37cb0a70039
# ╠═87906db7-1f05-4cdf-884a-468539548129
# ╠═3d51ef21-e208-47e8-981d-b576cf7f112f
# ╠═9e98ea41-4319-4b89-9487-821552ae9e0e
# ╠═f2b99b2c-88dc-4947-afa3-70e77cc5744c
# ╠═890dcd6c-6943-4989-9020-e93687b07d7d
# ╠═36fedf25-7815-4c50-8679-00c950b8c339
# ╠═64c8725b-88b5-4fd3-8265-dcdb23a78701
# ╠═b6d68d77-b730-4583-9a50-21cfb9f5ed2b
# ╠═537228b8-7194-4755-90ad-4265a44d4b29
# ╠═1e148920-6db5-4abb-ab8e-bc8012b2fc2c
# ╠═74923f44-d0f8-46ce-bc31-910ed6ed6bf4
# ╠═fea38ae3-7635-4ee1-89c5-6897072f91ba
# ╠═1221e6c6-a2c5-4927-b8c7-2bfcb95e437d
# ╠═40837132-7bdf-487a-8415-6ea2b11ddae2
# ╠═93aac6cd-f288-4391-8747-dd080cb218a9
# ╠═93f89400-bd87-409e-aaf1-a044862916fc
# ╠═3778c0c8-a3db-4399-b7c5-aed90154311d
# ╠═a9485db0-36bd-4d44-8f6b-aba62de98c98
# ╠═1e672a20-9a49-4de5-87da-01029beb8d55
# ╠═a2753ece-6657-43f2-ae40-4b06016c2f63
# ╠═5333dbc0-4231-4391-96fe-115ebc941f50
# ╠═6255054a-2207-437b-bb80-e284c99162a9
# ╠═797c4320-2551-4e39-8078-e24db3194f32
# ╠═c809f0cc-375b-42f6-b542-6e51764bc504
# ╠═43f8d84e-c5e9-480a-82c2-ce155efa0044
# ╠═f948617e-ceaa-43d6-a676-d6f1b045e37a
# ╠═e3fe77fd-bfc9-48de-b0b7-2baca362b66f
# ╠═9571f090-ca03-4eb9-859e-a6af68470d97
# ╠═ecb72bcd-8154-41a9-a38f-8c7829e8af27
# ╠═43da7937-deff-4deb-a170-03fb6c3c11e7
# ╠═32728b9b-4837-41fb-8b97-15f45064b456
# ╠═fcd40234-1099-4464-8113-348f92a3c657
# ╠═4d9c42f0-e557-483b-9b35-ba8873947838
# ╠═d38a6ae9-b7b6-4c54-bfe7-521aaf612c3b
# ╠═41a27221-dba7-4f1a-9ef5-a3bb1086523a
# ╠═ec3a7896-b432-4150-b31c-c3d5d2ed2d97
# ╠═24b65649-358a-4e70-8515-2420c335fd52
