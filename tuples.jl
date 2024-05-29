### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 3d7f5a70-63de-11ee-388d-d163f1f6c065
md"""
### Tuples in Julia

Tuples in Julia are quite similar to their counterparts in many other programming languages. They serve as a fundamental data structure, providing a means to bundle multiple items together.

#### Characteristics:

1. **Immutable**: Similar to strings, once a tuple in Julia is created, you cannot modify its contents. This immutability is in contrast with lists (or arrays in Julia's parlance) where you can alter the contents after creation.

2. **Versatile**: Tuples can contain a diverse range of data types. They can store numbers, strings, booleans, arrays, other tuples, and even more complex types. This makes them incredibly versatile for bundling different kinds of information together.

The structure of tuples and their immutability make them particularly suitable for situations where you want to ensure that the content doesn't get altered accidentally, such as when using them as keys in dictionaries or when passing data between functions that shouldn't be modified.
"""

# ╔═╡ 58dc2a7b-9c8f-41a2-a2ec-867323ce8495
md"""
### Tuple Creation in Julia

In Julia, creating a tuple is straightforward. You simply group the elements together, separated by commas, and enclose them in parentheses `(` and `)`. This is reminiscent of list creation, but instead of using square brackets `[` and `]`, we use parentheses.
"""

# ╔═╡ 41563e73-fd97-497c-9dcb-8c893d797247
begin
	tnum = (4,5,6)
	println(typeof(tnum))
	
	tstr = ('x', 'y', 'z')
	println(typeof(tstr))
	
	tmix = ('a', 1, [9,10], (-9, 10))
	println(typeof(tmix))
	
end

# ╔═╡ 1050e98e-3a32-4185-9c69-966156c600e5
md"""
Observe that parentheses are traditionally used to group operations and determine order of operations. Therefore, if you aim to create a tuple with just one item, simply wrapping the item in parentheses like `(1)` won't suffice. To clearly indicate a single-element tuple, a trailing comma is required after the sole element.
"""


# ╔═╡ 5693e78e-ca3c-45c8-a585-fdad95d18a04
begin
	nocomma = (1)
	tsingle = (1,)
	println(typeof(nocomma))
	println(typeof(tsingle))
	
end

# ╔═╡ 8d96f9b7-d951-4bc6-9f8a-739d91b95788
md"""
You might question the need for a single-element tuple in Julia. It's not uncommon for functions, especially in various Julia packages, to accept a tuple as an argument. This design provides flexibility, enabling the function to either take a single value or multiple values. In instances where you desire to pass just one specific value, a single-element tuple becomes the appropriate choice.
"""


# ╔═╡ eed77347-c149-45c9-88ce-cfca84edb39b
md"""
##### Creating Tuples from Other Sequences in Julia

Another convenient method to create a tuple in Julia is by transforming existing sequences. Both strings and arrays (Julia's equivalent of lists) can be converted to tuples. This is somewhat analogous to creating an array from the characters of a string in Julia. To achieve this transformation, we utilize the `Tuple()` constructor with the desired sequence as an argument.
"""

# ╔═╡ 39b27347-561d-4477-ad3e-69385356b30a
md"""
For Example:
"""

# ╔═╡ 97f767b0-4d1b-4420-a52f-7519f8a10767
begin
	lst = [1,2,3]
	tuplst = Tuple(lst)
	println(typeof(tuplst))
	println(tuplst)
	
	msg = "hello"
	tupstr = Tuple(msg)
	println(typeof(tupstr))
	println(tupstr)
	
end

# ╔═╡ 313119f8-ffc5-4cff-b287-24cc37734a92
md"""
### Tuple Operations in Julia

While tuples in Julia have certain similarities with arrays (lists in Python) and strings, they don't possess the extensive range of methods that arrays do. However, they retain a core set of sequence operations consistent with both arrays and strings. Here are the primary operations applicable to tuples in Julia:
"""


