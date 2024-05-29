### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 134bc80f-e968-4bde-92f3-8e2efb9e793e
begin
	using Pkg
	Pkg.add("Plots")
	Pkg.add("StatsPlots")
	Pkg.add("GR")
	
end


# ╔═╡ b5d4e4ea-5c01-4d1f-913d-84ca0949e906
Pkg.add("StatsPlots")

# ╔═╡ da15b9da-f2d1-46f7-a496-39e678fec2d0
Pkg.add("FileIO")

# ╔═╡ 50e3f0eb-8530-4089-8515-c4bdd9923320
begin
	using Plots  
    plotlyjs()
	
	detroit_populations = [465766, 993678, 1568662, 1623452, 1849568, 1670144, 1511482, 1203339, 1027974, 951270, 713777]
	plot(detroit_populations, label="Detroit Populations")
end

# ╔═╡ 0ec09fa0-8f81-49bc-9a8e-fa88aa0d723c
begin
	using FileIO
	
	# Load the image
	img = load("./media/dog.png")
	
	# Display the image
    plot(img, axis=false)
end

# ╔═╡ 87eb6ad0-6dfd-11ee-3c8c-25e7573113ac
md"""

#### **Plotting**

Up to now, the output produced from our code was textual. But in many fields like data science, mathematics, and numerous computing applications, visualization is often more insightful than raw numbers. In Julia, we make use of native libraries or packages for visualization.

###### **Packages**

Our focus has been on the core of Julia — leveraging the inherent capabilities of the language. However, Julia's ecosystem is enriched by a plethora of packages that:

1. Introduce specialized functionality beyond what's provided in base Julia.
2. Simplify tasks that are feasible with base Julia but might be cumbersome.

We've encountered some basic packages in Julia. A key strength of Julia for scientific computing is its extensive collection of available packages. As of now, there's a vast range available on Julia's package manager, and on many platforms like JuliaBox, the popular ones are pre-installed. To utilize them, you typically use `using PackageName`. If a package has a lengthy name, a common practice is to use its abbreviated form, akin to Python's `import ... as ...`. In Julia, you'd see `using PackageName as AliasName`.

#### Plots.jl Library

In Julia, one of the widely-used libraries for visualization is Plots.jl. It is versatile, catering to a broad spectrum of visualizations, including:

line and scatter plots
bar charts and histograms
box plots
contour plots
vector fields
images
heat maps
simple plot animations
simple 3D plots
Every plot can be enriched with labels, legends, colors, annotations, and other stylistic embellishments to yield professional-grade visual outputs.

(Note: Plots.jl is one of the popular and flexible plotting libraries in Julia. This translation introduces Plots.jl in place of Matplotlib to fit the Julia context.)

#### Help with Plots.jl

This section will demonstrate an assortment of visualizations achievable with Plots.jl. However, there's a vast array of possibilities that cannot be exhausted here. Plots.jl boasts of comprehensive documentation. Furthermore, there's an expansive gallery of examples that showcase various plots and the accompanying Julia code. A pragmatic approach often involves spotting a desired plot example from the gallery, inspecting the code responsible for it, and then adapting said code to your individual requirements.

"""

# ╔═╡ f7675e34-0323-4fc9-b1ce-552b5606be31
md"""


**Importing**

To begin with Plots.jl, we first need to bring it into our workspace. In Julia, you typically import a library using the `using` keyword. For Plots.jl, the process is straightforward:

```julia
using Plots
```

With Julia and the Plots.jl library, you don't typically need to use aliases or shortnames as you would in Python. However, if you really wanted to avoid potential naming conflicts or preferred a shortened reference, you could utilize the `import` keyword:

```julia
import Plots as plt
```

This, however, means you'd need to prefix all functions from Plots.jl with `plt.` (e.g., `plt.plot()`). But this isn't common practice in the Julia community.

For Jupyter notebooks or Pluto.jl notebooks, the visualization automatically integrates into the notebook interface, so there's no need for a "magic command" equivalent in Julia.


"""

