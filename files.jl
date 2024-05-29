### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 7734f5c8-f5f5-4790-b97e-2ca2a3ff68b4
begin
		using Pkg
		Pkg.add("CSV")
end

# ╔═╡ b704154a-d6a0-43e3-89fb-ee0c8b0bcbfb
using CSV

# ╔═╡ ec747691-8c9c-4338-b80f-03084839696c
md"""
### Files

The data we've engaged with up to this point was directly embedded in the code. For small-scale data sets, this can be suitable. Nevertheless, coding typically involves processing larger volumes of data. Often, this data originates from diverse sources, such as experimental results, surveys, web data, and so forth. Manually entering this data into the code, especially if it has already been recorded elsewhere, can be inefficient.

To process data already stored in a file, we employ file I/O (input/output) techniques. In Julia, interacting with files generally follows these steps:

1. **Open the file** - This provides a handle, allowing interaction with the file.
2. **Read/Write** - At this stage, we either fetch the file's data or append data to it (sometimes both).
3. **Close the file** - Signifies that we've finished making changes and all modifications should be saved.
"""


# ╔═╡ 4d787425-b0b5-4388-b2ac-82efd703b822
md"""
### Opening Files

The initial step in file manipulation is opening the file, executed with the `open(filename, mode)` function:

- `filename`: This is a string denoting the file's name. It can also represent a file's path, which may encompass the directories containing the file.
  
- `mode`: A string specifying the interaction type with the file. The principal modes are:
  - `r`: read
  - `w`: write (overwrites existing files)
  - `a`: append (adds to an existing file's end)
  - `r+`: read and write

There are additional modes tailored for non-textual files, like an MP3 song. For such cases, modes have a trailing `b`, such as `rb`, `wb`, and so on. However, our emphasis remains on reading and writing text-centric files, which is a typical operation in base Julia. For specialized tasks like reading audio or image files, one might lean on specific Julia packages.

On successfully opening a file, we're presented with a file handle—a bridge to the file enabling its accessibility. This handle is not the file itself but rather a means to interact with it. There can be instances where opening a file fails, leading the code to produce an error. For example, attempting to read a non-existent file results in a `FileNotFoundError` in Python. In Julia, a similar error would arise.
"""


# ╔═╡ 651d8ffb-e8b4-4c5c-92b1-f124c0a66f35
md"""
	For example:
	
	In Julia, to open a file for reading, you'd do:
"""


# ╔═╡ ccc30dac-2534-466d-bce0-cf9069687bd9
# ╠═╡ disabled = true
#=╠═╡
fr = open("data/blahblahreading", "r")
  ╠═╡ =#

# ╔═╡ 2fcce3a7-1469-49fe-8dd7-afab5c380c9d
md"""
Note that there's no problem with opening a non-existent file for writing in Julia. If the file doesn't exist, it will simply be created.

For instance, in Julia:
"""

# ╔═╡ 72b523ab-8913-47e1-bad8-b20ea0169454
fw = open("data/blahblahwriting.txt", "w")

# ╔═╡ 5aa9419f-1f2f-4bfa-b893-574acb20f8eb
md"""
It's worth noting that even when opening a file for writing, errors can occur if you're on a system where you lack the necessary permissions to modify the file. This is especially true for read-only files or protected directories. Such issues might be challenging to replicate on cloud platforms like CoCalc or other cloud-based environments due to their unique file access configurations.

Let's take, for example, the file named "robert-frost.txt" located within the "data" directory. This file houses the renowned poem "Stopping by Woods on a Snowy Evening" by Robert Frost. To access files nested within directories, provide the relative path, which comprises the directory name, a "/" delimiter, and then the filename. In this case, it would be "data/robert-frost.txt". Once you obtain a file handle in Julia, it functions similarly to other variables, and you can execute operations on it, like printing.
"""