# ╔═╡ 44592a37-cad2-4f26-ad2e-cd5752bd97a9
md"""
### Accessing Elements in Tuples

1. **Indexing**:
   - In Julia, you can access a specific element of a tuple using the standard bracket notation: `t[index]`. Remember that Julia uses 1-based indexing, so the first element is accessed with `t[1]`.

2. **Slicing**:
   - While arrays in Julia support slicing, tuples do not inherently support the same slicing operations like arrays. If you need to slice a tuple, you can first convert it to an array, perform the slice, and then convert it back to a tuple if desired.
"""


# ╔═╡ a29ba639-9834-41c6-9db7-c7e30129a7e9
begin
	tup = ('p', 3, 1, 5, 'i', 9)
	println(tup[1])  # Access the first element
	
	# For slicing, we first convert the tuple to an array
	arr = collect(tup)
	println(arr[1:end])  # Similar to Python's [1:]
	println(arr[1:2:4])  # Equivalent to Python's [:4:2]
	
end

# ╔═╡ 5ea1a0f1-4dc9-4004-96e3-a5c9f558d3df
md"""
### Operators on Tuples in Julia

1. **Concatenation**:
   - Tuples can be concatenated using the `,` operator within a new tuple construction. For example, to concatenate two tuples `a` and `b`, you would do: `(a..., b...)`.
   
2. **Repetition**:
   - Repetition of tuples isn't as direct as in Python. If you need to repeat a tuple, you can achieve this by converting it to an array, using repetition on the array, and then converting back to a tuple.
"""


# ╔═╡ 16305240-a118-45b6-949b-d0ecb140e28d
begin
	t1 = ('4', '0', '6')
	t2 = ('4', '7', '3')
	println(t1)
	
	# Concatenation
	t3 = (t1..., t2...)
	println(t3)
	
	# Repetition by converting to array and back to tuple
	t4 = Tuple(repeat(collect(t1), 2))
	println(t4)
	
end

# ╔═╡ 27ee2f75-fb82-4507-a36e-af93dc8f0488
md"""
### Applicable Functions and Methods for Tuples in Julia

1. **Length**:
   - You can find the length of a tuple `t` with `length(t)`.

2. **Minimum**:
   - To get the minimum value of a tuple `t`, use `minimum(t)`.

3. **Maximum**:
   - To get the maximum value of a tuple `t`, use `maximum(t)`.

4. **Index of First Occurrence of Item**:
   - To find the index of the first occurrence of an item in tuple `t`, use `findfirst(==(item), t)`. If the item is not in `t`, this function will return `nothing`.

5. **Count of Occurrences of an Item**:
   - To count the number of occurrences of an item in tuple `t`, use `count(==(item), t)`.
"""


# ╔═╡ caaedaef-66bc-43db-aaba-f6801c7ae58f
begin
	t5 = ('z', 'z', 'a', 'p', 'a', 'q', 'z')
	println("len = ", length(t1))
	println("min = ", minimum(t1))
	println("max = ", maximum(t1))
	println("index of 'a' = ", findfirst(==('a'), t1))
	println("count of 'z' = ", count(==('z'), t1))
	
end

# ╔═╡ 26a7d97d-ac90-4e8a-b234-34f9a8b04525
md"""
### Containment and Iteration for Tuples in Julia

1. **Check for Value**:
   - You can check if a value `val` is present in a tuple `t` with `val in t`. This will evaluate to either `true` or `false`.

2. **Loop Through Values**:
   - To loop through the values of a tuple `t`, you can use the standard `for` loop: `for val in t`.
"""


# ╔═╡ 609a0831-abd3-4c96-9830-9a0dc778df42
begin
	tup1 = (1, 5, -2, 8)
	println(1 in tup1)
	println(2 in tup1)
	
	for val in tup1
	    println(val^2)  # In Julia, we use ^ for exponentiation
	end
	
end

