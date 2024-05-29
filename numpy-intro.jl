### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 379e01f9-6e73-4b7d-a11d-201cdfc7dad3
begin
	using Random
	
	n = 1000
	lst1 = rand(1:5, n)
	lst2 = rand(1:5, n)
	
end

# ╔═╡ 50c8df75-1e35-41f3-8845-db296e4da2d3
begin
	using LinearAlgebra
	
	begin
	    # Identity Matrix
	    # In Julia, the identity matrix can be generated using the `I` object.
	    matid = Matrix{Float64}(I, 3, 3)
	    println(matid)
	end
end

# ╔═╡ dc3735ea-81bd-431d-ae5b-d2ea94819d67
begin
	using Statistics
	
	mat8 = reshape([5, 7, -8, 1, 3, -4, 12, 0, 1, 0, 2, 5], (4, 3))
	println(mat8)
	println(minimum(mat8))
	println(maximum(mat8))
	println(sum(mat8))
	println(mean(mat8))
	println(argmin(mat8))
	
end

# ╔═╡ dd6ce920-648e-11ee-0b19-61c22109a4d5
md"""
Julia Base and Standard Libraries
One of the reasons Julia is rapidly gaining popularity in the numerical and scientific computing community is because of its built-in support for high-performance array operations. In contrast to Python's need for numpy, Julia natively provides powerful multi-dimensional arrays and a rich set of functions and operations for these arrays. For those transitioning from MATLAB, R, or even numpy in Python, you'll find that Julia's syntax and capabilities are both familiar and efficient. There's no need to import an external library for numerical operations in Julia; you can get started right away with the base and standard libraries.
"""

# ╔═╡ 040f452d-4194-4cbe-8586-be076021c431
md"""
Julia Arrays vs Python Lists
The comparison below outlines the differences between Python lists and native Julia arrays. While Python requires numpy for efficient array operations, Julia provides this natively.

Julia Arrays:
- Efficient: often much faster than traditional Python lists without numpy.
- Dynamically resizable: like Python lists, can grow or shrink.
- Homogeneous type by default: elements are typically of the same type, but can be made heterogeneous with special array types.
- Rich built-in functions and operations.

For those wondering why Julia arrays can outperform traditional Python lists, it's because Julia is designed for high-performance numerical computing from the ground up. This means Julia arrays are already optimized without needing an external library like numpy. The language combines the ease of high-level languages with the speed of low-level languages.
"""

# ╔═╡ 6430bccb-d828-4c9c-b7b4-1e4bbc7994b8
md"""
Efficiency Comparison
Let's experimentally examine the efficiency difference. Consider two arrays, and we aim to multiply their corresponding elements. In Julia, we can achieve this directly using broadcasting. We'll utilize the `@time` macro, native to Julia, to measure the performance of this operation. Note: unlike Python's Jupyter environment which uses `%%timeit`, Julia uses the `@time` macro to measure execution time.
"""

# ╔═╡ 7e7946b6-715e-4d12-8e23-bfcc7b2b4c3a
md"""
##### List Way
We'll begin by utilizing Julia's built-in random functions to create 2 arrays:
"""

# ╔═╡ f909d883-ad08-4350-9378-36fe69ca0fef
md"""
Now, we'll proceed to loop through, multiply corresponding elements, and push the result to a new array:
"""

# ╔═╡ 47335618-d4fb-4a71-9288-97efb2a2d9c0
begin
	@time begin
	    res = []
	    for i in 1:n
	        push!(res, lst1[i] * lst2[i])
	    end
	end
end

# ╔═╡ 4eb2fb9f-3e64-4c0a-a398-d88467626cc0
md"""
Now, let's consider the same example using Julia's native array capabilities, which offer a similar efficiency to numpy:
"""

# ╔═╡ 7c1fb7ff-5beb-4d38-8e07-0f557905ee87
begin
	arr1 = rand(1:5, n)
	arr2 = rand(1:5, n)
	
	@time res1 = arr1 .* arr2
	
end

# ╔═╡ e222a985-8a51-4c92-b9e2-258a17477bb8
begin
	# Corrected Example:
	lst = [1, 2, 3, 4, 5]
	arr_from_list = Array(lst)  # This is redundant since `lst` is already an array, but just for demonstration.
	
	tpl = (1, 2, 3, 4, 5)
	arr_from_tuple = collect(tpl)
	
end

# ╔═╡ 4e964216-073e-4ea6-8c9c-1c02ff463796
md"""
In Julia, there's no need for a separate array type like numpy. 
Native arrays in Julia serve the purpose. 
So, there's no need for a conversion step, but for demonstration:
"""

# ╔═╡ 5c4f30be-cdec-49ca-9c66-81d970ec6477
begin
	val_lst = [4, 3, -1, 8]

	val_arr = Array(val_lst)
	
	println("val_lst: ", val_lst)
	println("val_arr: ", val_arr)
	println(typeof(val_lst))
	println(typeof(val_arr))
	
end

# ╔═╡ 6dc94005-38a9-4ea1-8c04-c7fab8f8a5ce
begin
	val_arr_ = [4, 3, -1, 8]
	println(val_arr_)
end

