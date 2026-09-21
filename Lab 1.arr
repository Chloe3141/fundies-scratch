use context starter2024
# I am looking for feedback on how I use comments and if there is a more efficient way I could be coding for images.

1 . T-Shirt Shop Questions
# 1.1 Calculating Cost

#|
   Expressoin for any number of shirts
   (12 * x) + 3
   x = number of shirts
   3 = a one-time fee per design
|#


# Cost of 1 shirt
(12 * 1) + 3

# Total cost for 5 of the same shirt
(12 * 5) + 3

# Total cost for 7 of the same shirt
(12 * 7) + 3

# Comparison of the results
num-min(63, 87) # 7 shirts cost more
num-max(63, 87) # 5 shirts cost less

(87 - 63) / ((12 * 1) + 3) # The difference in the cost between both amounts, in number of shirts



# 1.2 Rectangular Poster

# Perimeter (2 * (width + height))
2 * (420 + 594)

# Cost of poster in GBP (perimeter * 0.10)
2028 * 0.10

#|
   Example of incorrect perimeter calculation
   2 * 420 + 594
   No parentheses ->
   improper order of operations ->
   Pyret won't run the program ->
   reads as an error.
|#





# 2. String Surprises
# 2.1 Saving a Tagline
"Designs for everyone!"

#|
   "Designs for everyone!
   -> Missing quotation marks
   -> Reads as missing closing punctuation / potential multi-line string
|#


# 2.2 Color Inventory
# Adding Colors
"red" + "blue" # -> merges strings

#|
   1 + "blue" doesn't work
   -> + expects operands to be the same type of data
   -> num + num OR "string" + "string"
|#





# 3. Make a traffic Light (frame, lights, & challenge)
above(overlay-xy(circle(15, "solid", "green"), -14, -90, (overlay-xy(circle(15, "solid", "orange"), -14, -50, (overlay-xy(circle(15, "solid", "red"), -14, -10, rectangle(60, 130, "solid", "black")))))), rectangle(20, 100, "solid", "black"))





# 4. Broken Code Hunt
# 4.1 Rectangle Error
rectangle(50, 20, "solid", "black") # Error was that the configuration specifications were in the wrong order.


# 4.2 Circle Error
circle(30, "solid", "red") # Error was that the specification for the solid characteristic is a string, but it wasn't in quotation marks.





# 5 Create a Flag or Shield
# 5.1 Flag Design
overlay(circle(30, "solid", "gold"), (overlay(rectangle(130, 10, "solid", "blue"), rectangle(130, 80, "solid", "white"))))


# 5.2 Shield Variation
overlay-xy((circle(5, "solid", "white")), -25, -80, (overlay-xy((circle(5, "solid", "white")), -25, -13, (overlay-xy((above(rotate(180, triangle(60, "solid", "black")), triangle(60, "solid", "black"))), 0, 0, rectangle(60, 104, "solid", "red"))))))
