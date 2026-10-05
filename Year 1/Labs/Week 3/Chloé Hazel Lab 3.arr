use context dcic2024
include csv
include data-source


#|
  The full design recipe:
 Four steps in this order, write the code last.
   1. Type annotation: what types of input and outputs are expected
   
   2. Doc string: one sentence explaining purpose of function
   
   3. Examples: concrete input/output pairs in a where: block
   
   4. Code: the body, written last
|#


# Problem 1
fun leap-year(yr :: Number) -> Boolean:
  doc: "Determines if a given year is a leap year."
  if
    num-modulo(yr, 4) == 0:
    true
  else:
    false
end
where:
  leap-year(1) is false
  leap-year(4) is true
  leap-year(2100) is true
end

leap-year(2012)
leap-year(5)



# Problem 2
fun tick(s :: NumInteger) -> NumInteger:
  doc: "Takes a number of seconds and returns the next second, as if a clock were ticking."
  if  
  (s >= 0) and (s <= 59):
    s + 1
  else:
    0
end
where:
  tick(5) is 6
  tick(-5) is 0
  tick(61) is 0
end
 
tick(5)



#|
   fun leap-year(year :: Number) -> Bool:
  if
    ((leap-year(year) / 4) == NumInteger)
    and
    ((leap-year(year) / 100) == non-whole):
    true
  else if
    ((leap-year(year) / 100) == NumInteger)
    and
    ((leap-year(year) / 400) == NumInteger):
    true 
  else:
    false
  end
end

|#




# Problem 3
fun rock-paper-scissors(P1 :: String, P2 :: String) -> String:
  doc: "Determines winner of a 2-player rock-paper-scissors game."
  ask:
    | P1 == P2 then: "tie"
    | (P1 == "rock") and (P2 == "paper") then: "player 1"
    | (P1 == "rock") and (P2 == "scissors") then: "player 1"
    | (P1 == "paper") and (P2 == "rock") then: "player 2"
    | (P1 == "paper") and (P2 == "scissors") then: "player 2"
    | (P1 == "scissors") and (P2 == "rock") then: "player 2"
    | (P1 == "scissors") and (P2 == "paper") then: "player 1"
    | otherwise: "invalid"
  end
where:
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("rock", "paper") is "player 1"
  rock-paper-scissors("toothpick", "rock") is "invalid"
end

rock-paper-scissors("paper", "rock")
      

      
      
      
      
      



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
something = load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
end

something




#|3rd parameter of order-by is true or false making it ascending or descending

(dataset or table, "rate", true or false)|#