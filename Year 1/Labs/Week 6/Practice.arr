use context starter2024
include image
include csv

  
#Week 1 - Lecture 1
Area = 3 * 10
Perimeter = 3 + 3 + 10 + 10

#3 expressions
15 - 5
9 + 1
10 * 1

num-max(9, 18)

sin(1)

#Week 1 - Lecture 2
string-to-upper("hello cs2000!")

overlay(circle(20, "solid", "blue"), triangle(50, "solid", "yellow"))

above(rectangle(20, 30, "solid", "green"), rectangle(30, 40, "solid", "purple"))

rectangle(100, 20, "outline", "white")

rotate(90, rectangle(100, 20, "outline", "white"))

regular-polygon(20, 8, "solid", "red")

overlay-xy(text-font("STOP", 1, "white", "default", "default", "normal", "normal", false), -11, -20, regular-polygon(20, 8, "solid", "red"))





#Week 5 - Lecture 1
voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data

string-substring(voter-data.row-n(6)["County"], 0, 14)