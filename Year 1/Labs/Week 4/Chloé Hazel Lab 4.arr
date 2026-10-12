use context dcic2024
include csv
include data-source


# Exercise 1 — Long Flights
#1
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



#3
only_long_flights = filter-with(flights, is_long_flight)

only_long_flights



#4
great-to-least = order-by(only_long_flights, "air_time", false)

great-to-least



#5
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
only-delayed = filter-with(flights, lam(t): t["dep_delay"] >= 30 end)

delayed-morning = filter-with(only-delayed, lam(t): t["sched_dep_time"] < 1200 end)