# ╔═╡ cd382a92-c0c7-441c-b546-19362f852472
md"""
While opening files for writing is typically straightforward, there can still be situations where errors arise. For instance, on systems where you don't possess the necessary permissions to modify a particular file. Reproducing such scenarios on platforms like CoCalc or other cloud-based servers can be a tad tricky due to the unique file access structures they employ.

Consider the file "robert-frost.txt" in the "data" directory, storing the poem "Stopping by Woods on a Snowy Evening" by Robert Frost. However, if this file hasn't been transferred to the cloud servers we're currently utilizing, we'd first need to fetch it. A handy way to do this, especially in environments supporting terminal commands, is by employing the `download` command to download files from a provided URL.

In certain notebook environments, terminal commands can be executed by prefixing them with an `!`. For instance, to download a file from a specified URL:

"""


# ╔═╡ 24639a61-252d-44c9-b4fe-96f69fab77fa
begin
	md"""
	To download the file "robert-frost.txt" from the provided URL into our working directory in a Julia environment, we can use the following shell command:
	
	"""
	download("https://raw.githubusercontent.com/eecarrier/python-for-applied-computing/main/notebooks/data/robert-frost.txt", "robert-frost.txt")	
end

# ╔═╡ 48a2caf3-b0a0-4ee1-9b4b-927373a6f91d
begin
	ffrost1 = open("robert-frost.txt")
    println(repr(ffrost1))  # using repr to get the string representation
    close(ffrost1)

end

# ╔═╡ 29146ab3-0c04-4e44-aca3-1834f938dc48
md"""
Note that when we print it, we get a printed version of the file handle, we don't actually get the file contents. This is an important distinction -- a file handle isn't actually the contents of the file, we need to read from the file in order to get the contents.
"""


# ╔═╡ 17449fcc-864c-4247-9403-c958ce23400e
md"""
### Reading/Writing Files

Once a file has been opened, providing us with a file handle, we can then either read from or write to the file. The specific action we can undertake (reading or writing) depends on the mode in which we initially opened the file.
"""


# ╔═╡ f0f955eb-2c04-4189-93da-8e45e87c560c
md"""
### Reading Files

To read content from files in Julia, we employ the file handle associated with our target file and invoke one of the reading functions. The primary reading functions include:

- `read()`: Returns the entire content of the input file as a single string.
- `readlines()`: Provides an array where each element is a string representing a line from the file.
- `readline()`: Yields the subsequent line from the file as a string.

While the first two methods conveniently store the complete file content in a variable, they might not be suitable for exceptionally large files due to memory constraints.

Let's delve into some examples focusing on the "robert-frost.txt" file, which enshrines one of Robert Frost's iconic poems. It's vital to recognize that after navigating to the file's end once, any further read calls—even utilizing a distinct reading function—will yield an empty string or array. Hence, to underline the distinctions between the methods, we'll reopen the file before each demonstration.
"""

# ╔═╡ ac10c22b-5d4f-4f4b-808b-3a5313513163
md"""
In the aforementioned example, each string in the array terminates with `\n`, representing the newline character. When a file is read, newline characters are also fetched. If one intends to process the strings post-reading, it's often beneficial to eliminate the newline. This can be achieved using slicing, but more typically, one would use the `strip()` function in Julia.

For instance:
"""

# ╔═╡ 280cc721-4c54-42cf-b068-55c0f1c1cb3e
begin
	ffrost = open("robert-frost.txt", "r")
			fulltext = read(ffrost, String)
			println(length(fulltext))	
		    println(fulltext)
		    close(ffrost)  # Don't forget to close the file when you're done.
		
	        println("")
		
	        ffrost = open("robert-frost.txt", "r")  # Reopen the file for reading
	        lines = readlines(ffrost)
	        println(lines)
	        close(ffrost)  # Close the file again
	
		    println("")
		
		    ffrost = open("robert-frost.txt", "r")
		    # Julia uses 1-based indexing, so lines[0] in Python corresponds to lines[1]      in Julia.
		    println(length(lines[1]))  
	        println(length(strip(lines[1])))
		    close(ffrost)  # Close the file again
	
		    println("")
end

# ╔═╡ bdb9aa41-7c8b-4171-b81b-da422fc807cb
md"""
### Reading and Looping

For large files, processing the file line-by-line is often more efficient. In Julia, we can use the `readline()` function to achieve this. However, as this function reads only one line of the file at a time, it's customary to use a loop to process the entire file. 

A more intuitive approach is to directly loop over the file handle, analogous to how we loop through an array:

for line in open("filename.txt")
    # do something with line
end
For instance, suppose we just wanted to count the lines in the file:
"""




