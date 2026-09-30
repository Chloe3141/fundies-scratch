people = table: name, age
  row: "Jay", 27
  row: "George", 40
  row: "Jaliyah", 15
end

people.row-n(2)

people.row-n(2)["age"] >= 21


fun age-check(r :: Row) -> Boolean:
  doc: "Determine whether a given row contains someone age 21 or older."
  r["age"] >= 21
where:
  age-check(people.row(1)) is true
  age-check(people.row(2)) is false
end


