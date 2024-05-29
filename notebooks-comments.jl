### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ f999fdb2-6464-11ee-3442-23ebb95b7a86
md"""
## Julia Notebooks

This book focuses on coding in Julia using Julia Notebooks. Julia Notebooks are highly practical and widely used when working with Julia to solve problems in various fields. The primary goal of this Julia Notebook is to help you get acquainted with Julia Notebooks and their various components. It will also introduce you to the concept of comments and emphasize the importance of providing descriptive explanations and comments in your code as needed.
"""

# ╔═╡ a5b3f19b-e22c-4ad4-861d-f45f029498b0
md"""
#### Julia Notebooks

Julia notebooks are composed of "cells," with two common types:

- Code: A cell containing code, primarily using Julia in our class, but Julia notebooks support other languages as well.
- Markdown: A cell with formatted text. Markdown is a markup language that allows you to write in plain text with simple notation for formatted display. This cell is a markdown cell.

You can run the currently selected cell using the play icon (right-pointing triangle). The behavior upon running a cell depends on its type. For code cells, it executes the code within the cell, while for markdown cells, running displays the formatted text.

Subsequent cells will demonstrate basic markdown features, but first, let's explore a few code cells.
"""

# ╔═╡ b0ba2560-5039-4e2a-b68c-319b8b791bad
md"""
### Code Cells

Running Code Cells

Select the cell below and execute it. You'll notice that the empty brackets on the left now display a number. For longer-running cells, these brackets initially show an asterisk (*) and change to a number once the cell completes execution.

Now, try running the second code cell. You'll observe that the number in brackets is one greater than the previously run cell, reflecting the order of execution. Re-running a cell updates the number in brackets to maintain the execution order.

Note: Notebooks do not run all cells by default. If you open a notebook and directly run a cell at the end that depends on previous cells, it will result in an error if those dependencies haven't been run yet.

There are a few options for running multiple cells without manually clicking and running each one. In the menu bar at the top, under "Cell" (for traditional Jupyter notebooks) or "Runtime" (for Google Colab), you'll find:

- "Run all": Executes all cells in the notebook in order, from top to bottom.
- "Run all above": Runs all cells above the currently selected cell. This can be useful when you want to start working in the middle of a longer notebook.
- "Run all below": Executes all cells below the currently selected cell. This is handy when you need to modify something in the middle and recompute results afterward with the change.
"""

# ╔═╡ 890444f7-1152-4c50-bf20-769aa88a9614
md"""
Stopping a Running Cell
At times, a cell may run for a much longer duration than expected, possibly due to code errors. In such situations, you have the option to halt the execution of cells by utilizing the stop button (depicted as a black square).
"""

# ╔═╡ b961f114-5b58-4c94-a3f2-3d3f09f19d5f
begin
	x = 5
	y = 8
end

# ╔═╡ 01a208f1-8bbf-48b1-9ce9-aaa9fcbb45e1
begin
	z = x+y
	print(z)
end

# ╔═╡ 37a94c23-e3e5-46c7-b520-37b6fa85572b
begin
	println(x)
	println(y)
end

# ╔═╡ 1f516f7c-268a-4bb7-9ae8-51f7736a52bb
begin
	w = x + y + z
	print(w)
end

# ╔═╡ 3e48e6fc-a4bc-46bc-8bae-007b92a02e7f
md"""
Clearing Cell Output
The output of a code cell will persist even if you close the Julia notebook. However, in some cases, you may want to remove it, for instance, if you'd like to follow along with lecture notebooks. You have two options for clearing output:

1. "Clear output" - This removes the output for the currently selected cell.
   - In a traditional Julia notebook, click "Cell" at the top.
   - In Google Colab, click the three dots at the far right of the cell.
   
2. "Clear all output" - This removes the output for all cells in the notebook.
   - In a traditional Julia notebook, click "Cell" at the top.
   - In Google Colab, click "Runtime" at the top.

Variable State
In Julia notebooks, the variable state can change more dynamically because you can rerun cells. Consider the following code cells. Running the first one multiple times will result in different outcomes.
"""

# ╔═╡ 80c4a69f-2a83-4ebd-8e0e-aaf68b505452
begin
	a = x+y
	a += 1
	print(a)
end

# ╔═╡ 94eb68a5-3dfd-41d5-a442-3be0167b857c
begin
	b = x+y
	b += 2
	print(b)
end

# ╔═╡ ec20b5fa-ff39-409a-9b9d-e936155074e2
md"""
In Julia notebooks, it's important to understand the concept of variable state, which persists throughout the notebook, regardless of whether it was changed below the current cell. Consider the following scenario:

1. Running the first cell, which increments the value of `z` by one.
2. Running the second cell, which sets `z` to 10.

Notice how the first cell, even though it comes before the second cell, adds 1 to the result of the second cell, altering the value of `z`. This is because the variable state carries over.

To start fresh or avoid unintended interactions between cells, we have two options:

1. Restarting the whole kernel - Note that this does not clear output, and you'll need to rerun cells before using a variable.
   - Google Colab: Under the "Runtime" heading, click "Restart runtime."
   - Traditional Julia notebooks: Under the "Kernel" heading at the top, click "Restart kernel" or press the refresh button (circle with arrows).

2. "Restart and run all" - This restarts the kernel and reruns all of the cells.
   - Google Colab: Under the "Runtime" heading.
   - Traditional Julia notebooks: Under the "Kernel" heading or using the button that resembles fast-forward.

These options allow you to manage the variable state and ensure that your code behaves as expected in Julia notebooks.
"""