# ╔═╡ 6956d7e0-40a2-45ba-b7bc-91c09c371e71
md"""
In Julia, multi-dimensional arrays natively serve the role of matrices. There's no need for a distinct "matrix" type as in some other languages or libraries. You can directly create multi-dimensional arrays using lists of lists:
"""

# ╔═╡ 4b413e6b-a7c2-44b9-880b-cc780ba7a21f
begin
	lst2d = [[1.1, 4, 8.3], [3, 2.5, -1.8], [0, 3.4, 5]]
    mat = hcat(lst2d...)'

    println(mat)

end

# ╔═╡ d4a28273-635a-49e7-be79-38f0d9e3137c
md"""
Filled with zeros/ones
Creating arrays from lists is common in many programming environments, but there are also scenarios where you might want to initialize an array with default values. Julia offers native functions for this:

- `ones(shape...)`
- `zeros(shape...)`

For 1D arrays, `shape` is just a single number. For multi-dimensional arrays, you can provide each dimension's size as separate arguments.
"""

# ╔═╡ 3441c076-0924-43e7-8b5f-bad48e599d46
begin
	# Examples
	println(zeros(5))
	println(ones(7))
	
	println("\n5x5 filled with 0s")
	shape1 = (5, 5)
	println(zeros(shape1))
	
	println("\n4x3x2 filled with 1s")
	arr3d = ones(4, 3, 2)
	println(arr3d)
	
end

# ╔═╡ 094ccb94-eff6-49e6-8382-f545e87e77cf
md"""
###### Identity Matrix
In Julia, the identity matrix can be generated using the `I` object along with a standard array creation.
"""

# ╔═╡ f724db86-c7f7-4d47-a442-441d66eea5b2
md"""
In Julia, you can create arrays filled with 0s or 1s based on the dimensions of an existing array with:
"""

# ╔═╡ 02c7434d-61fd-4eef-94a5-5f2741beab70
begin
	zarr3d = zeros(eltype(arr3d), size(arr3d))
    println(zarr3d)

end

# ╔═╡ 528b3117-9df7-4bad-b147-b32e563f720a
md"""
# Evenly Spread Values

In Julia, you can create arrays with evenly spaced values using a couple of methods:

1. **Using the `:` operator**:
   Julia has a built-in range syntax using the colon operator (`:`) that functions in a way reminiscent of Python's `range`.
   - `start:step:stop`
   Where `start` is inclusive, `stop` is also inclusive in Julia, and `step` is the spacing between values.

2. **Using the `range` function**:
   With this function, you can describe the range either with a `step` or a `length` but not both. If `step` is given, values are produced in a manner akin to Python's `range`. If `length` is given, it operates similarly to Python's `linspace`.
   - `range(start, stop=stop_value, step=step_value, length=num_points)`

3. **Using `LinRange` for non-integer spacings**:
   This is reminiscent of `linspace` in Python. It's crafted to provide `num` equally spaced points between `start` and `stop`.
   - `LinRange(start, stop, num)`

**Note**: A pivotal distinction is that in Julia, the `stop` value in the `:` operator and `range` function is inclusive. In contrast, in Python's `range` and NumPy's `arange`, it's exclusive.

#### Examples
"""

# ╔═╡ 953d5fe3-1460-44fb-9ba3-d03fa6c87794
begin
	arr = 1:2:9  # Note: 9 is inclusive in Julia's range syntax.
	println(arr)
	
	arr3 = LinRange(1, 10, 20)
	println(arr3)
end

# ╔═╡ 510cd8eb-f7f3-482e-8928-f6acf29efbbb
md"""
#### Data Types
In Julia, variables are not statically typed, which means you don't have to declare their type before using them. However, Julia arrays are homogeneous, implying:

All elements in the array have the same datatype.
While the contents of an array can change, the type of contents it can hold is fixed upon its creation.

While Julia does a great job of inferring the type of data in most situations, it's crucial to be aware of the types you're working with, especially for performance-sensitive tasks. To inspect the datatype of an array's elements, you can use the eltype function.
"""

# ╔═╡ 79ffcc7c-07f9-47ac-927d-0070cd847ba4
begin
	println(eltype(arr))
	println(eltype(arr2))
	
end

# ╔═╡ 8237e89a-9ca9-4cc7-8969-16667cf21522
md"""
We can also explicitly indicate what datatype we want when calling most of the array-creation functions, such as np.zeros and np.ones, by adding in the dtype argument.
"""

# ╔═╡ 5163f9fc-21cd-4765-904d-f1e3a72f7a8f
begin
	val_sec = [1, 4, 6, 8]
	
	# Creating an array from the list, Julia will infer the type
	val_array = Vector(val_sec)
	
	# Creating an array from the list with specified datatype as Float64
	val_arr2 = Vector{Float64}(val_sec)
	
	println(val_array)
	println(val_arr2)
	println(eltype(val_array))
	println(eltype(val_arr2))
	
end

# ╔═╡ 6aacf2a1-c883-4c0e-95f6-c558c15f5ffa
md"""
The datatype of an array resulting from certain operations will adapt to what is most appropriate.

Although in numerous situations the operation yields the expected behavior, there are moments when it's essential to modify the datatype of an existing array. To achieve this, we can utilize the convert() function along with the desired datatype.

"""