# ╔═╡ ce3b22e2-c0ca-4d40-ab28-56da7308c063
begin
	ffrost2 = open("robert-frost.txt")
	count = 0
	for line in eachline(ffrost2)
	    count += 1
	end
	println(count)
	
end

# ╔═╡ 3e3f0d6a-32dc-4e46-8e36-8f58eefe5f32
md"""
With any of the file reading methods in Julia, once the content is read, it is typically represented as a string (or an array of strings). After reading, this data can be processed just like any other string in Julia. You can split the string into words, convert it to other data types, perform computations, and so forth.
"""


# ╔═╡ 1ef1d874-a0c9-4e20-9c19-e0be6f453379
md"""
### Writing Files

In Julia, you can write to a file using the `write(file_handle, textstr)` function. Here, `textstr` is the string you want to write, and `file_handle` is the handle of the file opened in write mode.

For instance, using the previously mentioned `fw` file handle:
"""

# ╔═╡ 31573539-57e1-4d5e-b856-2af3a8266370
begin
	write(fw, "hello world\n")
	write(fw, "hello world line 2")
end

# ╔═╡ 75001014-1039-4266-b084-8a99491b1cf5
md"""
### Closing Files

After finishing operations on a file (reading or writing), it's essential to close the file in Julia. Closing the file indicates to the system that we won't access or modify it further. It also ensures that any modifications made to the file are properly saved and reflected.

In Julia, we close files using the `close()` function on the respective file handle. If multiple files need closing, we invoke `close()` on each file handle separately.

For example, if we want to close the `fw` and `ffrost` file handles:
"""

# ╔═╡ c128950d-5166-4f1c-88a4-f9ee9d0bdfda
begin
	close(fw)
	close(ffrost)
end

# ╔═╡ e176a8ff-37c5-46bd-9c1e-95888c0abd3d
md"""
### Alternative to Explicitly Opening and Closing Files

A common challenge when working with files is the necessity to remember to close them after operations. However, in many scenarios, the actual portion of code requiring the file to be open is relatively concise. In such situations, Julia provides a convenient way to handle file operations that automatically takes care of closing the file: the `do` block.

Using the `do` block with file operations ensures that the file is open for the duration of the enclosed code and is automatically closed once that code completes execution. This approach is particularly advantageous because it ensures files are closed even if an error arises within the block.
"""

# ╔═╡ 07e33003-381b-494e-8212-cd2b83d97a12
md"""
### Example - Groundhog's Day Data

The file "groundhog.csv" contains historical observations of Punxsutawney Phil on Groundhog's Day. Since we are on remote servers, we first need to fetch this file.

To download the file in Julia, we'll use the `download` function:
"""

# ╔═╡ d9a67fb7-d5f0-4504-8075-61d00c8d62f3
download("https://raw.githubusercontent.com/eecarrier/python-for-applied-computing/main/notebooks/data/groundhog.csv", "groundhog.csv")

# ╔═╡ b1bfe517-f9af-427b-83f4-a4e6172bc57d
begin
	# Using the do block to automatically close the file after processing
	open("groundhog.csv", "r") do f
	    for line in eachline(f)
	        entries = split(strip(line), ',')
	        if length(entries) > 2
	            if entries[2] == "Partial Shadow" # Note: Julia is 1-based indexing
	                count += 1
	            end
	        end
	    end
	end
	
	println(count)
	
end

# ╔═╡ 8262dd83-1eb1-48e4-bd46-e5325b8b52ae
md"""
### Reading CSV Files

In the examples provided earlier, we observed various methods to read in files:

1. Fetching all the lines as an array of strings using `readlines()`.
2. Reading the entire content of the file into a single string using `read()`.
3. Iterating through the file handle, which essentially loops through the lines of the file, treating each line as a distinct string.

For structured files, like CSVs where each line consists of multiple columns, one common approach is to utilize string functions to partition each line and retrieve the relevant column data. However, in Julia, there's also a dedicated package named `CSV.jl` which offers a more streamlined way to process CSV files without manually parsing each line.
"""


