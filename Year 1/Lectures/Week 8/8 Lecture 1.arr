use context dcic2024

#|
   Selection: a list with only some of the elements
   Relaxed Domain: an answer for most lists, and an error for the rest
   Accumulator: needs a memory of what came before
|#


#_________________________________________________#



#selection by value: the hot days
week-temps = [list: 28, 31, 34, 29, 30, 26, 32]
co2 = [list: 411.65, 414.21, 416.41, 418.53, 421.08, 424.61, 427.35]

fun hot-days(temps :: List<Number>) -> List<Number>:
  doc: "Keeps temps of 30 or more"
  cases (List) temps:
    | empty => empty
    | link(f, r) =>
      if f >= 30:
        link(f, hot-days(r))
      else:
        hot-days(r)
      end
  end
where:
  hot-days(week-temps) is [list: 31, 34, 30, 32]
  hot-days([list: 29, 25]) is [list: ]
  hot-days([list: ]) is [list: ]
end



#selection by position: how much did co2 rise each year?

fun yearly-rise(levels :: List<Number>) -> List<Number>:
  doc: "How much each level rose from the one before it."
  cases (List) levels:
    | empty => empty
    | link(f, r) =>
      cases (List) r:
        | empty => empty
        | link(next-year, rest) => link(next-year - f, yearly-rise(r))
      end
  end
where:
  yearly-rise([list: 411.65, 414.21, 416.41]) is [list: 2.56, 2.2]
  yearly-rise([list: 400]) is [list: ]
  yearly-rise([list: ]) is [list: ]
  yearly-rise([list: 5, 6, 8, 14, 10]) is [list: 1, 2, 6, -4]
end



#_________________________________________________#


#Relaxed Domain: find the hottest day

fun hottest(temps :: List<Number>) -> Number:
  doc: "highest temp in a list; not defined for an empty list"
  cases (List) temps:
    | empty => raise("no temperatures given")
    | link(f, r) =>
      cases (List) r:
        | empty => f
        | else => num-max(f, hottest(r))
      end
  end
where:
  hottest(week-temps) is 34
  hottest([list: -3, -1, -5]) is -1
  hottest([list: ]) raises "no temperatures given"
  hottest([list: 15]) is 15
  hottest(empty) raises "no temperatures given"
end



#________________________________________________#

#an accumulator

fun rain-acc(total :: Number, days :: List<Number>) -> List<Number>:
  doc: "running totals of days begginning from total"
  cases (List) days:
    | empty => empty
    | link(f, r) =>
      new-total = total + f
      link(new-total, rain-acc(new-total, r))
  end
end



fun rain-so-far(days :: List<Number>) -> List<Number>:
  doc: "rain in mm at end of each day"
  rain-acc(0, days)
where:
  rain-so-far([list: 2, 0, 5, 1]) is [list: 2, 2, 7, 8]
  rain-so-far([list: ]) is [list: ]
  rain-so-far([list: 5]) is [list: 5]
end



#___________________________________________________#

#Class exercises:
#|
   Selection
Write a function called more-than-five which given a list of strings, creates a new list that contains only the elements with more than five characters
|#

fun more-than-five(l :: List<String>) -> List<String>:
  doc: "takes a list of strings and only returns elements over 5 characters"
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if string-length(f) > 5:
        link(f, more-than-five(r))
        else:
        more-than-five(r)
      end
  end
where:
  more-than-five([list: "Hello", "my", "name is", "Jacoby"]) is [list: "name is", "Jacoby"]
  more-than-five([list: ]) is [list: ]
end
   



#|
   Relaxed Domains
Create a function called my-average that combines the my-len and my-sum functions from the last lecture. Develop your examples and raise an error when you encounter an empty list. (See 5.2.7.1 my-avg ExamplesLinks to an external site.)
|#
fun my-average() -> :
  doc: "..."
  cases () :
    | empty => raise("error: empty list")
    | link(f, r) =>
      cases
   
   
   

#|
   Accumulators
Define a my-max function using an accumulator
Define a my-alternating function using an accumulator
|#