# ╔═╡ 466c5f56-80e1-48be-abfc-7282ac5a3256
begin
	arr5 = 0.0:1.0:7.0  # Create an array from 0.0 to 7.0
	println(eltype(arr5))  # Equivalent to arr.dtype in Python
	
	conv = convert(Vector{Int}, arr5)  # Convert the array to integers
	println(eltype(conv))  # Print the datatype of the converted array
end

# ╔═╡ 21832db4-4d39-45e8-aadf-92b89dd3eea0
md"""
Accessing Array Elements
Accessing elements in a Julia array is somewhat similar to accessing items in a Python list, but with the following differences:

- Indexed starting at 1 at the beginning.
- Negative indices do not count from the end.
- Accessed with the [] notation.
While the access notation remains the same, the starting index of 1 is a fundamental difference from many other programming languages, including Python.
"""

# ╔═╡ 2c2e7948-02c1-45b8-9490-69a18dcbb9d5
val_arr6 = [1, 4, -13, -5, 8, -9, 24]

# ╔═╡ 81b7ed46-7105-4346-86ab-afde23012fae
begin
	println(val_arr6)
	println(val_arr6[1])  # Julia arrays start with index 1
	println(val_arr6[3])
	
	# Julia does not support negative indexing directly. Instead, we can use:
	println(val_arr6[end])
	
end

# ╔═╡ 4de06031-7cf5-48cd-b669-61be69c90f73
md"""

## Slicing

We've previously encountered the fundamental concept of slicing with lists and strings. This concept extends to Julia arrays as well. As with lists, slices typically adopt the following format:

`arr[start:stop:step]`

Here, any of the three can be omitted, and the colon (`:`) serves as the range operator. However, in Julia, negative values don't denote counting from the end of the array, unlike Python. Instead, you'd use specific expressions like `end-1` to get the penultimate element, for example. If you don't need the `step`, you can simply use `arr[start:stop]`.

---

######  For clarity in Julia:
1. The first index is 1, not 0.
2. There's no direct equivalent to Python's negative indexing. Instead, the keyword `end` is used to reference the last element (e.g., `arr[end]` for the last element, `arr[end-1]` for the second last element, etc.).
3. Slicing syntax remains quite similar, with the difference in indexing starting at 1.
"""

# ╔═╡ 2556064f-24e4-4aeb-9248-9328c0ae98ad
begin
	# Adjusting for 1-based indexing and Julia's `end` keyword:
	println(val_arr6[2:end-1:2])
	println(val_arr6[2:end-1])
end

# ╔═╡ aafc4097-f053-4fdc-935d-bf8a9d8496d0
md"""
Accessing Multi-dimensional Arrays
To access elements in multi-dimensional arrays in Julia, you specify the indices inside a single [] separated by commas. For example:

arr[i, j]

For a 2D array in Julia, this notation will give you the element in the i-th row and j-th column.
"""

# ╔═╡ c3a212f0-5327-4f00-bc68-d469b0e60108
begin
	mat1 = [5 8 1 7; 3 2 4 2.5; 9 0 1 6]
	println(mat1)
end

# ╔═╡ b1d5ee7f-489c-4edb-8f40-a44eeb18fb37
""" to access the value 3 in the 2nd row, 1st column, we would do: """

# ╔═╡ 87b395e5-e1be-4c3c-9623-42d7156fae0f
println(mat[1, 2])

# ╔═╡ 02b9cdbf-f473-44d5-bc2c-12787850010e
md"""
Note: Accessing elements in multi-dimensional arrays in Julia is slightly different than how you might access nested lists in other languages, where you'd use separate sets of [] for each level of the list. This distinction can lead to confusion, so be cautious and pay attention to potential error messages.

One of the powerful features of Julia is the ability to slice multi-dimensional arrays. By simply replacing a specific index (like the 1 in mat[1, 1]) with the slicing notation, you can access various parts of the array. For instance, if you want to extract the vector [2, 4] from a matrix, found in the second row and spanning the second and third columns, here's how you'd slice to retrieve that segment:
"""

# ╔═╡ abc18f90-0995-4f49-9d8a-d736dcb5ac56
println(mat1[1, 2:4])

# ╔═╡ 7e1891c2-25c3-4cbc-a848-bed77d4d552a
md"""
To include everything in a particular dimension, we can use the : with no start or stop, which says give me all of this dimension. For instance, suppose we wish to access just the 2nd column of our 2d array:"""

# ╔═╡ 56317484-4eba-4098-81dc-91e4b294dad3
println(mat1[:, 2])


# ╔═╡ 4df64e9d-c10c-4b2b-a602-c3e0c4708777
md"""
If you have encountered linear algebra, you might observe that the result is a 1D array (or vector). In Julia, similar to NumPy in Python, there isn't a strict differentiation between row and column vectors when working with basic arrays. When you slice a matrix to obtain a single row or column, the result is a one-dimensional vector. If you specifically need a 2D column or row matrix representation, you can reshape the vector accordingly, but in most cases, this isn't necessary, and operations will interpret vectors appropriately based on their context.

We demonstrated this with a 2D array, but the same logic applies to arrays with higher dimensions in Julia. When accessing or slicing, simply list the index or slice for each dimension, separated by commas.

In Julia, while most operations will automatically adjust based on the given vectors, if you ever find the need to reshape vectors into 2D matrices, you have functions like reshape() available. However, in many scenarios, as mentioned, this isn't strictly necessary.
"""

