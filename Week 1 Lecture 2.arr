use context starter2024
include image

a = "Hello World"





# Formulas to convert string characters to uppercase
string-to-upper("hello cs2000!") # -> HELLO CS2000!

string-toupper("hello cs2000!") # -> HELLO CS2000!

#Formula to convert string characters to lowercase
string-to-lower("HELLO CS2000")



#to get substring
string-substring("Welcome to London", 0, 7) # -> Welcome



sample_string = "Hello, how are you? My name is Chloé and I am from Connecticut."

#To check if certain characters exist in a string
string-contains(sample_string, "Hello")
string-contains(sample_string, "hello")
#To solve issues relating to case-sensitivity, convert sample string to all upper or all lowercase and search again.

circle(30, "solid", "green")

rectangle(20, 40, "solid", "blue")

triangle(50, "outline", "red")

#composition, each of these takes two images and gives back one image

#overlay
overlay(circle(30, "solid", "green"), rectangle(100, 40, "solid", "purple"))

#above
above(triangle(50, "outline", "red"), circle(30, "solid", "green"))

#below
below(triangle(50, "outline", "red"), circle(30, "solid", "green"))

#beside
beside(rectangle(20, 40, "solid", "blue"), beside(rectangle(20, 40, "solid", "white"), rectangle(20, 40, "solid", "red")))

#Trying to create a stop sign
regular-polygon # -> IDK what this is supposed to do

triangle(30, "solid", "red")
rotate(30, triangle(30, "solid", "red"))

beside(triangle(30, "solid", "red"), rotate(60, triangle(30, "solid", "red")))

#need to read slide
text,regular polygon