# ╔═╡ faca6f5a-a465-4572-b6bf-568337999970
begin
	begin
		gr()
	end
end

# ╔═╡ 4ae1a970-9ec2-4917-b0b6-331d39582d6c
md"""
##### Plotting Overview in Julia using Plots.jl

With Plots.jl, there's a unified approach to creating and modifying plots:

1. Functional Interface: Directly calling functions like plot() or scatter() creates and modifies plots. For example:

- plot(x, y) creates a new line plot.
- scatter!(x, y) adds scatter points to an existing plot (the ! in Julia typically indicates an in-place modification).
2. Plot Attributes: You can customize your plots by adding attributes to these functions. For instance, label, color, and linewidth are some of the attributes you can modify.

3. Multiple Plots: If you want to combine multiple plots, plot() can be used with arrays of data, and different series types can be combined in one figure.
"""


# ╔═╡ 2cd13a45-5ec4-40ad-a1d2-fc789f9a484c
md"""
**Standard Line/Scatter Plot in Julia using Plots.jl**

The most basic way to create a plot is to use the `plot` function. This function can be called in multiple ways due to its flexible design. Some of the most common usages include:

1. `plot(yvals)` - takes a list or array of y-values. By default, the x-values are assumed to be integers ranging from 1 to length(yvals).
  
2. `plot(xvals, yvals)` - plots a line of points given by y versus x for a list/array of x-values and y-values.
   
3. `plot(xvals, yvals, linetype)` - same as the previous usage but allows you to customize the line style. For example, you can specify colors, marker types, line styles, etc.

Additionally, `scatter()` can be used to create scatter plots, and various attributes can be provided to customize the appearance.

"""

# ╔═╡ 6636254f-78f1-42a2-bc31-35f3cb480606
""" Since we know the years start at 1910 and go up to 2010 by 10 each time, we can easily make the list of years with range. """

# ╔═╡ c078b154-ddc1-4a3c-92f9-2de2af40a62a
begin
	    plotlyjs()
	
		detroit_years = 1910:10:2010
		plot(detroit_years, detroit_populations)
end

# ╔═╡ bcda1a51-a892-450c-af0c-0538390668e7
md"""
**Changing Line Style and Color**

The default appearance of the plot might appear a tad simplistic due to its default style that connects data points with a line. However, by utilizing certain keyword arguments, you can significantly enhance the visualization by adjusting the color, line style, line width, etc. Here are some commonly used arguments to tailor the style:

**color**: Adjusts the line's color. Its abbreviation is `linecolor`.
- `:red` = red
- `:blue` = blue
- `:magenta` = magenta
- `:cyan` = cyan
- `:green` = green
- `:black` = black
- `:yellow` = yellow

**marker**: This determines the style of data point markers.
- `:x` = letter x
- `:+` = plus sign
- `:circle` = standard dot
- `:dot` = smaller dot
- `:square` = square
- `:none` = no marker

**linestyle**: Dictates how the line connecting points is presented.
- `:solid` = solid line
- `:dot` = dotted line
- `:dash` = dashed line
- `:dashdot` = alternating dash-dot sequence
- `:none` = no line connecting the data points

**linewidth**: Modifies the width of the line. The default value is typically set at 1.5, with larger numbers resulting in thicker lines.

**markersize**: Adjusts the size of the marker. The standard default size is 6, with larger values yielding bigger markers.


"""

# ╔═╡ 0041bdce-ccca-422c-a5b9-60107415197f
plot(detroit_years, detroit_populations, linecolor=:cyan, marker=:circle, linestyle=:dash, linewidth=2.5, markersize=8)

# ╔═╡ 23492f2b-574d-4b06-b517-4966e39d89bf
md"""
Since these styling options are common in Plots.jl, there are a few things to keep in mind:

1. **Abbreviated Keywords**: 
    - While `Plots.jl` does provide many options for styling, not all the abbreviations from `matplotlib` have direct equivalents. For the most part, you'll use the full keywords in Julia.

2. **Format Strings**:
    - In `matplotlib`, you can use a shorthand format string that specifies the color, marker, and linestyle in one argument. This is not a direct feature of `Plots.jl`, but you can specify them using separate keyword arguments.
"""