# ╔═╡ 06a42947-a7ec-4723-9c65-6ea00a5d425c
md"""
Array Attributes
In Julia, arrays come with several associated properties. While not strictly termed as "attributes" in the object-oriented sense (since Julia is not primarily object-oriented like Python), these properties provide essential information about the array.

The most crucial properties of Julia arrays are:

eltype - Returns the type of the elements in the array.
size - Returns the shape of the array as a tuple.
ndims - Returns the number of dimensions of the array.
length - Returns the total number of elements in the array. (Be cautious not to confuse this with size).
"""

# ╔═╡ f0fd1cb8-d0ab-4717-9d61-e3ab5118fab1
md"""
##### Examples """

# ╔═╡ 0dd9aa2c-c11e-43e3-a53f-75cfec90b9aa
mat2 = [5 8 1 7; 3 2 4 2.5; 9 0 1 6]

# ╔═╡ fcdbab68-b55b-47dd-b5e9-31cc4546c490
println(mat2)

# ╔═╡ 18b6a52a-cbc7-4780-ae7a-688e821c5a39
println(eltype(mat2))

# ╔═╡ 18b97af1-71fd-4ce1-b827-da7a555b9dca
println(size(mat2))

# ╔═╡ d5f3fce4-765a-4788-8369-d6dcdb253994
println(ndims(mat2))

# ╔═╡ 7296aed3-7ccc-49c4-81bc-25caee184512
println(length(mat2))

# ╔═╡ 888fb03f-b842-404f-bcf9-dbf5be5b0062
md"""
### Operators, Functions, Methods
One of the outstanding features of Julia is the extensive array of built-in functions and operations available for arrays. While the foundation remains similar to Python's numpy, Julia is designed from the ground up for numerical computing, offering many efficient and direct ways to work with arrays. When in doubt, consulting Julia's official documentation or performing a web search can provide insights into available functionalities.

A significant advantage of Julia arrays is that many operations work elementwise on entire arrays without the need for explicit loops. In many cases, loops in Julia are just as fast as vectorized operations due to the language's just-in-time (JIT) compilation, but taking advantage of built-in operations can make code more concise and readable.

##### Elementwise Operations
By default, many operations in Julia act elementwise on arrays. For these operations, just use the standard operators prefixed with a dot (.) to indicate elementwise operations:

Addition: .+
Subtraction: .-
Multiplication: .*
Division: ./
Exponentiation: .^
Comparisons: .==, .>, .>=, .<, .<=
These operations can be applied to arrays of any dimension, processing corresponding elements in the arrays.

#### Examples 1D

"""

# ╔═╡ e13e8751-914b-4ffa-b66e-3e590a50752b
begin
	arr6 = 1:4  # This is equivalent to Python's arange(1,5)
	arr7 = [4, 2, 1, 4]
	println(arr6)
	println(arr7)
	
end

# ╔═╡ ba75ab5a-05d6-4917-a20f-74ad0de2049f
begin
	add = arr6 .+ arr7
	mul = arr6 .* arr7
	div = arr6 ./ arr7
	sub = arr6 .- arr7
	squared = arr6 .^ arr7
	
	println("addition:")
	println(add)
	println("multiplication:")
	println(mul)
	println("division:")
	println(div)
	println("subtraction:")
	println(sub)
	println("power:")
	println(squared)
	
end

# ╔═╡ daf163e6-9624-4439-9b01-0e92edcdce9d
begin
	println(arr1 .== arr2)
	println(arr1 .< arr2)
end

# ╔═╡ de0efecc-b0c6-465e-9e91-c9740c800fd9
md"""
Note that the comparison operators return an array indicating whether each of the individual element-wise comparisons evaluated to true or false.

Above we performed these operations with two 1D arrays of the same shape. These could have just as easily been 2D arrays, 3D arrays, etc. In Julia, operations can also be performed between arrays and individual values, with the operation being applied element-wise to each element of the array.


In Julia, boolean values are true and false (starting with a lowercase letter), unlike Python's True and False.


"""

# ╔═╡ 2e9df58e-7ca5-49c9-b560-fbb03e1a5531
begin
	mat3 = [5 8 1; 3 2 4; 9 0 1]
	println(mat3 ./ 2)  # divides each element by 2
	println(mat3 .+ 1)  # adds 1 to each element
	println(mat3 .^ 2)  # squares each element
end

# ╔═╡ 7247a9ed-b18c-4253-b7c7-cfc04160de1d
md"""
##### Checking Containment

Like with arrays in Julia, we can use in to see if a value is present within an array:

 val in arrname

Similarly to arrays in Julia, this can be used as a condition within an if statement to control the flow of the program based on the presence of a value.
"""

# ╔═╡ 8bbb6b60-ba72-4a6d-901e-379034082e2c
begin
	println(9 in mat)
	println(-9 in mat)
end