# ╔═╡ e420c031-e769-4fca-bba0-3c3f232899e4
md"""
### Comparison of Tuples in Julia

Tuples can be compared in Julia using the standard comparison operators such as `<`, `<=`, `>`, and `>=`.

1. **Lexicographical Comparison**:
   - The comparison is based on lexicographical (dictionary) order. 

2. **Order Determination**:
   - The order is determined by the first differing element. For instance, when comparing two tuples, the function will first look at the initial element of both tuples. If they are identical, it moves to the next element, and so on.

Using lexicographical comparison, `('a', 'b')` is less than `('b', 'a')` because 'a' is lexicographically before 'b'. Similarly, `(1, 2, 3)` is less than `(1, 2, 4)` because even though the first two elements are the same, the third element in the first tuple is less than the third element in the second tuple.
"""


# ╔═╡ f5217444-7fbc-439b-9bf8-046db7e9439d
md"""
### Immutability of Tuples in Julia

Tuples in Julia are immutable. This characteristic signifies that:

1. **Value Access**:
   - You can access specific elements of a tuple using indexing, much like you do with arrays.

2. **Modification Restriction**:
   - Once a tuple is created, you cannot modify its content. Any attempt to change an element inside a tuple will result in an error. This behavior ensures the integrity and consistency of data stored in tuples, especially useful in scenarios where data should not be altered after initialization.
Like below
"""


# ╔═╡ d834c065-05cf-4c6d-9ba7-8e67bd1b2112
md"""
```julia
t = ('a','b','c')
t[1] = 'z'  # This will throw an error


# ╔═╡ 0373d6cf-701a-4e09-af71-b701024d1900
md"""
### Mutability within Tuples in Julia

Even though tuples are immutable, they can hold references to mutable objects. The crucial distinction is:

1. **Immutable References**:
   - The references (or pointers) inside a tuple to these mutable objects are immutable, meaning that you can't change the tuple to point to a different object.

2. **Mutable Objects**:
   - The objects that these references point to, if they are mutable, can still be modified. So, the content of these mutable objects can change even if the tuple itself remains unchanged.

For example, if a tuple contains an array (which is mutable in Julia), you can't make the tuple point to a different array. Still, you can modify the contents of that array.
"""

# ╔═╡ b6e3dea4-10dc-4c54-8807-f9461af88f85
begin
	t = (3.5, [1,2])
	# t[1] = 3   # This will throw an error
	t[2][1] = 3  # Modifying the first element of the array inside the tuple
	println(t)
	
end

# ╔═╡ 5966c744-4b3b-422d-9fca-bdb9480003df
md"""
### Packing & Unpacking in Julia

**Packing**:
In Julia, like in Python, you can combine or "pack" values into a tuple. While you can use parentheses to denote a tuple, they are optional for packing. Packing involves assigning comma-separated values to a variable.

**Unpacking**:
Unpacking refers to the process of taking the elements from a tuple and assigning them to individual variables. This can be especially handy when you want to assign multiple variables from the contents of a tuple in one line.
"""

# ╔═╡ b7522b9b-14ee-473f-ac1d-fc075c7c5a43
begin
	t_ = 2, 4, 5
	println(typeof(t))
	println(t)
	
end

# ╔═╡ 0f975905-caa5-46af-8b78-3b6e9944d998
md"""
### Unpacking in Julia

**Unpacking**:
In Julia, unpacking is a common and handy technique. It refers to the process of assigning the elements from a tuple to individual variables. 

For instance, if we have a tuple with three elements:

"""

# ╔═╡ ea10a0b7-b38a-4a83-beae-dede48c86728
begin
	tup2 = ("erin", "bob", "susie")
	first, second, third = tup2
	println(first)
	println(typeof(first))
end

# ╔═╡ 010fa8e5-3939-42da-83ba-452d0131f54c
md"""
### When and Why to Use Tuples in Julia?

Given the similarities between tuples and other data structures like arrays, one might wonder about the specific scenarios where tuples are the preferred choice. Here are some reasons to choose tuples:

