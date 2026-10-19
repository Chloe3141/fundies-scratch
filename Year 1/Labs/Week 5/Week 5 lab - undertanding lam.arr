use context starter2024
include csv
include data-source

flights_53 = load-table:
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
  source: csv-table-file("flights_sample53.csv", default-options)
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
  
fun create-unknown(s :: String) -> String:
  doc: "..."
    if s == "":
      "UNKNOWN"
  else:
      s
    end
  end

#transform-column(flights_53, "tailnum", create-unknown)

fixed = transform-column(flights_53, "tailnum", lam(s :: String): if s == "": "UNKNOWN" else: s end end)

#fixed_with_func = create-unknown(flight_53.row-n(0)["tailnum"])
#fixed_with_func
