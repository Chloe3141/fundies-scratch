use context starter2024
#|
  The full design recipe:
 Four steps in this order, write the code last.
   1. Type annotation: what types of input and outputs are expected
   
   2. Doc string: one sentence explaining purpose of function
   
   3. Examples: concrete input/output pairs in a where: block
   
   4. Code: the body, written last
|#


# Problem 1
fun leap-year(year :: Number) -> Bool:
  if
    leap-year(year) / 4 is whole-num
    and
    leap-year(year) / 100 is non-whole:
    
    true
    
  else if
    leap-year(year) / 100 is whole-num
    and
    leap-year(year) / 400 is whole-num:
    
    false
    
  else
    false
  end







# Problem 2









# Problem 3









# Problem 4
#Question: Can tables have doc strings and where blocks?
planets = table: Planet :: String, Distance :: Number
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

planets

mars = planets.row-n(3)
mars

mars["Distance"]







# Problem 5