### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 397c92b0-553f-11ee-3cbf-55f2f86c3682
#In Julia, you can perform iteration using various types of loops, including for loops and while loops. These loops allow you to repeat a sequence of code statements multiple times, making them suitable for tasks that require repetitive computation.

#Here's an overview of how to use these loops in Julia:

# ╔═╡ eca51be4-c289-4ab9-bb8f-0fe64e97655f
#for Loops
#A for loop is commonly used when you know the number of iterations in advance or when you want to iterate over elements in a collection (like an array, range, or dictionary).

# ╔═╡ 136b8793-c977-4a4e-a7d4-4c79a5211ec0
begin
	# Initialize a counter to control the loop
	counter = 1
	
	# Define the while loop with a condition to execute three times
	while counter <= 3
	    # Code inside the loop body
	    println("Inside the loop - Iteration $counter")
	
	    # Increment the counter
	    global counter += 1  # Increment the counter globally
	end
	
	# Code after the loop
	println("Outside the loop")
	
end

# ╔═╡ 6661713b-56a5-49eb-aecf-512e2ec5282e
#In Julia, the syntax for a while loop is similar to the one you described. You use the while keyword, followed by a condition followed by end.

# ╔═╡ 3e10fc77-50c3-44ff-90e4-ebe5ab936269
#The caution about infinite loops applies to Julia as well as Python (and many other programming languages). Infinite loops can lead to programs that never terminate, which is typically undesirable. You should always ensure that the loop condition will eventually become false to avoid infinite loops. 

# ╔═╡ 0efae747-428c-402c-9d4a-6a5cdb65a6ac
#Examples
#Let's start by looking at a simple example. Let's start by just summing up numbers starting at one until the sum is greater than 20.

# ╔═╡ 7f1f872d-7adb-43bc-b4d8-92dceb184f11
begin
# Initialize variables
total = 0
i = 1

# Start the while loop
while total <= 20
    # Update the total by adding the current value of i
    global total += i

    # Print the current step
    println("added ", i, " total =", total)

    # Increment i for the next iteration
    global i += 1  # Increment i globally
end
	
end

# ╔═╡ 62abd8c4-d598-450a-904f-b4cfc62ac177
#The first line in the loop total += i was pretty crucial. Consider what would have happened without that line. Would total have ever changed?

#Now let's look at a slighlty more complicated loop. Consider the problem of counting how many numbers even numbers starting at 2 you must sum in order for the sum to be greater than 100.

# ╔═╡ 8974fa5e-207c-44ba-8127-a5fba729cdf9
begin
	# Initialize variables
	total2 = 2
	count = 1
	current = 4
	
	# Start the while loop
	while total2 <= 100
	    # Update the total by adding the current value
	    total2 += current
	
	    # Increment the count
	    count += 1
	
	    # Increment the current even number
	    current += 2
	end
	
	# Print the result
	println("adding up ", count, " increasing even numbers gives sum greater than 100")
	
end

# ╔═╡ 91dc1414-3ad0-4c5a-8683-558cc87e0f11
# In these examples, we were going upward towards our while condition, but we just as easily could have been decreasing some variable until it dropped below some value. Additionally, the condition in the while statement can be any boolean expression. It could involve negation (aka not) and/or could combine multiple boolean expressions with logical operators such as and, or. 

# For instance, maybe we want to simulate a bank account to see how many days we can double the amount of money we take out until we either have taken out all of our money or are taking out $1000 per day. One approach to this could look like:


# ╔═╡ 4d2c4cd2-f9fe-41d5-aa60-7397e7bc2ec6
begin
	# Initialize variables
	balance = 3000
	withdrawal = 1
	days = 0
	
	# Start the while loop
	while !(balance <= 0) && withdrawal <= 1000
	    # Update the balance by subtracting the withdrawal amount
	    balance -= withdrawal
	
	    # Print the current step
	    println("withdrew ", withdrawal, " balance = ", balance)
	
	    # Double the withdrawal amount
	    withdrawal *= 2
	
	    # Increment the number of days
	    days += 1
	end
	
	# Print the total number of days
	println("days = ", days)
	
end

# ╔═╡ 4a468da9-b1d7-45b5-9285-7296c94b7d93
#n Julia, just like in Python, for loops allow us to perform repeated tasks. Unlike while loops, where we specify conditions to control the loop, in for loops, we directly specify the values for the loop variable to iterate over. The general structure of a for loop in Julia is as follows:
#for val in sequence
    # Loop body code
#end

# Other code outside the loop
#Here, the term "sequence" does not necessarily refer to a variable named "sequence" but rather to any iterable or collection of values that can be looped through. In Julia, these are referred to as iterators, and they define a set of values and the order in which to iterate through them.

# ╔═╡ f5a4ce98-86ee-4df0-b58a-ca483bf7d268
#Examples

#Let's start by looking at a common example of a for loop in Julia, which is to loop a set number of times. This is often achieved using the 1:n range, where n is the number of times you want to loop.

# ╔═╡ f7793643-eaa6-44d1-bc5d-2950f14de736
for i in 1:5
    println("hello")
end

# ╔═╡ 4ccb4a50-964b-4684-bd99-064f41303137
#The above example was pretty simple, just saying "hello" 5 times. This example didn't even need to make use of the variable i, it the loop solely as a way of controlling how many times to run the statement inside the loop. While this sometimes occurs, it's often more frequent that we actually need to make use of the loop variable.

# ╔═╡ 22e9bd21-6113-4c3e-8dd4-beef06728ce7
begin
	tot = 0
	for i in 0:5
	    tot += i
	    println("added", i, " tot = ", tot)
	end
end

