use context dcic2024
include csv
include data-source
  
#Task 1 - Task Planning
#|
     Input -> Imported csv 53 flight file
     1. Import table and sanitize
     2. Fix formatting
     3. 
  |#
  
  
flights_53 = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: String,
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
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end
  


#Task 2 — Handle Missing Data, Clean Data, and Identify Duplicates

#1 - Replace missing values in tailnum with "UNKNOWN".
fill-unknown = transform-column(flights_53, "tailnum", lam(s :: String): if s == "": "UNKNOWN" else: s end end)

check:
  fill-unknown.row-n(4)["tailnum"] is "UNKNOWN"
  fill-unknown.row-n(0)["tailnum"] is "N997DL"
end

"Line 59"
fill-unknown



#2 - Check the dep_delay and arr_delay columns. Replace negative values with 0. (This was introduced in the previous lab (Lab 4) — apply it again here for practice.)

fix-dep = transform-column(flights_53, "dep_delay", lam(t :: Number): if t < 0: 0 else: t end end)

fix-delay = transform-column(fix-dep, "arr_delay", lam(t :: Number): if t < 0: 0 else: t end end)

check:
  fix-delay.row-n(0)["dep_delay"] is 0
  fix-delay.row-n(0)["arr_delay"] is 0
  fix-delay.row-n(3)["dep_delay"] is 0
  fix-delay.row-n(5)["arr_delay"] is 0
  fix-delay.row-n(8)["dep_delay"] is 1
  fix-delay.row-n(9)["arr_delay"] is 24
end

"Line 79"
fix-delay






#|
   #3 - Identify Duplicate Rows from the Table
   # Converted flight to string when uploading and sznitizing table.
   
   Normalise the dataset as outlined below.

Combining flight, carrier, and dep_time to identify duplicate entries.
Create a new column called dedup_key that concatenates these three string values as a single string (e.g., "1053-UA-18:00").
                 Hint: Implement the following data normalisation inside a single lam function within build-column.  

   2. carrier: Normalise carrier by trimming extra spaces and converting it to uppercase for consistency. Use the following helper function for trimming extra spaces. 
|#

# Trim spaces at both ends
fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

"Line 110"
transform-column(fix-delay, "carrier", trim)