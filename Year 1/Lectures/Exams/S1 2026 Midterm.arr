use context dcic2024

fun total-characters(words :: List<String>) -> Number:
doc: "adds up the number of characters in all the strings in words"
cases (List) words:
| empty => 0
| link(f, r) => string-length(f) + total-characters(r)
end
where:
total-characters([list: "net", "zero"]) is 7
total-characters([list: "", "a"]) is 1
total-characters([list: ]) is 0
end