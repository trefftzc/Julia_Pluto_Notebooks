### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 407e17b7-d9e9-4829-bcf7-3ee17898ce52
md"""
# Python Basics
This notebook will walk through some of the basics of Python:

1. hello world program
2. literal types
3. variables
4. operators and expressions
"""

# ╔═╡ 6db0cc64-7757-4289-9073-d46bb7baba6f
md"""
### Hello World
Hello, World! in Julia Notebook:

Here's how you can print "Hello, World!" in a Julia notebook:
"""

# ╔═╡ f99d5c20-5268-11ee-32e7-cde9890479d9
println("Hello, World!")

# ╔═╡ ea555fd4-0883-4167-b012-72d26fe58b97
md""" 
### Basic Types
"""

# ╔═╡ 5531e5fd-0cc3-445f-8184-798e95536823
println(5)

# ╔═╡ cc74b2ed-6d19-4130-b721-1981e566fe36
md"""
Integers are created using int1, int2, and int3.

Floats are created using float1, float2, and float3.

Complex numbers are created using complex1.

Strings are created using str1 and str2.

Booleans are created using bool_true and bool_false.

The println() function is used to print the value of int2, and typeof() is used to check its type.
"""

# ╔═╡ ff2e6efa-a269-4fe3-ab28-73a286c6d656
md"""
So, let's look at the value -2. We can type this in, print it, etc. We can check what type it is by using the typeof() function.
"""

# ╔═╡ 307712a5-c9dd-4e0d-9e39-e8f2ac16da88
typeof(-2)

# ╔═╡ c28c6904-6e58-4b77-8384-094a18132834
typeof(5im)

# ╔═╡ 7c3778d6-cc5a-4946-970c-7ef318b78f3c
md"""
### Important Notes
If you are paying close attention, you'll notice the output from typeof() looks a little different from what you may see elsewhere. This is an artifact of Jupyter notebooks. We're never actually printing the output of typeof(), but the default for a notebook is to display the output of the last command in the code block, and it displays it using a slightly different function. You can see the exact output you'd likely see elsewhere by using println() as well (though there's really no need to unless you want the output for more than one line in a single code block).
"""

# ╔═╡ a2196657-0d5b-44b2-80dd-d5b45a791b99
print(typeof(-2))

# ╔═╡ 8dd67b0d-716f-4016-bfcf-59f0cd1bde58
md"""
Numerical types (`Int`, `Float64`, `Complex{Float64}`) cannot contain strings, but strings can represent numbers when they are enclosed in double quotes.
"""

# ╔═╡ 649b1d94-e425-4331-a58b-6ec838fa5902
println(typeof("2.73"))

# ╔═╡ 6bea5c78-b7ee-41b8-b0cb-fa7b8f720173
md""" 
Strings in Julia can be enclosed using double quotes "hi", but single quotes 'h' are used to represent characters. Mixing them in a single string is not allowed.
"""

# ╔═╡ 63dace2b-6629-436a-bb03-afc556cba730
md"""
Strings in Julia that require quotes inside can either use double quotes and contain single-quoted characters, or they can escape the double quotes using a backslash. For example, "It's a string" or "He said, \"Hello!\"".
"""

# ╔═╡ 282c560f-2df6-468a-9b87-770c1db247d8
begin
	string_with_single_quote = "It's a string"
end

# ╔═╡ 3f627e9f-74e1-468b-8d63-22067a10da69
begin
     string_with_escaped_double_quotes = "He said, \"Hello!\""
end

# ╔═╡ 871fa98e-d853-4c44-aea1-e6dd3dd69eba
md"""
In Julia, don't use commas within numbers as they're not interpreted as thousands separators. Instead, commas are used in array literals.
You can use scientific notation with the `e` notation in numbers, without spaces.

"""

# ╔═╡ e1cb72c4-b66f-48bf-8d29-2c7ce30ac786
# This is a number in scientific notation
num = 1.5e3  # Represents 1500.0

# ╔═╡ 4dd69d8b-321e-4601-a86d-71567870713c
1e-3

# ╔═╡ 2f5a5497-3746-476b-a5da-57c294cf47f4
md"""
## Variables
"""