# ╔═╡ 4d9da9cf-21ae-482d-ad9f-8409ebe9514a
md"""

**Adding Titles and Labels in Julia/Plots.jl**

Previous visualizations might lack annotations, which can reduce their utility and professionalism. It's essential to provide proper context by adding labels and a title. For any plot created using Plots.jl in Julia, you can add these elements with the following functions:

- `xlabel!("Desired x-axis label")`: This sets the label for the x-axis.
- `ylabel!("Desired y-axis label")`: This sets the label for the y-axis.
- `title!("Desired title")`: This sets the title of the plot.

Let's enhance our prior visualization with these additions:

"""

# ╔═╡ 6e17f4e8-2b6b-411d-bc30-742a1275d3ba
begin
	plot(detroit_years, detroit_populations, seriestype=:scatter, line=(:cyan, 2.5, :dash), marker=(:circle, 8), label="")
	xlabel!("census year")
	ylabel!("population")
	title!("Detroit Census Population")
end

# ╔═╡ b2a0bb84-08f8-456b-95e2-4bac115c0180
md"""

##### **Multiple Lines**

To add more than one line to a plot in Julia, you can simply make multiple calls to `plot!()` with the different data (and potentially different styles) you wish to plot. However, whenever you plot multiple lines on a single plot, you should include a legend to distinguish the different lines. To specify the name that should be used in the legend for each line, you can use the `label` argument in your `plot!()` or `plot()` call. By default, Plots.jl will automatically display a legend when different `label` values are provided.
"""

# ╔═╡ ea71563e-ad61-41e4-965a-b2c48c8025a0
begin
	#detroit_populations = [465766, 993678, 1568662, 1623452, 1849568, 1670144, 1511482, 1203339, 1027974, 951270, 713777]
	#detroit_years = 1910:10:2010
	
	chicago_populations = [2185283, 2701705, 3376438, 3396808, 3620962, 3550404, 3366957, 3005072, 2783911, 2896016, 2695598]
	chicago_years = 1910:10:2010
	
	plot(detroit_years, detroit_populations, marker=:circle, color=:cyan, line=(:dash, 2.5), markersize=8, label="Detroit")
	plot!(chicago_years, chicago_populations, marker=:square, color=:magenta, line=(:solid, 1.5), markersize=6, label="Chicago",  legend=:topright)
	
	xlabel!("census year")
	ylabel!("population")
	title!("Detroit vs Chicago Census Population")
end

# ╔═╡ 8fa1df0f-1d89-40ec-b83b-0bfaa1ba3367
md"""

Sometimes the automatic positioning of the legend might not be suitable, as it might obscure crucial parts of the graph. You can adjust the location of the legend by using the `legend` parameter in the `plot` or `plot!` functions. The options available range from positions like `:topright`, `:bottomleft`, and so on. One particularly helpful choice is `:best`, which tries to determine the most optimal out of the nine possible positions for the legend.
"""

# ╔═╡ dcbd3d93-5e35-4d20-b969-08e715dbdf6d
begin
	plot(detroit_years, detroit_populations, line=(:dash, 2.5, :cyan), marker=(:circle, 8.0, :cyan), label="Detroit")
	plot!(chicago_years, chicago_populations, line=(:solid, 2.5, :magenta), marker=(:circle, 8.0, :magenta), label="Chicago")
	xlabel!("census year")
	ylabel!("population")
	title!("Detroit and Chicago Census Population")
end

# ╔═╡ 0b201fc9-4dc8-436a-91a6-8a4a478545b5
md"""

**Other Axis Scales**

All of our previous plots have used linear axis scales. However, in some scenarios, using a logarithmic scale for one or both of the axes might be more appropriate, based on the nature of the data and the insights we aim to derive.

For example, data that shows exponential growth characteristics might not be clearly represented on a plot with linear axes. Such data is typically better visualized on a semilog scale, where the x-axis remains linear and the y-axis becomes logarithmic.

In contrast, if your data adheres to a power law distribution, it will manifest as a straight line on a plot where both axes are logarithmic.

To achieve different axis scales in matplotlib, you can use these functions in place of `plt.plot`:

- `plt.semilogx(xvals, yvals)` creates a plot with a logarithmic x-axis and a linear y-axis.
- `plt.semilogy(xvals, yvals)` creates a plot with a linear x-axis and a logarithmic y-axis.
- `plt.loglog(xvals, yvals)` creates a plot where both the x and y axes are logarithmic.
"""

