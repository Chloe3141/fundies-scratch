use context dcic2024

#Chloé Hazel



#Task 1: Expressions (Week 1) [3 marks]

#1 Cost of three lattes at £3.20 each
cost = 3 * 20 # -> 60
cost

#2
flavor = "Oat" + " " + "latte" # -> "Oat latte"
flavor

#3
how-long = string-length("cappuccino") # -> 10
how-long











# Task 2: Definitions and functions (Week 2) [5 marks]

#1 Define latte-price as 3.20, with a Number annotation. [1 mark]
latte-price :: Number = 3.20


#2 Design a function that returns the cost of an order. [4 marks]
fun order-cost(n :: Number, p :: Number) -> Number:
  doc: "Tells you the cost of an order based on number of drinks and price per drink."
  n * p
where:
  order-cost(5, 3.20) is 16
  order-cost(0, 3.20) is 0
  order-cost(0, latte-price) is 0
  order-cost(5, latte-price) is 16
end





  




#Task 3: Conditionals and tests (Week 3) [6 marks]
fun discount-rate(n :: Number) -> Number:
  doc: "Returns the discount rate of an order based on number of drinks."
  if n < 5:
    0
  else if n <= 9:
    0.1
  else:
    0.2
  end
where:
  discount-rate(0) is 0
  discount-rate(4) is 0
  discount-rate(5) is 0.1
  discount-rate(8) is 0.1
  discount-rate(9) is 0.1
  discount-rate(10) is 0.2
  discount-rate(11) is 0.2
end

















#Task 4: Tables (Weeks 3 and 4) [6 marks]
orders = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end


#1
build-column(orders, "cost", lam(r): r["drinks"] * r["price"] end) # -> Adds column for cost of an order.


#2
big-orders = filter-with(orders, lam(r): r["drinks"] >= 5 end) # -> Ben and Chen left.
big-orders






#|
Design total-drinks-loop, which adds up a list of numbers using a for each loop and a var. [4 marks]
Design total-drinks-fold, which does the same using fold. [3 marks]
Check that both give the same answer for drinks-list. [1 mark]

|#



#Task 5: Lists, loops and fold (Week 5) [9 marks]
#1. Gives list of drinks from column drinks in orders table.
drinks = extract drinks from orders end
check:
  drinks is [list: 2, 6, 12, 1]
end

drinks


#2
#|
   fun total-drinks-loop(drinks :: List<Number>) -> Number:
  doc: "adds up a list of drinks using a for each loop and a var."
  var drink = [list: ]
  for each(d from drink):
    drink := drink
|#


#|
   check:
   total-drinks-loop([list: 2, 6, 12, 1]) is total-drinks-fold([list: 2, 6, 12, 1])

|#










#Task 6: Structured data and recursion (Week 6) [11 marks]

data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end

#|
   Design a function cup-fee that takes an Order and returns the cup fee in pounds: 0.25 per drink for a takeaway without its own cup, and 0 otherwise. Use cases, and test both variants. [6 marks]
Design total-drinks-rec, which adds up a list of numbers using recursion: cases with an empty branch and a link branch. Do not use a loop or fold this time. [5 marks]
|#

#|fun cup-fee(o :: Order) -> Number:
  doc: "Returns cup fee for an order based on number that are takeaway."
  cases (Order) o:
    | empty => empty
    | is takeaway => 0.25
    | is 
|#