# ╔═╡ 0f861b9c-7d9f-4404-a97d-4b1fd4076672
md"""
Just entering the values isn't very helpful, sometimes we want to store a value and manipulate it. A variable is a name that refers to a value. We can create variables with assignment statements:
"""

# ╔═╡ a1935b54-902f-4d0d-9a34-c2abfbd1f403
begin
	var1 = 5
	var2 = "hello"
	var3 = 7.8
end

# ╔═╡ 7295eac6-443c-4a4a-98b3-4d7599c8e49a
md"""
Notice there was no output, because all that happened was binding of the names on the left to the literal values on the right. The same way we could println() a literal, we can println() a variable to see it's value. This is far more helpful than printing the value of a literal!
"""

# ╔═╡ f57f42db-0f34-4d84-82ff-c8933d40b4dc
begin
	println(var1)
	println(var2)
	println(var3)
end

# ╔═╡ d8df4d7e-e90d-4d66-b475-caa298eeee40
md"""
 The value a variable refers to can change over the course of the program.But inside the cell it was first called. Like below
"""

# ╔═╡ cfa5038a-7095-4c52-a8f7-58f8577217a2
begin
	var4 = 5
	println(var4)
	var4 = 10
	println(var4)
end

# ╔═╡ 293e203b-178c-4e80-b611-66dedd5169a6
md"""
Note that we can change more than just the value, the variable can be changed to refer to a different type. If you've used a different programming language before, this is a little different.
"""

# ╔═╡ 6e0c90e4-f235-4ef2-8085-37c624effe87
begin
	 var5 = 10
	 println(typeof(var5))
	 var5 = "goodbye"
	 println(var5)
	 println(typeof(var5))
end

# ╔═╡ c555aff2-bd04-4dd6-96b7-1b193b645f40
md"""
### Variable Names
Consider the following block of code. What do you think it does? Is it obvious? If this was your code and you didn't use it for 6 months, would you have any idea it's purpose when you came back to it? If someone else gave you this, how would you know what it means?
"""

# ╔═╡ ee4690ba-595e-4d62-9fcb-2e2a4a143304
begin
	b = 4
	c = 1
	d = 6
	a = b + c*d
end

# ╔═╡ 7b41c493-b3b6-4976-bbbe-a1539de1391a
md"""
Now, consider the same exact code with different variable names.
"""

# ╔═╡ fb8e142c-0d0a-46aa-834c-6527823fcac2
begin
	init_velocity = 4
	acceleration = 1
	time = 6
	velocity = init_velocity + acceleration*time
end

# ╔═╡ 365d12fc-d407-429f-951c-135a03635411
md"""
Quite a bit easier to understand, right? Using descriptive variable names is crucial. The general consensus is to use short, but still descriptive variable names. They should be document the actual purpose of the variable. However, because programmers are often lazy (and you'll be typing your variable names a lot), it's not uncommon to abbreviate them slightly. For instance we could have used t instead of time and still easily understood what it meant.
"""

# ╔═╡ 5f905933-eb1c-4901-bd0d-59e1aede509a
md"""
###### Requirements for Variable Names
Descriptive variable names are extremely important, but not required by the python itself. There are some rules and conventions for variable names, however:

can contain only uppercase and lowercase letters, numbers, and underscores
cannot start with a number
cannot contain other characters
cannot be any of julia's keywords
"""

# ╔═╡ d39566e6-638d-4ccb-8442-4d2b13ddcf66
md"""
###### Conventions for Variable Names in Julia:
- Descriptive, yet concise.
- Typically, use all lowercase with underscores separating words (snake_case).
- CamelCase is less common in Julia for variable names but is used for type (struct) names.
- Only start a variable with an underscore in specific cases, such as indicating it's meant for internal use or is less relevant for users.
"""

# ╔═╡ bd8e4884-a0ad-4d96-9fa1-832331e5e0b9
begin
	string_of_vowels = "aeiou"
	stringOfVowels = "aeiou"
end