# ╔═╡ 1e8531d5-3dd0-4f0f-a7a1-4972b642f60e
begin
	 plotlyjs()
	
	ys = [2^i for i in 1:13]
	xs = [i for i in 1:13]
	plot(xs, ys, yscale=:log10, seriestype=:scatter, marker=:circle, color=:blue, line=:solid, legend=false)
	
end

# ╔═╡ db1c5f75-ed41-440c-87af-981a9d77dd36
md"""

##### Bar Charts:
Matplotlib offers functionalities to produce bar charts. Depending on your preference for orientation, you can utilize one of the following functions:

- `plt.bar(names, values)`: This generates a vertical bar chart.
- `plt.barh(names, values)`: This results in a horizontal bar chart.
"""

# ╔═╡ 8dd960bc-19aa-4d45-aee0-cbb468e94369
begin
	plotlyjs() 
	
	sec8housing = [5528, 1141, 1386, 963, 981, 2271, 1427]
	cities = ["Detroit", "Saginaw", "Plymouth", "Flint", "Wyoming", "Grand Rapids", "Lansing"]
	
	bar(cities, sec8housing, legend=false)
end

# ╔═╡ 1870b3b9-2b4f-4a9b-8867-ed63e3f35e9c
begin
	bar(cities, sec8housing, color=:cyan, alpha=0.3, width=0.5, linecolor=:black, linewidth=1.3)
	title!("Section 8 Housing in MI Cities")
	xlabel!("City")
	ylabel!("Quantity")
end

# ╔═╡ 61bbd527-60c2-41b3-b12d-bcf1e2129656
md"""
As with plot, there are other optional arguments that can be used to modify the plot in Julia, such as changing colors, bar width, opacity, axis scale, edge color, etc.
The full list of available options for the bar function in Plots.jl can be found in the documentation for the bar function.

As with plot, we can also add titles and labels with the same functions we used in Julia, such as title!, xlabel!, and ylabel!.

Note: In Julia's Plots.jl, functions with an exclamation mark (!) at the end modify the current plot, while those without the exclamation mark create a new plot. This is why functions like title!, xlabel!, and ylabel! have the exclamation mark—they modify the existing plot.
"""

# ╔═╡ 54e708bb-6c45-4cbc-8512-af9f3480a22b
md"""
#### Stacked Bar Charts

If you wish to display multiple pieces of quantitative data that make sense to present both individually and in total, it can be useful to employ a stacked bar chart. In Plots.jl for Julia, we can create a stacked bar chart by utilizing the bar function and passing a matrix where each column corresponds to a dataset. The rows determine the different categories, and the matrix elements define the bar heights.

Note: In Plots.jl, creating stacked bar charts is a bit more straightforward than in matplotlib. You don't have to call the bar function multiple times. Instead, by simply passing a matrix to the bar function, you get a stacked bar chart.
"""

# ╔═╡ 7dc9fe62-ed02-4f78-bb79-e17ff9f3a8de
begin
	lowrent = [4391, 605, 108, 1248, 197, 447, 834]  # Low rent housing values
	
	bar(cities, [sec8housing lowrent], color=[:red :cyan], alpha=[0.6 0.5], label=["section 8" "low rent"])
	title!("Low Rent and Section 8 Housing in MI Cities")
	xlabel!("City")
	ylabel!("Quantity")
end