1. **Immutability**: 
   - When you need a sequence of items to remain constant throughout its lifecycle, tuples are ideal. This immutability can serve as a protective mechanism against inadvertent changes.
   
2. **Efficiency**: 
   - Tuples are generally more memory-efficient than arrays, primarily because of their immutability.

3. **Function Returns**:
   - When functions need to return multiple values, it's common in Julia (as in many languages) to pack these values into a tuple and return it.
   - Though you're not strictly bound to return a tuple (you could return an array or other data structures), using a tuple is the conventional choice unless there's a compelling reason to do otherwise.

4. **Multiple Variable Assignment**:
   - One of the most frequent applications of tuple unpacking is when you want to assign values returned by a function to several variables simultaneously.

In essence, while many tasks achievable with tuples can also be done using arrays, tuples have specific use cases where they shine and provide clearer semantics, efficiency, or safety.
"""

# ╔═╡ a0393740-b952-4eca-b601-a65eaefebbd9
begin
	function get_stats(lst1)
	    small = minimum(lst1)
	    big = maximum(lst1)
	    return small, big  # Julia automatically creates a tuple when returning multiple values
	end
	
	lst1 = [39, 41, 18, 49, 25]
	mn, mx = get_stats(lst1)  # Unpacks into 2 variables
	println(mn, " ", mx)
end

# ╔═╡ e36f5183-5c89-491d-b7df-2aa41b3106f4
begin
	p = 4
	q = 10
	p, q = q, p
	println(p, " ", q)
end

# ╔═╡ Cell order:
# ╠═3d7f5a70-63de-11ee-388d-d163f1f6c065
# ╠═58dc2a7b-9c8f-41a2-a2ec-867323ce8495
# ╠═41563e73-fd97-497c-9dcb-8c893d797247
# ╠═1050e98e-3a32-4185-9c69-966156c600e5
# ╠═5693e78e-ca3c-45c8-a585-fdad95d18a04
# ╠═8d96f9b7-d951-4bc6-9f8a-739d91b95788
# ╠═eed77347-c149-45c9-88ce-cfca84edb39b
# ╠═39b27347-561d-4477-ad3e-69385356b30a
# ╠═97f767b0-4d1b-4420-a52f-7519f8a10767
# ╠═313119f8-ffc5-4cff-b287-24cc37734a92
# ╠═44592a37-cad2-4f26-ad2e-cd5752bd97a9
# ╠═a29ba639-9834-41c6-9db7-c7e30129a7e9
# ╠═5ea1a0f1-4dc9-4004-96e3-a5c9f558d3df
# ╠═16305240-a118-45b6-949b-d0ecb140e28d
# ╠═27ee2f75-fb82-4507-a36e-af93dc8f0488
# ╠═caaedaef-66bc-43db-aaba-f6801c7ae58f
# ╠═26a7d97d-ac90-4e8a-b234-34f9a8b04525
# ╠═609a0831-abd3-4c96-9830-9a0dc778df42
# ╠═e420c031-e769-4fca-bba0-3c3f232899e4
# ╠═f5217444-7fbc-439b-9bf8-046db7e9439d
# ╠═d834c065-05cf-4c6d-9ba7-8e67bd1b2112
# ╠═0373d6cf-701a-4e09-af71-b701024d1900
# ╠═b6e3dea4-10dc-4c54-8807-f9461af88f85
# ╠═5966c744-4b3b-422d-9fca-bdb9480003df
# ╠═b7522b9b-14ee-473f-ac1d-fc075c7c5a43
# ╠═0f975905-caa5-46af-8b78-3b6e9944d998
# ╠═ea10a0b7-b38a-4a83-beae-dede48c86728
# ╠═010fa8e5-3939-42da-83ba-452d0131f54c
# ╠═a0393740-b952-4eca-b601-a65eaefebbd9
# ╠═e36f5183-5c89-491d-b7df-2aa41b3106f4
