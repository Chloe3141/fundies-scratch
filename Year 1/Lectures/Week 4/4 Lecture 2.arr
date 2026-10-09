use context dcic2024

#|
   transform-column
   -> Takes one value
   -> Returns same columns, new values in one
|#
   


sales = table: item :: String, price :: Number, qty :: Number
  row: "Tea", 2.50, 4
  row: "Coffee", 3.00, 2
  row: "Cake", 4.25, 3
end

sales

sales.get-column("price")




# Use transform-column to add VAT to every price.
fun add-vat(p :: Number) -> Number:
  doc: "Returns the price with 20% VAT added."
  p * 1.2
where:
  add-vat(10) is 12
  add-vat(0) is 0
end

with-vat = transform-column(sales, "price", add-vat)

with-vat.get-column("price")



#Same thing, but with lambda function instead.
transform-column(sales, "price", lam(p): p * 1.2 end)
   
   
   
   
   
   
   
#|
   build-column
   -> Takes one whole row
   -> Returns one extra column
|#

fun line-total(r :: Row) -> Number:
  doc: "Returns price * qty for one order line."
  r["price"] * r["qty"]
where:
  line-total(sales.row-n(0)) is 10
  line-total(sales.row-n(2)) is 12.75
end


with-total = build-column(sales, "total", line-total)


with-total

with-total.get-column("total")



#Chain them together: Operations composed because each returns a table.
#ADD VAT, then total the VAT-Inclusive prices

#Reminder -> build-colum(sakes, "total", line-totak)

#transform-column(sales, "price", add-vat)



billed = build-column(transform-column(sales, "price", add-vat), "total", line-total)

billed

#billed-2 = 

sales

#|
build-column(sales, "total", ((lam(p): r["price"] * r["qty"] end) * 1.2))
|#






#Week 4 Lecture 2 Exercises

#Copied solution below to understand later.#
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

items


#transfomrm-column(table, "column name", computation-fucntion)
fun add-10(c :: Number) -> Number
  doc:"Adds 10 to x-coordinate."
  c + 10
end

#

#|transform-column(
    transform-column(items, "x-coordinate", lam(n): n * 0.9 end),
    "y-coordinate", lam(n): n * 0.9 end
    )
|#



#|
   fun obfuscate(item :: String) -> String:
  item * (string-length(items.get-column("item")))
end 
|#


#|fun obfuscate(s :: String) -> String:
  doc: "Takes string length of an item in the item column and returns a string of xs of the same length."
  "X" * string-length(s)
where:
  obfuscate("Sword of Dawn") is "XXXXXXXXXXXXX"
end
|#



#transform-column(items, "item", 