# ╔═╡ 4cfc619d-23bc-4d33-8286-a1f385775a7a
md"""

There are numerous functions available in Julia's `Plots.jl` that allow for fine-tuning the appearance of a plot, more than we can delve into within this brief overview. For instance, in the aforementioned plot, if the city names overlap, we can rectify this by rotating the tick labels. In `Plots.jl`, this can be achieved using the `xticks` attribute. This is a versatile attribute applicable to various plot types in Julia, including line/scatter plots, bar charts, etc., and facilitates customization of tick labels and their rotation.


For the above plot, it would be very helpful if the tick labels (cities) were rotated so they did not overlap.
"""

# ╔═╡ 0eae3889-1114-41ab-af98-dcd2a302b43d
begin
	bar(cities, [sec8housing lowrent], color=[:red :cyan], alpha=[0.6 0.5], label=["section 8" "low rent"], xrotation=45)
	title!("Low Rent and Section 8 Housing in MI Cities")
	xlabel!("City")
	ylabel!("Quantity")
end

# ╔═╡ e0c02484-69ba-4860-971b-7b5a8716e714
md"""

**Histograms in Julia with Plots.jl**
Histograms bear a resemblance to bar charts, but the primary distinction lies in the representation of the number of values within specific bins. In `Plots.jl`, histograms can be easily computed and visualized using:

```julia
histogram(values)
```

or

```julia
histogram(values, bins=bins_value)
```

The latter invocation is similar to the former, with the added capability to dictate binning by:

- Specifying the number of bins when `bins_value` is an integer.
- Designating the bin edges when `bins_value` is an array.
- Defining the binning strategy when `bins_value` is a symbol, like `:auto`.

Like the `bar` function, the `histogram` function in `Plots.jl` accommodates numerous keyword arguments, enabling extensive customization of the visualization.
"""

# ╔═╡ 1688f7b2-33fa-4760-a126-c8ecce9d9ac1
md"""
##### Example
"""

# ╔═╡ 38a03154-9281-4a72-acb5-abb2b117a326
begin
	monthly_precip_gr = [2.73,1.99,2.9,3.43,2.23,4.05,5.96,4.36,3.92,3.41,7.32,7.13,2.62,4.04,3.65,1.2,3.27,4.09,4.22,2.84,4.75,2.6,3.07,2.67]
	
	histogram(monthly_precip_gr, legend=false, xlabel="Precipitation (inches)", ylabel="Frequency", title="Histogram of Total Monthly Precipitation in Grand Rapids")
end

# ╔═╡ 3024c755-2583-483a-92a0-2b0e94acebdb
md"""

**Boxplot in Julia with Plots.jl**
Box and whisker plots hold a significant place in statistical visualization. With `Plots.jl` in Julia, one can effortlessly generate a box plot using the `boxplot` function, provided with the list of values:

```julia
boxplot(values)
```
This results in a vertical boxplot.

For a horizontal orientation, you can use:
```julia
boxplot(values, orientation=:horizontal)
```

This distinction in Julia's `Plots.jl` is made using the `orientation` keyword argument, rather than the `vert` keyword used in Python's `matplotlib`.
"""

# ╔═╡ 68711fec-2991-4789-81e4-c2acb4f29f79
begin
rent_prices = [350, 400, 450, 425, 375, 500, 480, 550, 650, 700]

boxplot(rent_prices, label="Rent Prices", ylabel="Price", title="Boxplot of Rent Prices")

end

# ╔═╡ 213c1f76-c965-4152-8168-d1d9888870ed
begin
	
	
	rent_prices_allendale = [350, 400, 450, 425, 375, 500, 480, 550, 650, 700]
	
	# Create a horizontal boxplot
	boxplot(rent_prices_allendale, orientation=:horizontal, label="Rent Prices Allendale", xlabel="Price", title="Boxplot of Rent Prices in Allendale")
	
end

# ╔═╡ 5ee5bed0-53df-426c-b141-58de90159026
md"""
The values can be a lists of lists to plot more than one boxplot on the same figure. You can also specify a label (to replace the 1 on the left in the previous plot), which is used to label the different boxplots when there is more than one. For example,
"""

