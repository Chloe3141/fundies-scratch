use context dcic2024
import math as M
import statistics as S

#|
   filter-with
   transform-column
   t.row-n
   t.length
|#




cafe-data = table: day, drinks-sold
  row: "Mon", 45
  row: "Tue", 30
  row: "Wed", 55
  row: "Thu", 40
  row: "Fri", 60
end

#Column is type of data called a list
sales = cafe-data.get-column("drinks-sold")

sales


M.max(sales)
S.mean(sales)
S.median(sales)
M.sum(sales)










discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = distinct(discount-codes) #-> lists each input once regardless of how many times it appears.

unique-codes



fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
  #Above says if it's not already lowercase, make lowercase
end

real-codes = filter(is-real-code, unique-codes)

first-code = real-codes.get(0)
lower-codes = map(string-to-lower, real-codes)


new-lower-codes = map(string-to-lower, discount-codes)
# Passes string-to-lower on 1 value at a time from discount-codes and saves in new-lower-codes.


distinct(filter(is-real-code, map(string-to-lower, discount-codes)))
#|
   1. convert discount-codes to lower
   2. filter using is-real-code
|#
#distinct keeps the last copy of repeated value, not the first





#to sort a list in ascending order
sales.sort()

#to sort a list in descending
sales.sort().reverse






#variables that can change
var total = 1
total := total + 10
# := is assignment operator. Stores info in variable that already exists.
total # -> 11





fun my-sum(num-list :: List) -> Number block:
  doc: "Pyret runs several operations due to the loop so you need to add block. Each takes one item at a time from a list."
  var running = 0
  for each(n from num-list):
    running := running + n
  end
  running
where:
  my-sum([list: 0, 1, 2, 3,]) is 6
  my-sum([list: ]) is 0
end


my-sum([list: 2, 3, 45, 6789, 0, 0])
my-sum(sales)





fun add-two(numbers :: List<Number>) -> List<Number> block:
  doc: "Adds two to each number in a list."
  var added-two = [list: ]
  for each(n from numbers):
    added-two := added-two.append([list: n + 2])
    #append adds value to empty list
  end
  added-two
where:
  add-two([list: 1, 2, 3]) is [list: 3, 4, 5]
end




fun add-twenty(prices :: List<Number>) -> List<Number> block:
  doc: "Adds 20% to each number in a list."
  var added-twenty = [list: ]
  for each(p from prices):
    added-twenty := added-twenty.append([list: p * 1.2])
    #append adds value to empty list
  end
  added-twenty
where:
  add-twenty([list: 10, 50, 100]) is [list: 12, 60, 120]
  add-twenty([list: ]) is [list: ]
end

add-twenty(sales)


#same thing, but now with lambda!
map(lam(p): p * 1.2 end, sales)\








#IMPORTANT#
#fold: the loop template without the var
#fold :: (f :: (Basem Elt -> Base), base :: Base, lst :: List <Elt>) ->


#|
   3 inputs
   1. starting value -> can be anything
   2. rule -> takes answer and next item to return new answer
   3. list -> final output
|#


fun my-sum-fold(num-list :: List<Number>) -> Number:
  doc:"..."
  fold(lam(acc, n): acc + n end, 0, num-list)
where:
  my-sum-fold([list: 0, 1, 2, 3]) is 6
  my-sum-fold([list: ]) is 0
end


#|
   fold(lam(acc, n): acc + n end, 0, [list: 45, 30, 55]) # 130
   
   answers so far: 0,
   next item: 45, 30, 55
   new answer: 45, 75, 130