# ╔═╡ ce9427d8-8f51-4903-82eb-2b5641ec18fa
#Note that i took on the values, but not 6 because range is exclusive of the stop value. You might think that i was a bad (or lazy) choice of a variable name (and depending on the use, it may very well be), but it is very common to see  as a loop variable in almost all programming languages.

#We can also pass an optional 3rd argument to the range() function allowing us to specify a step -- how much we want to increase our looping value by each time. Let's look at the same code, but instead using a step value of 2.



# ╔═╡ 4e1a8baf-ca0c-4769-a40b-b9fe7300f67b
begin
	tot1 = 0
	for i in 0:2:5
	    tot1 += i
	    println("added", i, " tot = ", tot1)
	end
	
end

# ╔═╡ 420e1bbc-a01d-419a-b1fe-af854471774e
#Notice that i now took on the values, skipping all of the odd values. We could have gotten just the odd values (not even) by adjusting our start value to be 1.

# ╔═╡ 4e22124f-fd0f-4e18-b094-48a7af2109b5
begin
	tot2 = 0
	for i in 1:2:5
	    tot2 += i
	    println("added", i, " tot = ", tot2)
	end
	
end

# ╔═╡ edd94e5f-5b16-4eb6-b3ab-9a2ca788f383
#Let's look at an example of looping through a list. Suppose we have a list of temperatures in Fahrenheit that we wish to convert to Celsius. We first start by creating a function to convert a single temperature, and then we loop through the list and call the function for each value:


# ╔═╡ d6c48696-5df9-4299-aebf-18f6ef803d2f
begin
	function fahrenheit_to_celsius(ftemp)
	    ctemp = (ftemp - 32) * 5/9
	    return ctemp
	end
	
	temps = [0, 32, 50, 70, 90]
	
	for ftemp in temps
	    ctemp = fahrenheit_to_celsius(ftemp)
	    println(ctemp)
	end
	
end

# ╔═╡ 1e8f3d5f-64c3-4e85-8617-790d46a9c33c
#break statement: Use "break" to exit out of the innermost enclosing "for" or "while" loop prematurely. It's often used within a conditional check to break the loop when something specific occurs.

#continue statement: The "continue" statement allows you to skip the remaining code in the current iteration of a loop and jump to the next iteration. This is useful when you want to avoid unnecessary work within a loop based on certain conditions.

#These statements are helpful for controlling the flow of your loops and are particularly useful in more complex scenarios.

# ╔═╡ 6efc74a8-15de-4bb8-ba55-20ca13f2620b
begin
	balance1 = 1000
	atm_limit = 5
	withdrawl_amount = 50
	
	while balance1 > 0
	    if atm_limit == 0
	        break
	    else
	        atm_limit -= 1
	        balance1 -= withdrawl_amount
	    end
	end
	
	println(balance1)
	
end

# ╔═╡ fa09b863-59c4-4fae-8a3b-1cc5f237e733
for i in -5:5
    if i == 0
        continue
    end
    println(1 / i)
end


# ╔═╡ b75755c0-0a80-435d-b98a-e4c86a8b9f4a
# Introduction:
# We are using nested for loops to print a triangle of 'z's. 
# The outer loop controls the number of rows, while the inner loop
# adds 'z's to each row based on the row number.

for r in 1:5
    for c in 1:r
        print("z ")  # Adds a single 'z' to this row
    end
    println()  # Adds a newline after all 'z's in this row
end

# ╔═╡ be9b204f-6419-441b-9a94-3ea63789619c


# ╔═╡ Cell order:
# ╠═397c92b0-553f-11ee-3cbf-55f2f86c3682
# ╠═eca51be4-c289-4ab9-bb8f-0fe64e97655f
# ╠═136b8793-c977-4a4e-a7d4-4c79a5211ec0
# ╠═6661713b-56a5-49eb-aecf-512e2ec5282e
# ╠═3e10fc77-50c3-44ff-90e4-ebe5ab936269
# ╠═0efae747-428c-402c-9d4a-6a5cdb65a6ac
# ╠═7f1f872d-7adb-43bc-b4d8-92dceb184f11
# ╠═62abd8c4-d598-450a-904f-b4cfc62ac177
# ╠═8974fa5e-207c-44ba-8127-a5fba729cdf9
# ╠═91dc1414-3ad0-4c5a-8683-558cc87e0f11
# ╠═4d2c4cd2-f9fe-41d5-aa60-7397e7bc2ec6
# ╠═4a468da9-b1d7-45b5-9285-7296c94b7d93
# ╠═f5a4ce98-86ee-4df0-b58a-ca483bf7d268
# ╠═f7793643-eaa6-44d1-bc5d-2950f14de736
# ╠═4ccb4a50-964b-4684-bd99-064f41303137
# ╠═22e9bd21-6113-4c3e-8dd4-beef06728ce7
# ╠═ce9427d8-8f51-4903-82eb-2b5641ec18fa
# ╠═4e1a8baf-ca0c-4769-a40b-b9fe7300f67b
# ╠═420e1bbc-a01d-419a-b1fe-af854471774e
# ╠═4e22124f-fd0f-4e18-b094-48a7af2109b5
# ╠═edd94e5f-5b16-4eb6-b3ab-9a2ca788f383
# ╠═d6c48696-5df9-4299-aebf-18f6ef803d2f
# ╠═1e8f3d5f-64c3-4e85-8617-790d46a9c33c
# ╠═6efc74a8-15de-4bb8-ba55-20ca13f2620b
# ╠═fa09b863-59c4-4fae-8a3b-1cc5f237e733
# ╠═b75755c0-0a80-435d-b98a-e4c86a8b9f4a
# ╠═be9b204f-6419-441b-9a94-3ea63789619c