# ╔═╡ 21c26509-2c6b-4ff5-b0cb-4beadfbfd700
md"""
### Markdown Cells
This is an example of a markdown cell in Julia notebooks. Markdown allows you to easily create formatted text with various elements such as headings to separate sections, **bold text**, *italic text*, lists, tables, images, block quotes, mathematical equations (LaTeX), and more. You can refer to the Julia notebook Markdown documentation and Markdown cheatsheet for examples of various Markdown elements.

Markdown cells are useful for several reasons, primarily for creating self-contained, report-like documents. In these cells, you can describe various aspects, including the problem statement, data, equations, relevant images, links to external resources or data sources, and more. Julia notebooks leverage Markdown cells, making them an essential tool for applied computing and data analysis.
"""

# ╔═╡ 0b9b44c2-3d03-4a00-be79-58aea38a92b2
md"""
Math Example
This is a simple LaTeX equation: 

\[E=mc^2\]

Lists Example - This line serves as a heading
You can create lists with multiple levels of nesting, combining ordered and unordered lists:

1. List item
   - Sublist item 1
   - Sublist item 2
2. List item
   - Nested bullet
   - Nested bullet
3. List item
"""

# ╔═╡ 76061bed-6157-44f2-86ac-1baa362344ed
md"""
### Commenting Code
Code is often written in Julia to automate repetitive tasks or to handle complex processes that are difficult to perform manually. To ensure that our Julia code is effective and maintainable, it's crucial to make it:

1. Understandable: Code should be easy to comprehend, both for ourselves and for others who may work with it.
2. Maintainable: Code should be well-structured and free from unnecessary or redundant components.

While using descriptive variable names is one way to improve code readability, another essential technique is adding comments. Comments are written explanations within the code that help clarify its purpose and functionality. Although simple code examples may not require extensive comments, they become invaluable in larger projects, ensuring that anyone revisiting the code, even after an extended period, can understand and modify it effectively.

In Julia, single-line comments are preceded by the # symbol, and Julia ignores these lines when executing the code. Typically, comments are placed just above the line (or lines) of code they pertain to. For comments that explain a single line, you can include the comment at the end of that line, following the code.

Here's an example of code comments in Julia:

```julia
# This is a single-line comment
x = 5  # This comment explains the purpose of the following code
```

By incorporating meaningful comments into your Julia code, you can enhance its clarity and maintainability, making it easier for both you and others to work with in the future.
"""

# ╔═╡ 3c98fac2-617d-4ec9-b3ec-3217cbfac920
begin
	# Computes the volume of a sphere
	diam = 6
	vol = (4/3) * π * (diam/2)^3  # π is an approximation of pi
	
end

# ╔═╡ d06a69ef-46d1-4a6d-b259-c25b040c735c
md"""
This is an example of a multiline comment in Julia.
Multiline comments are enclosed in triple quotes.
They are typically used for more extensive explanations,
especially in scripts.
"""


# ╔═╡ c763a4ef-ffe7-4e64-8840-143218476364
md"""
This is a multiline comment
Below is a random line of code.
"""

# ╔═╡ Cell order:
# ╠═f999fdb2-6464-11ee-3442-23ebb95b7a86
# ╠═a5b3f19b-e22c-4ad4-861d-f45f029498b0
# ╠═b0ba2560-5039-4e2a-b68c-319b8b791bad
# ╠═890444f7-1152-4c50-bf20-769aa88a9614
# ╠═b961f114-5b58-4c94-a3f2-3d3f09f19d5f
# ╠═01a208f1-8bbf-48b1-9ce9-aaa9fcbb45e1
# ╠═37a94c23-e3e5-46c7-b520-37b6fa85572b
# ╠═1f516f7c-268a-4bb7-9ae8-51f7736a52bb
# ╠═3e48e6fc-a4bc-46bc-8bae-007b92a02e7f
# ╠═80c4a69f-2a83-4ebd-8e0e-aaf68b505452
# ╠═94eb68a5-3dfd-41d5-a442-3be0167b857c
# ╠═ec20b5fa-ff39-409a-9b9d-e936155074e2
# ╠═21c26509-2c6b-4ff5-b0cb-4beadfbfd700
# ╠═0b9b44c2-3d03-4a00-be79-58aea38a92b2
# ╠═76061bed-6157-44f2-86ac-1baa362344ed
# ╠═3c98fac2-617d-4ec9-b3ec-3217cbfac920
# ╠═d06a69ef-46d1-4a6d-b259-c25b040c735c
# ╠═c763a4ef-ffe7-4e64-8840-143218476364