# ╔═╡ c7b81473-acb9-4840-9128-f82f9adc034e
md"""
#### Functions

When working with Julia arrays, many built-in functions are designed to work on the array as a whole, performing the function on each element without the need for explicit loops.

##### Mathematical Functions

Julia provides a wide range of mathematical functions that work element-wise on arrays:

- Exponential: exp.(arr)
- Absolute value: abs.(arr)
- Logarithms: log.(arr), log2.(arr), log10.(arr)
- Trigonometric functions: sin.(arr), cos.(arr), tan.(arr), etc.
- Rounding: round.(arr, digits=ndecimals), floor.(arr), ceil.(arr)

###### Mathematical Function Examples
"""

# ╔═╡ 4ec60abd-b396-4951-b6bb-a3b633061b0f
begin
	arr8 = 1:3
	arr9 = LinRange(-2, 2, 10)
	println(exp.(arr8))
	println(log2.(arr8))
	println(abs.(arr9))
	println(round.(arr9, digits=2))
	
end

# ╔═╡ a113ee5d-135d-4cab-874c-d9f1d8cac7eb
md"""

- arrname.reshape(newshape) - In Julia, this is done using `reshape`
reshape(arrname, newshape...)

- arrname.sort() - In Julia, `sort!` is an in-place sort
sort!(arrname)

- If you want a copy in Julia:
sorted_array = sort(arrname)

- arrname.argsort() - In Julia, this can be done with `sortperm`
order_indices = sortperm(arrname)

- arrname.cumsum() - In Julia, this is done using `cumsum`
cumulative_sums = cumsum(arrname)

- arrname.cumprod() - In Julia, this is done using `cumprod`
cumulative_products = cumprod(arrname)

- arrname.flatten() - In Julia, this is done using `vec`
flattened_array = vec(arrname)

- arrname.astype(dtype) - In Julia, you can use `convert` with broadcasting
converted_array = convert.(DesiredType, arrname)

- arrname.copy() - In Julia, this is done using `copy`
copied_array = copy(arrname)

"""

# ╔═╡ e31f81b8-3ff7-434c-b2b7-4efd3e4067e7
begin

arr10 = collect(0:11)  # Convert the range to an array
mat4 = reshape(arr10, 3, 4)'  # Transpose to match Python reshaping
println(mat4)

mat4[1,1] = 100
println(mat4)
println(arr10)

end

# ╔═╡ d5fcf142-aead-416a-a594-fbebf5cfb1ba
md""" 
###### Examples - Sorting """

# ╔═╡ 7b71bcd3-dbd9-4021-920e-c20860d35c18
begin
	arr12 = [4, 1, 2, 8]
	println(sortperm(arr12))
	arr13 = copy(arr12)
	sort!(arr13)
	println(arr13)
	
end

# ╔═╡ 299f1afa-b2f2-4067-ad44-2488898dab62
md"""
###### Example - Cumulative Sum
"""

# ╔═╡ 448273d1-8328-49de-b053-cb6b539d17c0
println(cumsum(arr12))

# ╔═╡ 420b7c3a-0e42-4d3d-9730-f18028f5b774
begin
	
	mat6 = [3 6 1; 2 -1 9; 8 4 3]
	println("unsorted")
	println(mat6)
	
	mat7 = sort(mat6, dims=1)  # sorts each column independently
	println("sorted down each column")
	println(mat7)
	
end

# ╔═╡ 9add4c42-bb6f-4f0a-9efc-37fe967fd978
md"""
#### Reduction Operations in Julia
The operations we've encountered so far all returned arrays with the same dimensions as the input. However, Julia also provides functions for various reduction operations that transform arrays from a higher dimension to a lower one (thereby "reducing" the dimension). These functions can be employed to calculate things like the maximum value in an array, the minimum value, the total sum of all array elements, the median, and so on.

In Julia, there are numerous reduction functions available. Some examples include:

- sum(): Calculates the sum of all the elements in an array.
- minimum(), maximum(): Return the smallest and largest values of an array, respectively.
- mean(): Computes the average of the array values (from the Statistics module).
- median(): Returns the median value of the array.
- prod(): Computes the product of all elements in an array.
"""

# ╔═╡ bf2b2b70-1dd2-4d00-a39b-ac689eb0e3ab
md"""
##### Functions for Reduction in Julia. 
For a given array, arr, in Julia:

###### Minimum value:
- Julia: minimum(arr)
###### Maximum value:
- Julia: maximum(arr)
###### Sum of elements:
- Julia: sum(arr)
###### Mean/Average of elements:
- Julia: mean(arr) (You'll need to use the Statistics module for this in Julia: using Statistics)
###### Standard Deviation:
- Julia: std(arr) (Also from the Statistics module)
###### Index of the Minimum value:
- Julia: argmin(arr)
###### Index of the Maximum value:
- Julia: argmax(arr)
"""

# ╔═╡ 6820d1c7-18cd-452f-9572-586faa018e85
md"""
##### Functions for Reduction

The methods mentioned in the Python section are also available as functions in Julia. Some additional useful functions include:

- countnz(arr): Counts the number of non-zero elements.
- any(arr): Returns true if any element of arr is true.
- all(arr): Returns true if all elements of arr are true.
- median(arr): Computes the median of all elements in arr.

In Julia, you can call these functions directly on the array without needing to prefix them with np. or use them as methods.
"""

