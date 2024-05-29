### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ f6667d90-644f-11ee-0b04-1b4f86e1b95b
md"""
## Strings

A string in Julia is an immutable sequence of characters. In Julia, strings are typically enclosed in double quotes "". If you intend to include a double quote character within the string, you can escape it using a backslash, like this: "This is a \"quote\" within a string".
"""

# ╔═╡ c2e4cb33-c71c-44b9-b2d0-5ad4c0b819ee
begin
	astr = "ah"
	bstr = "won't"
end

# ╔═╡ 5465fb0b-4427-41e1-82a4-1eb1df9fd735
md"""
### Strings in Julia
In Julia, a couple of standard operators also work with strings:

1. str1 * str2 -> returns a new string formed by concatenating str1 and str2.
2. repeat(str1, n) -> returns a new string with str1 repeated n times.
Note that / and - are not applicable for strings in Julia.
"""

# ╔═╡ adb211f4-f59a-46d3-8a66-4241d791976c
begin
	astrr = "ah"
	bstrr = "frog"
	println(astrr * bstrr)
	println(repeat(astrr, 5))
end

# ╔═╡ 78c586fb-f7ff-4b12-b1f6-122d12bb1990
begin
	md"""
	These can also be combined:
	"""
	
	println("a"^3 * "h"^3 * bstr)
	
end

# ╔═╡ 85d4673a-0423-4116-80c0-f22778dfb7c1
md"""
### Special Characters

In many programming languages, certain characters have special meanings when used within strings. These characters can't be directly entered into a string in the usual manner, so they are represented with escape sequences. Here are a couple of the most common special characters:

- **Newline (`\n`)**: Represents a new line. It's used to insert a line break within a string.
- **Tab (`\t`)**: Represents a horizontal tab. It's used to insert a tab space within a string.

To use these characters in a string, you precede them with a backslash (`\`). This backslash indicates that the next character should be treated as a special character.
"""

# ╔═╡ b07f8eba-e7c5-462b-96a9-c24a6b842b82
md"""
\n : Represents a newline character. It's used to start text on a new line within the string.

\t : Represents a tab character. It inserts a horizontal tab space within the string.

To utilize these special characters in Julia, you integrate them directly into the string just as they are. Here's a demonstration:

"""

# ╔═╡ 3a40a6ce-8bfd-4df9-8e25-17ec0de50e3a
begin
	multiline = "a string with\na newline"
	println(multiline)
end

# ╔═╡ b977bad9-2913-4d65-b919-60925c8befea
md"""
### Escape Characters in Julia

In Julia, as in many other programming languages, the backslash `\` is used as an escape character to include special characters within a string. For situations where you need to include characters that Julia typically recognizes for specific purposes (like quotes within a string), the escape character lets you treat them as ordinary characters.

Here are some common escape sequences in Julia:

- `\'` : Represents a single quote within a string.
- `\"` : Represents a double quote within a string.
- `\\` : Represents a backslash within a string, as the backslash itself is the escape character.

For instance, if you need to include both single and double quotes within a string, you can utilize these escape sequences to do so.
"""

# ╔═╡ 9c49b127-4354-46af-bfb0-80393f87c7c2
strquote = "And Harry Potter said \"hello\""

# ╔═╡ 0353ee6e-5b25-4712-8ef8-8baa50583e60
md"""
### Strings as Arrays

In Julia, strings can be treated in ways similar to arrays. This means we can perform many of the same operations as we did with arrays.

#### Indexing and Slicing
1. **Indexing**: Use standard bracket notation: `strname[i]`.
2. **Slicing**: In Julia, slicing is achieved differently as compared to Python. You would use `strname[start:stop]` to slice between specific indices.

Remember, Julia uses 1-based indexing, so the first character is accessed with `strname[1]`.

#### Iteration
The two primary loop styles we used for arrays can be applied for iterating through a string:

1. Iterating through index range and then indexing into the string.
2. Iterating directly through the characters in the string.

#### Checking for Substrings
To verify if a substring exists within a string in Julia, the `in` function is used:

```julia
occursin(substring, strname)
```

This will return `true` if the substring is present in the string, and `false` otherwise.
"""

# ╔═╡ 6e538658-ff77-434a-a8ed-3f63cc50e370
begin
	alpha = "abcdefghijklmnopqrstuvwxyz"
	println(alpha[1])  # Julia uses 1-based indexing
	println(alpha[1:5])
	repeated = ""
	for ch in alpha
	    repeated *= ch^2
	end
	println(repeated)
	println(occursin("aa", alpha))
	println(occursin("aa", repeated))
end