# ╔═╡ 20d47427-b45b-46d7-a9ab-c39457474c23
md"""
### Julia Basics
Now that we've covered the basic types and variables provided by Julia, let's go through some of the basic operations that can be performed. We'll get into far more advanced operations that can be performed through functions later -- for now we'll just take a look at a few of the basic operators.
"""

# ╔═╡ 591abb32-eefe-4480-8c21-b29903765bc7
md"""
#### Operators
"""

# ╔═╡ aada08b7-ae31-40cf-9b43-9372ec940584
md"""
Julia also supports the standard operators:

+ : addition
- : subtraction
* : multiplication
/ : division
^ : exponentiation  (Note the difference: Julia uses `^` instead of Python's `**` for exponentiation)

Operators are used in the general form <operand> <operator> <operand>, where each <operand> can be either a variable name or a literal. When acting on int and float types, these operators behave as expected. For example:
"""

# ╔═╡ 3a2bec12-03cb-46e8-83a4-3cb42a3be5e8
1 + 1

# ╔═╡ c7bc88d6-b27c-48c7-9c19-f857bf4063ea
begin
	x = 7
	x + 1
end

# ╔═╡ a53f99ef-59af-436f-97f1-b2c4c8d76a85
begin
	y = 8
	x + y
end

# ╔═╡ f2cbaf92-6a46-4096-84b6-1185908b49ed
begin
	p = 2
	q = 5
	p^q
end

# ╔═╡ ec4e404b-3427-4b96-afab-7f5a87433bb5
"""If desired (more often than not it is), the result can be assigned to a variable."""

# ╔═╡ 23295149-278e-4258-9abd-e1ffcb34b1ad
begin
	zi = x + y
	print(zi)
end

# ╔═╡ 952c7064-3a85-46fc-8de3-22dd8c61e846
md"""
#### Order of Operations
Operations can be chained together, much like you would write a larger expression in math. When chained together, they follow the same precedence rules you are familiar with ("please excuse my dear aunt sally"), and you can use parentheses to force the expression to evaluate in a specific order.
"""

# ╔═╡ c07845ca-8890-4b18-ab67-b571ad9fc070
begin
	z = (x*2 + y*3)/3
	print(z)
end

# ╔═╡ d089f72f-a00e-4394-87f8-3462ce97c78e
md"""
###### Type After Operations in Julia:

If you observe closely, you might notice that sometimes the output includes a decimal point (e.g., `.0`), while at other times there's no decimal place. This reflects the type of the result: a value like `18.0` is of type `Float64`, while a value like
"""

# ╔═╡ 4d2ab51a-3522-4d0a-af6a-0d7f3901698b
typeof(z)

# ╔═╡ 32ec41a4-6a83-444e-878f-d83357775cfc
typeof(x)

# ╔═╡ 7069fd43-bd72-4652-947e-f09e0e14911f
typeof(3/2)

# ╔═╡ 6447c267-0f5d-42ae-a6af-25297903f490
typeof(3.0*2)

# ╔═╡ e0c86860-c360-4a50-8c9b-80db9ee59171
typeof(3^2)

# ╔═╡ 848f9082-eeaf-4aa7-9e6d-34316b39b3b6
md"""
##### Additional Operators in Julia:

Apart from the operators mentioned earlier, Julia also has two other commonly used operators, which have the same precedence as multiplication and division:

÷ : integer division — this operates on numbers and performs division, giving a rounded-down result (also known as floor division in some contexts).
% : modulo — this operates on numbers and returns the remainder after division.

For example:
"""


# ╔═╡ 2953807f-ba0b-4489-abb9-cd9022480c32
begin
	num_batches = 3
	cookies_per_batch = 16
	cookies_per_person = 5
	
	leftover = (num_batches * cookies_per_batch) % cookies_per_person
	num_people_fed = (num_batches * cookies_per_batch) ÷ cookies_per_person
	
	println(leftover)
	println(num_people_fed)
end