# ╔═╡ cc4a0775-1550-4f21-a293-08dc4f9d5298
begin
	
	mat9 = [5 7 -8; 1 3 -4; 12 0 1; 0 2 5]
	
	println(count(!iszero, mat9))   # Count of non-zero elements
	println(median(mat9))    # Computes the median
	
	tfarr = Bool[true, false, false]
	println(any(tfarr))     # Checks if any element is true
	println(all(tfarr))     # Checks if all elements are true
	
end

# ╔═╡ f63e714e-a04d-432f-b934-aa1e13a208d0
md"""
It's very common to combine any(), all(), and count(!iszero, ...) with a logical comparison. For instance, I could use this to check if my array has at least one element greater than some number, or count the number of elements greater than some number.

The main difference from python to julia is the substitution of count_nonzero() with count(!iszero, ...)
"""

# ╔═╡ 7889f861-1ffb-48ed-be00-48b8bf553147
begin
	arr14 = [5, 2, 1, 8, 4, 9]
	println(any(arr14 .> 6))
	println(count(x -> x > 6, arr14))
end

# ╔═╡ 99c4527a-a503-443f-bb1e-f088d87ff7d6
md"""
###### Reducing over Specific Dimensions

All these reduction operations are more versatile than just the basic examples provided. Each reduction function accepts a dims argument, specifying the dimension over which we want to reduce. The dimension represented by this dims will be collapsed during the reduction process.
"""

# ╔═╡ 96efaf46-56f5-4398-893f-9efffdf4c9e1
begin
	mat_var = [5 7 -8; 1 3 -4; 12 0 1; 0 2 5]
	println(minimum(mat_var, dims=1))  # one min for each row
	println(minimum(mat_var, dims=2))  # one min for each column
end

# ╔═╡ 18640e6a-96e0-40d7-b60f-20a201f0edc8
md"""
##### Looping Through Arrays
While it's best to avoid using loops as much as possible with Julia arrays, by leveraging broadcasting, reduction functions, and other array functions, it is sometimes necessary to loop through arrays. Typically, when looping through Julia arrays, you can loop through the indices directly. For 1D arrays:
"""

# ╔═╡ 6038179d-50a3-4dbb-88fb-760b170b30c7
md"""
In Julia, some of these constants are available directly as built-in global constants, and others can be found in the `MathConstants` module. Here's a translation of the Python notes to Julia:

##### Constants
Similar to Python's math module and numpy, Julia provides built-in mathematical constants. 

The primary constants in Julia are:

- `ℯ` or `MathConstants.e` for the base of the natural logarithm
- `π` or `MathConstants.pi` for the value of pi
- `Inf` for infinity
- `NaN` for "Not a Number"

To use the constants from the `MathConstants` module, you need to import them:



Note: While `ℯ` and `π` can be used directly in Julia without any imports, using the `MathConstants` module gives you access to a variety of other useful mathematical constants too.
"""

# ╔═╡ 2bdd40ff-18dd-4640-874d-6dc6c824ff8f
md"""
The last 2 (inf and nan) are unique and represente infinity and not a number, respectively.
"""

# ╔═╡ cf3bcf25-5e1e-494a-8b51-e9c512f3bf00
println(Inf * 3)


# ╔═╡ 6c895685-57bb-48f7-a8e4-bb2c33ca668d
md"""
##### Files
We have already seen a few options for reading and writing to files. Often, we work with data as lists of lists or iterate through each row, breaking the row into a list. However, when dealing with numerical data, we might prefer to directly read it into an array for various operations.

If the data is numerical and in a well-formatted, delimited file (such as tab-separated or comma-separated), then we can directly read the data into an array using Julia's built-in functions. These functions are most efficient when the data consists of numerical values.

In Julia, the primary functions to read delimited files are found in the DelimitedFiles module:

Here are some of the primary options:

- The second argument specifies the delimiter. For a tab-separated file, we use '\t'. For a comma-separated file, we use ','.
- header=true means that the first line of the file is treated as column names.
- skipstart allows you to specify how many rows at the beginning of the file to skip.
- skipblanks skips any blank lines.
- use_mmap can be used to memory-map the file for potential performance improvements.
- comments and comment_char can be used to specify if and how comment lines are recognized and skipped.


"""

# ╔═╡ cbd6c70f-a483-46b9-a067-5037c697ca5f
md"""
#### Linear Algebra
One of the areas where Julia really shines is linear algebra. Julia, in its base form without requiring any additional packages, has extensive support for linear algebra operations, leveraging libraries like OpenBLAS or Intel MKL.

Big picture, the operation arr1 * arr2 is fundamental in Julia. Depending on the dimensions of arr1 and arr2, the behavior varies:

- If both arr1 and arr2 are 1D, then it performs an inner (dot) product of the vectors. In Julia, you can use dot(arr1, arr2) to ensure you're calculating the dot product.
- If arr1 is 2D and arr2 is 1D, then it performs a matrix-vector product.
- If arr1 and arr2 are both 2D arrays, then it performs matrix-matrix multiplication.
Unlike numpy, which uses the .dot() method or np.dot() function, Julia uses natural mathematical notation for these operations, making the code more readable and intuitive.

"""

# ╔═╡ 1e1f020b-9e86-4344-bd0b-4b241447323a
md"""
###### Example - Inner Product
"""