# ╔═╡ 2e288060-9f6b-4b31-8eb2-93ef2fb76495
md"""
When comparing strings, Julia and many other languages use lexicographic (dictionary) order. Here's what it implies:

- Strings are compared character by character.
- If the first characters of two strings are different, the string with the character that comes first in the character set is considered smaller.
- If the first characters are the same, the comparison proceeds with the next character, and so on.
- If a string is a prefix of another, the shorter string is considered smaller.

Knowing this, we can better predict the outcomes of string comparisons.
"""

# ╔═╡ b1a0e462-49cd-435c-8515-ab252441c9bb
begin
	msg1 = "Hello"
	msg2 = "Apple"
	msg3 = "Hello"
	msg4 = "apple"
	
	println(msg1 == msg2)
	println(msg1 == msg3)
	
	println(msg1 < msg2)
	println(msg1 < msg4)
end

# ╔═╡ 615c0b73-365e-4098-8e51-145efa68c129
md"""
You might have assumed that the outputs of the last two lines would match. While the comparisons seem alphabetical, they actually contrast the numerical representations of each character. Due to the distinct numerical values assigned to each letter by the computer, uppercase and lowercase characters are positioned quite differently. This results in varied behavior based on the case of the strings being compared. In the computer's perspective, all uppercase letters precede the lowercase ones.
"""

# ╔═╡ bb608287-6012-495c-856a-caa756e7b8ac
md"""
### Functions on Strings and String Methods

#### Functions
As previously explored, the built-in function `len` can be utilized on strings to ascertain the total character count. Furthermore, the `min` and `max` functions can be applied to strings. They yield the character based on the letter value progression from A-Z followed by a-z. This means, analogous to string comparison, all uppercase characters are perceived as lesser than their lowercase counterparts.
"""

# ╔═╡ c7a9c19b-2915-4015-b0bb-2a65e82d98fa
begin
	msg_ = "julia"
	println(length(msg_))
	println("min is ", minimum(msg_), " max is ", maximum(msg_))
end

# ╔═╡ d72d719e-4031-4460-98a2-c27af08da3f1
md"""
In Julia, just as with Python, strings come equipped with their own set of methods. These can be invoked in the format `methodname(strname, args...)`. While an exhaustive list can be found in the official documentation, we'll touch upon some frequently employed ones.

Importantly, due to the immutable nature of strings in Julia, none of these methods will alter the original string. Instead, if a method is meant to return a string, it will always generate a new one, leaving the original string intact.
"""

# ╔═╡ 84fe255e-e79d-4caa-9524-9902319163c5
md"""
#### Conversion Methods

1. **uppercase(str)**: This method returns a new copy of the string with all characters in uppercase.
2. **lowercase(str)**: It provides a copy where all characters are converted to lowercase.
3. **titlecase(str)**: This results in a new string where the first letter of each word is capitalized.
"""

# ╔═╡ 47fba8a3-51d4-410b-8f7f-31102f78a4b4
begin
	msg5 = "hello"
	msg6 = "Goodbye"
	msg7 = "garfield"
	
	println(uppercase(msg1))
	println(lowercase(msg2))
	println(titlecase(msg3))
end

# ╔═╡ 38b9676c-af49-4dd6-97c2-b39e4ed0bb80
md"""
Trimming Methods in Julia:
- `strip(s)`: Returns a copy of the string `s` with leading and trailing whitespace removed.
- `lstrip(s)`: Returns a copy of the string `s` with leading whitespace removed.
- `rstrip(s)`: Returns a copy of the string `s` with trailing whitespace removed.
"""

# ╔═╡ 64f7a10b-e8f6-458a-8b00-588dc5d919f5
begin
	msg8 = "  2 spaces at the front and some at the end    \n"
	println(msg8)
	println(strip(msg8))
	println(lstrip(msg8))
	println(rstrip(msg8))
end

# ╔═╡ 645c3505-f29b-4b2a-a14c-6b4f6048a154
md"""
For each of these functions in Julia, you can also provide a character or a set of characters to be removed from the beginning and/or end of the string. If given, all occurrences of the provided characters are stripped from the start/end of the string.
"""

# ╔═╡ 807de248-688b-4d6a-aefb-4cfc7bcb3010
begin
	msg9 = "-*-*-*-*aaaHELLOzzz*-*-*-*-"
	println(strip(msg9, ['a', 'z', '-', '*']))
end

# ╔═╡ d3db8a62-6270-48a4-bf3e-2879cfc5522e
md"""
**Miscellaneous String Methods in Julia**

- `findfirst(substring, string)`: Returns the starting index in the string where the substring starts. Returns `nothing` if substring is not in the string.
- `findlast(substring, string)`: Returns the starting index in the string where the last occurrence of substring starts.
- `occursin(substring, string)`: Returns a boolean indicating whether the substring occurs in the string. Raises an error if substring is not found.
- `count(isequal('substring'), string)`: Returns the number of non-overlapping occurrences of substring in the string.
"""

