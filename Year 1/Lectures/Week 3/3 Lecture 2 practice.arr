use context dcic2024
include csv
include data-source


people = table: name, age
  row: "Jay", 27
  row: "George", 40
  row: "Jaliyah", 15
end

people.row-n(2)

people.row-n(2)["age"] >= 21


#|fun age-check(r :: Row) -> Boolean:
  doc: "Determine whether a given row contains someone age 21 or older."
  r["age"] >= 21
where:
  age-check(people.row(1)) is true
  age-check(people.row(2)) is false
end
|#



# lecture follow-along notes
workout = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end

workout


#How to check that both tables are the same (use is), different (use is-not).
check:
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end
  is
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end
end





workouts = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end

#Extracting row
first-row = workouts.row-n(0)
first-row


#Extracting cell (2 ways)
first-row["activity"]
workouts.row-n(0)["duration"]


#How to identify # of rows
workouts.length()

#How to get all values in a specific column
workouts.get-column("activity")

#Some basic stats (might require dcic2024 context)
mean(workouts, "duration")
median(workouts, "duration")
sum(workouts, "duration")
stdev(workouts, "duration")
modes(workouts, "duration")


#Import CSV from the url
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
    #sanitize means to convert into proper number format, otherwise numbers are seen as strings.
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipes

recipes.length()

mean(recipes, "prep-time")


#How to load CSV file instead of the URL
recipe = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-file("recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipe

#|What if the file is in a separate folder? (recipe folder is the name of the folder in this case)
recipe2 = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-file("recipe folder/recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipe2
|#


histogram(recipe, "prep-time", 50)
box-plot(recipe, "servings")