# ╔═╡ 57d36c7f-c7e4-4ba6-ad82-554e68b7d532
begin
	arr15 = 0:3
	println("----- arr15 -----")
	println(arr15)
	
	arr16 = -2:1
	println("----- arr16 -----")
	println(arr16)
	
	println("----- dot(arr15, arr16) -----")
	result4 = dot(arr15, arr16)
	println(result4)
	
end

# ╔═╡ 2bf9e319-917e-4246-ae22-53f3ce2bc8d7
md"""
###### Example - Matrix-vector product
"""

# ╔═╡ 816f4cd1-1704-4db5-b5b7-e2797844497b
begin
	
	
	A = reshape(0:7, 2, 4)'  # Reshaping in Julia is column-major, so transpose is needed
	println("----- A -----")
	println(A)
	
	x = [1, 2]
	println("----- x -----")
	println(x)
	
	println("----- A * x -----")
	result2 = A * x
	println(result2)
	
end

# ╔═╡ 3b763817-c352-4e6a-b702-6f3a07250522
md""" 
###### Example - Matrix-matrix product
"""

# ╔═╡ b6c72947-a1e3-4b86-89bb-cdfd7477724b
begin
C = [3 4 2; -1 2 2]
println("----- A -----")
println(C)

B = [2 1; 1 1; 3 -1]
println("----- B -----")
println(B)

println("----- C * B -----")
result3 = C * B
println(result3)

end

# ╔═╡ 5e7e4aba-f4e4-44e4-b5ee-2e360e634523
md"""
The @ symbol is a shorthand operator for matrix multiplication. Let's see how it works with the matrices A and B:
"""

# ╔═╡ df7d1316-fe91-4153-bb5c-80f48b9e9cdf
md"""
#### Broadcasting

Broadcasting is the final major aspect of Julia arrays, particularly in understanding their behavior. Broadcasting describes how Julia handles operations involving arrays of different sizes. Unlike requiring both arrays to be the same size for element-wise operations, Julia will automatically extend the smaller array conceptually to make it compatible. For example, if you add a scalar to a vector, Julia will add the scalar to each element of the vector. You can think of this as stretching the scalar value to match the shape of the vector, without the need to explicitly create an array that results from stretching the scalar value.

Julia's broadcasting is not limited to operations with scalars and vectors; it also applies to multi-dimensional arrays. Julia works from the end dimension to the start dimension, checking if the dimensions are compatible for each of the arrays involved in the operation. Dimensions are considered compatible if either:

1. They are equal.
2. One of them is 1.

Let's take a brief look at an example in Julia:
"""

# ╔═╡ 40d3473e-3ad7-44be-98f0-e1995673fae1
begin
# Define a matrix
mat15 = reshape(0:11, 4, 3)
println("----- mat -----")
display(mat15)

# Define a vector
vec = [3, 0, 1]
println("----- vec -----")
display(vec)