# ╔═╡ e4da67c5-d42a-493d-8a1c-0e85d8b91aed
md"""
**Converting Between Strings and Arrays in Julia**

1. **Splitting Strings**:
   - `split(string)`: Splits a string into an array of substrings using whitespace as the default delimiter. Consecutive whitespace is treated as a single separator.

2. **Joining Arrays**:
   - `join(array, delimiter)`: Joins the elements of the array into a single string, separated by the specified delimiter.
"""

# ╔═╡ 41237e74-e86e-4f70-977b-7389a0b9a9cc
begin
	msg10 = "This is the song that never ends\nit just goes on and on my friends"
	lstmsg10 = split(msg10)
	println(lstmsg10)
	comma_msg10 = join(lstmsg10, ',')
	println(comma_msg10)
end

# ╔═╡ a982a6b0-f2b4-4ab4-9c31-5b368d2e8418
md"""
In Julia, you can specify a delimiter for the `split()` function to decide where to split the string. By default, the string is split on whitespace. If you want to split on a specific character, like a comma, you can provide it as an argument to the `split()` function. This is particularly useful when dealing with data in CSV format or other delimited text files.
"""

# ╔═╡ 3b57c010-28eb-4e6f-87a5-28c835344389
begin
	header = "Day,Month,Year"
	println(split(header, ','))
end

# ╔═╡ d6e41481-8fa6-455e-9d74-362c6dfbd743
md"""
In Julia, converting a string into an array of its individual characters can be achieved using the `collect` function. This can be especially handy when you need to manipulate a large number of characters within a string. While you can work directly with strings, converting them to an array first can prevent creating numerous slightly altered string copies during the modification process.
"""

# ╔═╡ b8fafbaa-e8cb-445f-ba68-d6d8298739da
begin
	msg11 = "hello"
	println(collect(msg11))
end

# ╔═╡ cdb59b16-8a98-4bcf-b1c3-839f82280ac1
md"""
### Formatting in Julia

In Julia, string interpolation is commonly used for inserting values or variables into a string. Instead of using `{}`, Julia utilizes the `$` sign for this purpose.

For the simplest form of string interpolation, just include the variable or expression you want to embed in the string inside `$()` or directly after a `$` if it's just a single variable. For instance:

```julia
name = "Alice"
println("Hello, $name!")
```

This would print `Hello, Alice!`. This provides a convenient way to integrate variables into strings without having to concatenate multiple string parts together.
"""

# ╔═╡ 6a6f6790-e954-4d79-bd8a-5f6abc15f325
begin
	val1 = 5
	val2 = 2
	msg12 = "\$val1 / \$val2 = \$(val1/val2)"
	println(msg12)
end

# ╔═╡ e5c72a85-ef69-4be9-b1d8-a56056989053
md"""
In Julia, while you typically use string interpolation without explicitly numbering the variables, if you want to use the same variable multiple times (or control the order differently than they're listed), you can simply repeat the variable reference in the string.

For instance:

```julia
x = 5
y = 10
msg = "The values are: \$x and \$y, and again: \$x and \$y."
println(msg)
```

The string interpolation approach in Julia is more straightforward and often easier to read than the numbered placeholders approach in some other languages.
"""

# ╔═╡ d9969cce-aa93-4df5-adea-3d836cd966ae
begin
	msg = "\$(val2) / \$(val1) = \$(val2/val1)"
	println(msg)
	msg = "(\$(val1) / \$(val2)) * (\$(val2) / \$(val1)) = 1"
	println(msg)
end

# ╔═╡ 21afb3dc-f147-4e29-8141-5b5419ce38c5
md"""
In Julia, just like in Python, you can name the variables you want to insert into a string for clarity, especially for longer strings with many values being inserted or when some variables occur multiple times. Named string interpolation can improve readability and make the code easier to maintain.
"""

# ╔═╡ 1125980c-5229-45f2-82ad-fbb71d3a6078
begin
	name = "Alice"
	emotion = "happy"
	msg13 = "hello $(name) are you $(emotion) today?"
	println(msg13)
end

# ╔═╡ eba394ef-402e-44bd-8350-3bdcf99bf48a
md"""
In Julia, similar to Python's formatting methods, you can use string formatting to pad strings and create neatly structured outputs, like tables. For this, you can use the `printf` method or string interpolation with specific format.

If you want to specify a minimum width for a string or number, you can pad it with spaces using the format `$(var):w` within a string interpolation, where `w` is the width you want.
"""