# ╔═╡ b7adaaf6-0c60-437a-9e42-2574f96c0d1e
begin
	
	
	# rent_prices_allendale = [350, 400, 450, 425, 375, 500, 480, 550, 650, 700]
	rent_prices_gr = [500, 550, 700, 850, 1000, 750, 600, 650, 800]
	all_prices = [rent_prices_allendale, rent_prices_gr]
	
	cities_current = ["Allendale", "Grand Rapids"]
	
	# Create horizontal boxplots for the two cities
	boxplot(all_prices, orientation=:horizontal, label=cities_current, xlabel="Price", title="Boxplot of Rent Prices")
	
end

# ╔═╡ b2a3db04-7fcc-42e8-a942-022f5630c84e
md"""
**Images**

In Julia, we can also:

- Load images
- Interpolate pixels (think smoothing)
- Visualize images with different colormaps

For more advanced image manipulation, we might rely on additional packages, but for now, we'll focus on loading and displaying an image.

We can load an image with the `load(filename)` function, where `filename` is a string containing the name of the file. This function is part of the `FileIO` package.

Once the image is loaded, we can use the `imshow` function provided by the `Plots` package to visualize it. While displaying, we can use various colormaps, though changing interpolation might require more specialized packages.

**Example**:

```julia
using Plots
using FileIO

# Load the image
img = load("path_to_your_image_file.png")

# Display the image
imshow(img)
```
"""


# ╔═╡ 6fc2ca6b-db1a-469b-ae42-9a09e1eec7b3
begin
	# Pkg.add("FileIO")
	# Pkg.add("ImageMagick")  # This is often required for handling a wider range of image formats with FileIO
	# Pkg.add("Plots")
end

# ╔═╡ 9286a1b1-aa7d-44c6-abb9-aa47534632fa
md"""

##### **Multiple Plots in One Figure**

Each of the previous visualizations has been a single plot (possibly with multiple lines, but all within a single "subplot" using Plots.jl terminology). There are times when we might want multiple subplots within a single figure, where each subplot contains its own visualization but doesn't overlap with others.

In Julia, using Plots.jl, we can create subplots by specifying the layout of the plotting command.

To create subplots:

```julia
plot(p1, p2, ..., layout=(nrows, ncols))
```

Where:

- `p1, p2, ...` are individual plot objects.
- `nrows` is the number of rows of subplots.
- `ncols` is the number of columns of subplots.

For instance, `layout=(2,3)` would specify a grid of 2 rows and 3 columns.

Here's how you might create a subplot:

```julia
using Plots

p1 = plot(rand(10), title="Plot 1")
p2 = plot(rand(10), title="Plot 2")

# Create a single figure with the two plots side by side
plot(p1, p2, layout=(1,2))
```

In this layout structure, visualizations can vary by subplot; you can have a line plot in one and a scatter plot in another, for example.

---

Note: Julia's Plots.jl provides a lot of flexibility when it comes to creating complex layouts, combining different types of plots, and customizing visualizations. If you are using Jupyter for Julia (often termed IJulia), the plots will be displayed directly in the notebook.

"""

# ╔═╡ 7745df31-417f-465f-a8f7-5f7920f0d1f9
md"""
Note: Often, the axis labels end up overlapping in subplots. This can generally be addressed by adjusting plot size, spacing, or sometimes by using the layout configurations in Plots.jl.

##### Example:

Consider the population data for Detroit and Chicago. Instead of plotting both of them on the same axis, we can opt to plot them on separate subplots within the same figure:
"""

# ╔═╡ b6adc074-9a4e-4a60-8d2d-43b37823e1bd
begin
	
	
	# Sample data
	# detroit_years = [2000, 2010, 2020]  # Replace with your data
	# detroit_populations = [951000, 713000, 670000]  # Replace with your data
	# chicago_years = [2000, 2010, 2020]  # Replace with your data
	# chicago_populations = [2896000, 2695000, 2654000]  # Replace with your data
	
	# Plot for Detroit
	p1 = plot(detroit_years, detroit_populations, marker=:circle, color=:cyan, linestyle=:dash, label="Detroit", xlabel="Census Year", ylabel="Population", title="Detroit Population Over Time")
	
	# Plot for Chicago
	p2 = plot(chicago_years, chicago_populations, marker=:circle, color=:magenta, linestyle=:dash, label="Chicago", xlabel="Census Year", ylabel="Population", title="Chicago Population Over Time")
	
	# Combining both plots into a single figure with two subplots (2 rows, 1 column)
	plot(p1, p2, layout=(2,1), size=(600,400))
	
