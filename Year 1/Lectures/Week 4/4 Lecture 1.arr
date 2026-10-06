use context dcic2024
include csv


#filter-wth -> passes a function as an argument

#compute-sum(2, 6) is a function

#higher-order function, it takes a function as one of its arguments
#Example: filter-with(function)





orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

orders
#pyret excludes trailing decimal zeros


fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.00
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(4)) is false
end

is-high-value(orders.row-n(0))



new-high-orders = filter-with(orders, is-high-value)

new-high-orders






#Check if 2 tables are equal or not
high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end

check:
  new-high-orders is high-value-orders
end








#using lambda functions

# it's a nameless functon, everything goes inside the nameless function, define threshold, name of column, name that function

filter-with(orders, lam(o): o["amount"] >= 8.0 end)




#order-by (to arrange table in ascending or descending order)
order-by(orders, "amount", true) #ascending
order-by(orders, "amount", false) #descending





#Lecture Exercises
#is-morning = ta





travel = load-table:
  Location :: String,
  Subject :: String,
  Date :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/photos.csv", default-options)
end




filter-with(travel, lam(r): r["Subject"] == "Forest" end)