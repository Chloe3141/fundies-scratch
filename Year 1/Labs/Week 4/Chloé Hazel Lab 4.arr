use context dcic2024
include csv
include data-source


# Exercise 1 — Long Flights
#1 - Inserting flight data table
flights = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

flights



#2
fun is_long_flight(r :: Row) -> Boolean:
  doc: "Checks if the flight distance is greater than or equal to 1500."
    r["distance"] >= 1500
where:
  is_long_flight(flights.row-n(1)) is false
  is_long_flight(flights.row-n(16)) is true
end
  
is_long_flight(flights.row-n(3))



#3 - creates a table of only long flights
only_long_flights = filter-with(flights, is_long_flight)

only_long_flights



#4 - orders table of only long flights from most to least air-time
great-to-least = order-by(only_long_flights, "air_time", false)

great-to-least




#5 - Specific information about flight with longest air-time.
great-to-least.row-n(0)["carrier"]
great-to-least.row-n(0)["origin"]
great-to-least.row-n(0)["dest"]










#Exercise 2 — Delayed Morning Flights
#1
fun is_delayed_departure(r :: Row) -> Boolean:
  doc: "Checks if departure is delayed by 30 minutes or more."
  r["dep_delay"] >= 30
where:
  is_delayed_departure(flights.row-n(56)) is true
  is_delayed_departure(flights.row-n(116)) is false
  is_delayed_departure(flights.row-n(113)) is false
end

is_delayed_departure(flights.row-n(6))



#2
fun is_morning_sched_dep(r :: Row) -> Boolean:
doc: "Checks if the scheduled departure time is before noon."
r["sched_dep_time"] < 1200
where:
is_morning_sched_dep(flights.row-n(2)) is true
is_morning_sched_dep(flights.row-n(340)) is false
is_morning_sched_dep(flights.row-n(400)) is false
end



#3
#Keep only flights delayed 30 or more minutes
only-delayed = filter-with(flights, lam(t): t["dep_delay"] >= 30 end)

only-delayed



#keep only morning flights delayed 30 or more minutes
delayed-morning = filter-with(only-delayed, lam(t): t["sched_dep_time"] < 1200 end)

delayed-morning




#4 - Keep only morning delays with distance over 500
long-delayed-morning = filter-with(delayed-morning, lam(t): t["distance"] > 500 end)

long-delayed-morning




#5 - order by longest morning departure delay
rank-long-delayed-morning = order-by(long-delayed-morning, "dep_delay", false)

rank-long-delayed-morning




#6 - Specific data about longest morning departure delay
rank-long-delayed-morning.row-n(0)["flight"]
rank-long-delayed-morning.row-n(0)["origin"]
rank-long-delayed-morning.row-n(0)["dep_delay"]









#Exercise 3 — Clean Delays + Compute Effective Speed

#1 - Creating function to use in transform column
fun only-late(n :: Number) -> Number:
  doc: "Transforms dep_delay column so that early departures are show as 0 rather than negative."
  if n < 0:
    0
  else:
    n
  end
where:
  8 is 8
  0 is 0
  -4 is -4
end


#Transforming dep_delay column, then transforming arr_delay in that new table. All negatives are now 0.
no-early = transform-column(transform-column(flights, "dep_delay", only-late), "arr_delay", only-late)

no-early





#2 - Build column "effective_speed" (mph)
fun speed(r :: Row) -> Number:
  doc: "Calculates effective speed from distance and air_time of a flight."
  if r["air_time"] > 0:
    r["distance"] / (r["air_time"] / 60)
  else:
    0
  end
where:
  speed(no-early.row-n(0)) is 84000/227
end


with-speed = build-column(no-early, "effective_speed", speed) 

with-speed




#3 - Ordering flights fastest to slowest by effective_speed
order-by(with-speed, "effective_speed", false)


#4 - Specific data about fastest flight
with-speed.row-n(0)["carrier"]
with-speed.row-n(0)["origin"]
with-speed.row-n(0)["dest"]







#Exercise 4 — Discount Late Arrivals + On-Time Score
#|
  Define a function apply-arrival-discount(t :: Table) -> Table that take a table t and reduces arr_delay by 20% only when: 0 ≤ arr_delay ≤ 45. The table t should have at least one column named arr_delay.

Hint: Use transform-column with a lambda that applies the discount if the condition holds, otherwise leaves the value unchanged.

Hint: Write a small test table with a few rows (-10, 0, 30, 60) to test your function. Include a where: block with a small test table (3-4 rows) inside your function definition.

And then apply this function to the flights table. (apply-arrival-discount(flights)) 
|#


fun apply-arrival-discount(t :: Table) -> Table:
  doc: "Takes a table and reduces arr_delay between 0 and 45 by 20%."
  if t["arr_delay"] <= 45:
    t["arr_delay"] * 0.8
  else:
    t["arr_delay"]
  end
end

apply-arrival-discount(with-speed)