end

# ╔═╡ Cell order:
# ╠═87eb6ad0-6dfd-11ee-3c8c-25e7573113ac
# ╠═f7675e34-0323-4fc9-b1ce-552b5606be31
# ╠═134bc80f-e968-4bde-92f3-8e2efb9e793e
# ╠═faca6f5a-a465-4572-b6bf-568337999970
# ╠═4ae1a970-9ec2-4917-b0b6-331d39582d6c
# ╠═2cd13a45-5ec4-40ad-a1d2-fc789f9a484c
# ╠═50e3f0eb-8530-4089-8515-c4bdd9923320
# ╠═6636254f-78f1-42a2-bc31-35f3cb480606
# ╠═c078b154-ddc1-4a3c-92f9-2de2af40a62a
# ╠═bcda1a51-a892-450c-af0c-0538390668e7
# ╠═0041bdce-ccca-422c-a5b9-60107415197f
# ╠═23492f2b-574d-4b06-b517-4966e39d89bf
# ╠═4d9da9cf-21ae-482d-ad9f-8409ebe9514a
# ╠═6e17f4e8-2b6b-411d-bc30-742a1275d3ba
# ╠═b2a0bb84-08f8-456b-95e2-4bac115c0180
# ╠═ea71563e-ad61-41e4-965a-b2c48c8025a0
# ╠═8fa1df0f-1d89-40ec-b83b-0bfaa1ba3367
# ╠═dcbd3d93-5e35-4d20-b969-08e715dbdf6d
# ╠═0b201fc9-4dc8-436a-91a6-8a4a478545b5
# ╠═1e8531d5-3dd0-4f0f-a7a1-4972b642f60e
# ╠═db1c5f75-ed41-440c-87af-981a9d77dd36
# ╠═8dd960bc-19aa-4d45-aee0-cbb468e94369
# ╠═1870b3b9-2b4f-4a9b-8867-ed63e3f35e9c
# ╠═61bbd527-60c2-41b3-b12d-bcf1e2129656
# ╠═54e708bb-6c45-4cbc-8512-af9f3480a22b
# ╠═7dc9fe62-ed02-4f78-bb79-e17ff9f3a8de
# ╠═4cfc619d-23bc-4d33-8286-a1f385775a7a
# ╠═0eae3889-1114-41ab-af98-dcd2a302b43d
# ╠═e0c02484-69ba-4860-971b-7b5a8716e714
# ╠═1688f7b2-33fa-4760-a126-c8ecce9d9ac1
# ╠═38a03154-9281-4a72-acb5-abb2b117a326
# ╠═3024c755-2583-483a-92a0-2b0e94acebdb
# ╠═b5d4e4ea-5c01-4d1f-913d-84ca0949e906
# ╠═68711fec-2991-4789-81e4-c2acb4f29f79
# ╠═213c1f76-c965-4152-8168-d1d9888870ed
# ╠═5ee5bed0-53df-426c-b141-58de90159026
# ╠═b7adaaf6-0c60-437a-9e42-2574f96c0d1e
# ╠═b2a3db04-7fcc-42e8-a942-022f5630c84e
# ╠═da15b9da-f2d1-46f7-a496-39e678fec2d0
# ╠═6fc2ca6b-db1a-469b-ae42-9a09e1eec7b3
# ╠═0ec09fa0-8f81-49bc-9a8e-fa88aa0d723c
# ╠═9286a1b1-aa7d-44c6-abb9-aa47534632fa
# ╠═7745df31-417f-465f-a8f7-5f7920f0d1f9
# ╠═b6adc074-9a4e-4a60-8d2d-43b37823e1bd
