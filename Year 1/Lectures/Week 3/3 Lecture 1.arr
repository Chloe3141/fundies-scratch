use context starter2024
check:
  true is true
  not(true) is false
  
  #and
  true and true is true
  false and true is false
  false and false is false
  (3 > 1) and ((4 * 2) == 8) is true
  (5 < 3) and ((2 + 3) == 5) is false
  
  #or
  true or false is true
  false or false is false
  ((3 * 7) == 21) or ("a" == "b") is true
  
end


#Two types of errors
# syntax errors -> error reads, no output generated
# logical errors are more complicated to locate so we debug using spy...


fun
  choose-hat-debug(temp-in-C :: Number) -> String:
  doc: "Determines appropraite headgear, with above 27C a sun hat, below, nothing."
  spy:
    temp-in-C,
    comparison: temp-in-C > 27
  end
  if
    temp-in-C >= 27:
    #adding the = sign in both comparison and if makes it pass the tests.
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat-debug(25) is "no hat"
  choose-hat-debug(35) is "sun hat"
  choose-hat-debug(27) is "sun hat"
end


#|
  The full design recipe:
 Four steps in this order, write the code last.
   1. Type annotation: what types of input and outputs are expected
   
   2. Doc string: one sentence explaining purpose of function
   
   3. Examples: concrete input/output pairs in a where: block
   
   4. Code: the body, written last
|#




#if/else and ask expressions

#|
if x == 0:
  1
else if x > 0:
  x * 2
else:
  x * -1
end
|#



#ask expression

#|
ask:
  | x == 0 then: 1
  | x > 0 then: x * 2
  | otherwise: x * -1    
end
|#
   
#Example of ask expression

fun grade(marks :: Number) -> String:
  doc: "Returns the letter grade for a mark out of 100."
  
  if marks >= 90:
    "A"
  else if marks >= 80:
    "B"
  else if marks >= 70:
    "C"
  else if marks >= 60:
    "D"
  else:
    "F"
  end
  
where:
  grade(95) is "A"
  grade(85) is "B"
  grade(75) is "C"
  grade(65) is "D"
  grade(45) is "F"
  #The boundaries:
  grade(90) is "A"
  grade(60) is "D"
  grade(59) is "F"
  grade(100) is "A"
  grade(0) is "F"
end





fun grade2(marks :: Number) -> String:
  doc: "Returns the letter grade for a mark out of 100."
 
  ask:
| marks >= 90 then: "A"
| marks >= 80 then: "B"
| marks >= 70 then: "C"
| marks >= 60 then: "D"
| otherwise: "F"
  end
  
where:
  grade2(95) is "A"
  grade2(85) is "B"
  grade2(75) is "C"
  grade2(65) is "D"
  grade2(45) is "F"
  #The boundaries:
  grade2(90) is "A"
  grade2(60) is "D"
  grade2(59) is "F"
  grade2(100) is "A"
  grade2(0) is "F"
end