# Add the vector to the matrix using broadcasting
result5 = mat15 .+ vec'  # Transpose the vector to make broadcasting work
println("----- mat+vec -----")
display(result5)
	
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "c0bdc58e4ea3045dc4bb44be81bb1f3b06ae231f"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╠═dd6ce920-648e-11ee-0b19-61c22109a4d5
# ╠═040f452d-4194-4cbe-8586-be076021c431
# ╠═6430bccb-d828-4c9c-b7b4-1e4bbc7994b8
# ╠═7e7946b6-715e-4d12-8e23-bfcc7b2b4c3a
# ╠═379e01f9-6e73-4b7d-a11d-201cdfc7dad3
# ╠═f909d883-ad08-4350-9378-36fe69ca0fef
# ╠═47335618-d4fb-4a71-9288-97efb2a2d9c0
# ╠═4eb2fb9f-3e64-4c0a-a398-d88467626cc0
# ╠═7c1fb7ff-5beb-4d38-8e07-0f557905ee87
# ╠═e222a985-8a51-4c92-b9e2-258a17477bb8
# ╠═4e964216-073e-4ea6-8c9c-1c02ff463796
# ╠═5c4f30be-cdec-49ca-9c66-81d970ec6477
# ╠═6dc94005-38a9-4ea1-8c04-c7fab8f8a5ce
# ╠═6956d7e0-40a2-45ba-b7bc-91c09c371e71
# ╠═4b413e6b-a7c2-44b9-880b-cc780ba7a21f
# ╠═d4a28273-635a-49e7-be79-38f0d9e3137c
# ╠═3441c076-0924-43e7-8b5f-bad48e599d46
# ╠═094ccb94-eff6-49e6-8382-f545e87e77cf
# ╠═50c8df75-1e35-41f3-8845-db296e4da2d3
# ╠═f724db86-c7f7-4d47-a442-441d66eea5b2
# ╠═02c7434d-61fd-4eef-94a5-5f2741beab70
# ╠═528b3117-9df7-4bad-b147-b32e563f720a
# ╠═953d5fe3-1460-44fb-9ba3-d03fa6c87794
# ╠═510cd8eb-f7f3-482e-8928-f6acf29efbbb
# ╠═79ffcc7c-07f9-47ac-927d-0070cd847ba4
# ╠═8237e89a-9ca9-4cc7-8969-16667cf21522
# ╠═5163f9fc-21cd-4765-904d-f1e3a72f7a8f
# ╠═6aacf2a1-c883-4c0e-95f6-c558c15f5ffa
# ╠═466c5f56-80e1-48be-abfc-7282ac5a3256
# ╠═21832db4-4d39-45e8-aadf-92b89dd3eea0
# ╠═2c2e7948-02c1-45b8-9490-69a18dcbb9d5
# ╠═81b7ed46-7105-4346-86ab-afde23012fae
# ╠═4de06031-7cf5-48cd-b669-61be69c90f73
# ╠═2556064f-24e4-4aeb-9248-9328c0ae98ad
# ╠═aafc4097-f053-4fdc-935d-bf8a9d8496d0
# ╠═c3a212f0-5327-4f00-bc68-d469b0e60108
# ╠═b1d5ee7f-489c-4edb-8f40-a44eeb18fb37
# ╠═87b395e5-e1be-4c3c-9623-42d7156fae0f
# ╠═02b9cdbf-f473-44d5-bc2c-12787850010e
# ╠═abc18f90-0995-4f49-9d8a-d736dcb5ac56
# ╠═7e1891c2-25c3-4cbc-a848-bed77d4d552a
# ╠═56317484-4eba-4098-81dc-91e4b294dad3
# ╠═4df64e9d-c10c-4b2b-a602-c3e0c4708777
# ╠═06a42947-a7ec-4723-9c65-6ea00a5d425c
# ╠═f0fd1cb8-d0ab-4717-9d61-e3ab5118fab1
# ╠═0dd9aa2c-c11e-43e3-a53f-75cfec90b9aa
# ╠═fcdbab68-b55b-47dd-b5e9-31cc4546c490
# ╠═18b6a52a-cbc7-4780-ae7a-688e821c5a39
# ╠═18b97af1-71fd-4ce1-b827-da7a555b9dca
# ╠═d5f3fce4-765a-4788-8369-d6dcdb253994
# ╠═7296aed3-7ccc-49c4-81bc-25caee184512
# ╠═888fb03f-b842-404f-bcf9-dbf5be5b0062
# ╠═e13e8751-914b-4ffa-b66e-3e590a50752b
# ╠═ba75ab5a-05d6-4917-a20f-74ad0de2049f
# ╠═daf163e6-9624-4439-9b01-0e92edcdce9d
# ╠═de0efecc-b0c6-465e-9e91-c9740c800fd9
# ╠═2e9df58e-7ca5-49c9-b560-fbb03e1a5531
# ╠═7247a9ed-b18c-4253-b7c7-cfc04160de1d
# ╠═8bbb6b60-ba72-4a6d-901e-379034082e2c
# ╠═c7b81473-acb9-4840-9128-f82f9adc034e
# ╠═4ec60abd-b396-4951-b6bb-a3b633061b0f
# ╠═a113ee5d-135d-4cab-874c-d9f1d8cac7eb
# ╠═e31f81b8-3ff7-434c-b2b7-4efd3e4067e7
# ╠═d5fcf142-aead-416a-a594-fbebf5cfb1ba
# ╠═7b71bcd3-dbd9-4021-920e-c20860d35c18
# ╠═299f1afa-b2f2-4067-ad44-2488898dab62
# ╠═448273d1-8328-49de-b053-cb6b539d17c0
# ╠═420b7c3a-0e42-4d3d-9730-f18028f5b774
# ╠═9add4c42-bb6f-4f0a-9efc-37fe967fd978
# ╠═bf2b2b70-1dd2-4d00-a39b-ac689eb0e3ab
# ╠═dc3735ea-81bd-431d-ae5b-d2ea94819d67
# ╠═6820d1c7-18cd-452f-9572-586faa018e85
# ╠═cc4a0775-1550-4f21-a293-08dc4f9d5298
# ╠═f63e714e-a04d-432f-b934-aa1e13a208d0
# ╠═7889f861-1ffb-48ed-be00-48b8bf553147
# ╠═99c4527a-a503-443f-bb1e-f088d87ff7d6
# ╠═96efaf46-56f5-4398-893f-9efffdf4c9e1
# ╠═18640e6a-96e0-40d7-b60f-20a201f0edc8
# ╠═6038179d-50a3-4dbb-88fb-760b170b30c7
# ╠═2bdd40ff-18dd-4640-874d-6dc6c824ff8f
# ╠═cf3bcf25-5e1e-494a-8b51-e9c512f3bf00
# ╠═6c895685-57bb-48f7-a8e4-bb2c33ca668d
# ╠═cbd6c70f-a483-46b9-a067-5037c697ca5f
# ╠═1e1f020b-9e86-4344-bd0b-4b241447323a
# ╠═57d36c7f-c7e4-4ba6-ad82-554e68b7d532
# ╠═2bf9e319-917e-4246-ae22-53f3ce2bc8d7
# ╠═816f4cd1-1704-4db5-b5b7-e2797844497b
# ╠═3b763817-c352-4e6a-b702-6f3a07250522
# ╠═b6c72947-a1e3-4b86-89bb-cdfd7477724b
# ╠═5e7e4aba-f4e4-44e4-b5ee-2e360e634523
# ╠═df7d1316-fe91-4153-bb5c-80f48b9e9cdf
# ╠═40d3473e-3ad7-44be-98f0-e1995673fae1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