# ╔═╡ Cell order:
# ╠═407e17b7-d9e9-4829-bcf7-3ee17898ce52
# ╠═6db0cc64-7757-4289-9073-d46bb7baba6f
# ╠═f99d5c20-5268-11ee-32e7-cde9890479d9
# ╠═ea555fd4-0883-4167-b012-72d26fe58b97
# ╠═5531e5fd-0cc3-445f-8184-798e95536823
# ╠═cc74b2ed-6d19-4130-b721-1981e566fe36
# ╠═ff2e6efa-a269-4fe3-ab28-73a286c6d656
# ╠═307712a5-c9dd-4e0d-9e39-e8f2ac16da88
# ╠═c28c6904-6e58-4b77-8384-094a18132834
# ╠═7c3778d6-cc5a-4946-970c-7ef318b78f3c
# ╠═a2196657-0d5b-44b2-80dd-d5b45a791b99
# ╠═8dd67b0d-716f-4016-bfcf-59f0cd1bde58
# ╠═649b1d94-e425-4331-a58b-6ec838fa5902
# ╠═6bea5c78-b7ee-41b8-b0cb-fa7b8f720173
# ╠═63dace2b-6629-436a-bb03-afc556cba730
# ╠═282c560f-2df6-468a-9b87-770c1db247d8
# ╠═3f627e9f-74e1-468b-8d63-22067a10da69
# ╠═871fa98e-d853-4c44-aea1-e6dd3dd69eba
# ╠═e1cb72c4-b66f-48bf-8d29-2c7ce30ac786
# ╠═4dd69d8b-321e-4601-a86d-71567870713c
# ╠═2f5a5497-3746-476b-a5da-57c294cf47f4
# ╠═0f861b9c-7d9f-4404-a97d-4b1fd4076672
# ╠═a1935b54-902f-4d0d-9a34-c2abfbd1f403
# ╠═7295eac6-443c-4a4a-98b3-4d7599c8e49a
# ╠═f57f42db-0f34-4d84-82ff-c8933d40b4dc
# ╠═d8df4d7e-e90d-4d66-b475-caa298eeee40
# ╠═cfa5038a-7095-4c52-a8f7-58f8577217a2
# ╠═293e203b-178c-4e80-b611-66dedd5169a6
# ╠═6e0c90e4-f235-4ef2-8085-37c624effe87
# ╠═c555aff2-bd04-4dd6-96b7-1b193b645f40
# ╠═ee4690ba-595e-4d62-9fcb-2e2a4a143304
# ╠═7b41c493-b3b6-4976-bbbe-a1539de1391a
# ╠═fb8e142c-0d0a-46aa-834c-6527823fcac2
# ╠═365d12fc-d407-429f-951c-135a03635411
# ╠═5f905933-eb1c-4901-bd0d-59e1aede509a
# ╠═d39566e6-638d-4ccb-8442-4d2b13ddcf66
# ╠═bd8e4884-a0ad-4d96-9fa1-832331e5e0b9
# ╠═20d47427-b45b-46d7-a9ab-c39457474c23
# ╠═591abb32-eefe-4480-8c21-b29903765bc7
# ╠═aada08b7-ae31-40cf-9b43-9372ec940584
# ╠═3a2bec12-03cb-46e8-83a4-3cb42a3be5e8
# ╠═c7bc88d6-b27c-48c7-9c19-f857bf4063ea
# ╠═a53f99ef-59af-436f-97f1-b2c4c8d76a85
# ╠═f2cbaf92-6a46-4096-84b6-1185908b49ed
# ╠═ec4e404b-3427-4b96-afab-7f5a87433bb5
# ╠═23295149-278e-4258-9abd-e1ffcb34b1ad
# ╠═952c7064-3a85-46fc-8de3-22dd8c61e846
# ╠═c07845ca-8890-4b18-ab67-b571ad9fc070
# ╠═d089f72f-a00e-4394-87f8-3462ce97c78e
# ╠═4d2ab51a-3522-4d0a-af6a-0d7f3901698b
# ╠═32ec41a4-6a83-444e-878f-d83357775cfc
# ╠═7069fd43-bd72-4652-947e-f09e0e14911f
# ╠═6447c267-0f5d-42ae-a6af-25297903f490
# ╠═e0c86860-c360-4a50-8c9b-80db9ee59171
# ╠═848f9082-eeaf-4aa7-9e6d-34316b39b3b6
# ╠═2953807f-ba0b-4489-abb9-cd9022480c32