# ╔═╡ bf962b54-1c07-4444-ac18-051f006ad1b6
md"""
### Challenges with Comma-Separated Values

Taking, for instance, a file named `books-small.csv` with contents like:

"""

# ╔═╡ 350447e6-7ba9-4ac7-8ebf-5cd896bf39fe
md"""
To fetch the `books.csv` file from the given URL, we use Julia's `download` function:
"""

# ╔═╡ 6a4c7261-fe50-42e4-84db-0ed8d181c7a4
download("https://raw.githubusercontent.com/eecarrier/python-for-applied-computing/main/notebooks/data/books.csv", "books.csv")

# ╔═╡ ff0a4305-7c05-4205-ae16-2517b9156f4c
md"""
Then, we open the file and create our csv reader. We could either open the file or use the with notation. In this example, we'll just print out the book titles, but you could do any additional processing desired for each line.
"""

# ╔═╡ 394ca1e0-7851-406d-a8e2-46fed389766e
begin
data = CSV.File("books.csv")

# Skip the header and iterate through rows
for row in data
    println(row[2])  # Assuming book titles are in the second column
end
end

# ╔═╡ fa50bb9e-b8b4-4b7d-8185-2b15c93ab621


# ╔═╡ Cell order:
# ╠═ec747691-8c9c-4338-b80f-03084839696c
# ╠═4d787425-b0b5-4388-b2ac-82efd703b822
# ╠═651d8ffb-e8b4-4c5c-92b1-f124c0a66f35
# ╠═ccc30dac-2534-466d-bce0-cf9069687bd9
# ╠═2fcce3a7-1469-49fe-8dd7-afab5c380c9d
# ╠═72b523ab-8913-47e1-bad8-b20ea0169454
# ╠═5aa9419f-1f2f-4bfa-b893-574acb20f8eb
# ╠═cd382a92-c0c7-441c-b546-19362f852472
# ╠═24639a61-252d-44c9-b4fe-96f69fab77fa
# ╠═48a2caf3-b0a0-4ee1-9b4b-927373a6f91d
# ╠═29146ab3-0c04-4e44-aca3-1834f938dc48
# ╠═17449fcc-864c-4247-9403-c958ce23400e
# ╠═f0f955eb-2c04-4189-93da-8e45e87c560c
# ╠═ac10c22b-5d4f-4f4b-808b-3a5313513163
# ╠═280cc721-4c54-42cf-b068-55c0f1c1cb3e
# ╠═bdb9aa41-7c8b-4171-b81b-da422fc807cb
# ╠═ce3b22e2-c0ca-4d40-ab28-56da7308c063
# ╠═3e3f0d6a-32dc-4e46-8e36-8f58eefe5f32
# ╠═1ef1d874-a0c9-4e20-9c19-e0be6f453379
# ╠═31573539-57e1-4d5e-b856-2af3a8266370
# ╠═75001014-1039-4266-b084-8a99491b1cf5
# ╠═c128950d-5166-4f1c-88a4-f9ee9d0bdfda
# ╠═e176a8ff-37c5-46bd-9c1e-95888c0abd3d
# ╠═07e33003-381b-494e-8212-cd2b83d97a12
# ╠═d9a67fb7-d5f0-4504-8075-61d00c8d62f3
# ╠═b1bfe517-f9af-427b-83f4-a4e6172bc57d
# ╠═8262dd83-1eb1-48e4-bd46-e5325b8b52ae
# ╠═bf962b54-1c07-4444-ac18-051f006ad1b6
# ╠═350447e6-7ba9-4ac7-8ebf-5cd896bf39fe
# ╠═6a4c7261-fe50-42e4-84db-0ed8d181c7a4
# ╠═7734f5c8-f5f5-4790-b97e-2ca2a3ff68b4
# ╠═b704154a-d6a0-43e3-89fb-ee0c8b0bcbfb
# ╠═ff0a4305-7c05-4205-ae16-2517b9156f4c
# ╠═394ca1e0-7851-406d-a8e2-46fed389766e
# ╠═fa50bb9e-b8b4-4b7d-8185-2b15c93ab621