# ╔═╡ 10309124-7f5b-4dc2-adea-7809cb322451
begin
	names = ["Alice", "Bob", "John"]
	emotions = ["happy", "sad", "content"]
end

# ╔═╡ 239ada4c-5241-45d3-a4a9-21b79e3f092b
begin
	println(string(rpad("name", 10), "|", lpad("emotion", 10)))
	println("-"^10 * "|" * "-"^10)
	
	for i in 1:length(names)
	    println(string(rpad(names[i], 10), "|", lpad(emotions[i], 10)))
	end
end

# ╔═╡ d755d716-e24c-41fc-ba4d-1c0bf60e8972
md"""
### Formatting Numbers

In Julia, you can easily format floating-point numbers using the `@sprintf` macro or the `string` function. To achieve similar formatting as described in the Python notes, you can use the following format specifier: `%.wfs`, where:

- `w` is the minimum field width.
- `d` is the number of decimal places to show.
- `f` is used for fixed-point notation.
- `e` is used for scientific notation.
- `g` is used for general formatting, which automatically chooses between `e` and `f` based on the magnitude of the number.

You can adjust the format specifier to meet your specific formatting needs. The full range of formatting possibilities in Julia is described in the documentation, so you can achieve the desired output format effectively.
"""

# ╔═╡ Cell order:
# ╠═f6667d90-644f-11ee-0b04-1b4f86e1b95b
# ╠═c2e4cb33-c71c-44b9-b2d0-5ad4c0b819ee
# ╠═5465fb0b-4427-41e1-82a4-1eb1df9fd735
# ╠═adb211f4-f59a-46d3-8a66-4241d791976c
# ╠═78c586fb-f7ff-4b12-b1f6-122d12bb1990
# ╠═85d4673a-0423-4116-80c0-f22778dfb7c1
# ╠═b07f8eba-e7c5-462b-96a9-c24a6b842b82
# ╠═3a40a6ce-8bfd-4df9-8e25-17ec0de50e3a
# ╠═b977bad9-2913-4d65-b919-60925c8befea
# ╠═9c49b127-4354-46af-bfb0-80393f87c7c2
# ╠═0353ee6e-5b25-4712-8ef8-8baa50583e60
# ╠═6e538658-ff77-434a-a8ed-3f63cc50e370
# ╠═2e288060-9f6b-4b31-8eb2-93ef2fb76495
# ╠═b1a0e462-49cd-435c-8515-ab252441c9bb
# ╠═615c0b73-365e-4098-8e51-145efa68c129
# ╠═bb608287-6012-495c-856a-caa756e7b8ac
# ╠═c7a9c19b-2915-4015-b0bb-2a65e82d98fa
# ╠═d72d719e-4031-4460-98a2-c27af08da3f1
# ╠═84fe255e-e79d-4caa-9524-9902319163c5
# ╠═47fba8a3-51d4-410b-8f7f-31102f78a4b4
# ╠═38b9676c-af49-4dd6-97c2-b39e4ed0bb80
# ╠═64f7a10b-e8f6-458a-8b00-588dc5d919f5
# ╠═645c3505-f29b-4b2a-a14c-6b4f6048a154
# ╠═807de248-688b-4d6a-aefb-4cfc7bcb3010
# ╠═d3db8a62-6270-48a4-bf3e-2879cfc5522e
# ╠═e4da67c5-d42a-493d-8a1c-0e85d8b91aed
# ╠═41237e74-e86e-4f70-977b-7389a0b9a9cc
# ╠═a982a6b0-f2b4-4ab4-9c31-5b368d2e8418
# ╠═3b57c010-28eb-4e6f-87a5-28c835344389
# ╠═d6e41481-8fa6-455e-9d74-362c6dfbd743
# ╠═b8fafbaa-e8cb-445f-ba68-d6d8298739da
# ╠═cdb59b16-8a98-4bcf-b1c3-839f82280ac1
# ╠═6a6f6790-e954-4d79-bd8a-5f6abc15f325
# ╠═e5c72a85-ef69-4be9-b1d8-a56056989053
# ╠═d9969cce-aa93-4df5-adea-3d836cd966ae
# ╠═21afb3dc-f147-4e29-8141-5b5419ce38c5
# ╠═1125980c-5229-45f2-82ad-fbb71d3a6078
# ╠═eba394ef-402e-44bd-8350-3bdcf99bf48a
# ╠═10309124-7f5b-4dc2-adea-7809cb322451
# ╠═239ada4c-5241-45d3-a4a9-21b79e3f092b
# ╠═d755d716-e24c-41fc-ba4d-1c0bf60e8972
