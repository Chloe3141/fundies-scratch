import file("lab2-support.arr") as support



#Encryptor 1 test 1
support.encryptor1("hello ") # -> Repeats string 5 times


#My version of encryptor 1
fun my-encryptor1(s :: String) -> String:
  doc: "Repeats input string 5 times."
  string-repeat(s, 5)
where:
  my-encryptor1("hi") is "hihihihihi"
  my-encryptor1("1!") is "1!1!1!1!1!"
  my-encryptor1(" ") is "     "
end

my-encryptor1("hello!")
#Am I suposed to do anything with test-encryptor1(my-encryptor1)???







  #Encryptor 2 test 1
support.encryptor2("hello") # -> Returns string minus one character or only as the first 4 characters.

  #Encryptor 2 test 2
  support.encryptor2("hellooo") # -> Returns first four characters


#My version of encryptor 2
fun my-encryptor2(s :: String) -> String:
  doc: "Returns first 4 characters of input string."
  string-substring(s, 0, 4)
where:
  my-encryptor2("000101") is "0001"
  my-encryptor2("    A") is "    "
  my-encryptor2("abcde") is "abcd"
end


my-encryptor2("Hello")







  #Encryptor 3 test 1
  support.encryptor3("hello") # -> Returned the same string. Inconclusive

  #Encryptor 3 test 2
  support.encryptor3("Hello") # -> Returned the same string. Not case sensitive

  #Encryptor 3 test 3
  support.encryptor3("123") # -> Returned the same string. No change with numbers.

  #Encryptor 3 test 4
  support.encryptor3(support.encryptor2("hellooo")) # -> When an encryptor is placed in encryptor 3, returns the inside encryptor.

  #Encryptor 3 test 5
support.encryptor3("Hello.") # -> Returns string with ! instead of .



#My version of encryptor 3
fun
  my-encryptor3(s :: String) -> String:
  doc: "Returns string, but any . is now !"
  string-replace(s, ".", "!")
where:
  my-encryptor3("....") is "!!!!"
  my-encryptor3("abcd") is "abcd"
  my-encryptor3("!!!!") is "!!!!"
end

my-encryptor3("H.e.l.l.o.")








  #Encryptor 4 test 1
  support.encryptor4("hello") # -> Returns string repeated 5 times, but with last character missing or only first 4 characters.

  #Encryptor 4 test 2
support.encryptor4("hellooo") # -> Returns first 4 characters (encryptor 2), then repeats the new string 5 times (encryptor 1).



# My version of encryptor 4
fun
  my-encryptor4(s :: String) -> String:
  doc: "Performs encryption 2 (first 4 characters), then encryption 1 (repeat 5 times), on the string."
  my-encryptor1(my-encryptor2(s))
where:
  my-encryptor4("My name is") is "My nMy nMy nMy nMy n"
  my-encryptor4("!!!!!") is "!!!!!!!!!!!!!!!!!!!!"
end

my-encryptor4("1234567")








  #Encryptor 5 test 1
  support.encryptor5("hello") # -> Returns string with consonants instead of vowels

  #Encryptor 5 test 2
  support.encryptor5("aeiou")
  # a=b, e=f, i=j, o=p, u=v

  #Encryptor 5 test 3
  support.encryptor5("AEIOU")
  # A=B, E=F, I=J, O=P, U=V, case changes
  #It's always the consonant after the vowel with matching case.


# My version of encryptor 5
fun
  my-encryptor5(s :: String) -> String:
  doc: "..."
  e1 = string-replace(s, "a", "b")
  e2 = string-replace(e1, "e", "f")
  e3 = string-replace(e2, "i", "j")
  e4 = string-replace(e3, "o", "p")
  e5 = string-replace(e4, "u", "v")
  e6 = string-replace(e5, "A", "B")
  e7 = string-replace(e6, "E", "F")
  e8 = string-replace(e7, "I", "J")
  e9 = string-replace(e8, "O", "P")
  e10 = string-replace(e9, "U", "V")
  #where:
end
  
  



#|fun
  my-encryptor5(s :: String) -> String:
  doc: "Returns string, but replaces any vowel with following consonant matching the case."
  string-replace
  step1 = (s, "e", "f")
  step2 = (s, "e", "f")
end
string-replace(s, "e", "f")
    else if
    string-replace(s, "i", "j")
    else if
    string-replace(s, "o", "p")
    else if
    string-replace(s, "u", "v")
    else
    string-replace(s, "A", "B")
|#








  #Encryptor 6 test 1
  support.encryptor6("hello") # -> Returns same string. Inconclusive.

  #Encryptor 6 test 2
  support.encryptor6("Hello !") # -> Returns uppercase starting letter as lowercase.

  #Encryptor 6 test 3
  support.encryptor6("HELLO") # -> Returns all uppercase letters as lowercase.



# My version of encryptor 6
fun
  my-encryptor6(s :: String) -> String:
  doc:"Returns string in all uppercase."
  string-to-lower(s)
  where:
    string-to-lower("hello") is "hello"
    string-to-lower("Hello") is "hello"
    string-to-lower("HELLO") is "hello"
    string-to-lower("hello !") is "hello !"
  end

my-encryptor6("IT'S RAINING!!!")








  #Encryptor 7 test 1
support.encryptor7("hello") # -> Returns string length.


# My version of encryptor 7
fun
  my-encryptor7(s :: String) -> Number:
  doc: "Returns string length."
  string-length(s)
where:
  my-encryptor7("hello") is 5
  my-encryptor7("I") is 1
  my-encryptor7("") is 0
end

my-encryptor7(" ! ")








  #Encryptor 8 test 1
  support.encryptor8("hello") # -> Repeats string 3 times with 3 ! in between.


# My version of encryptor 8
fun
  my-encryptor8(s :: String) -> String:
  doc: "Repeats string 3 times with three ! appended to each repeat."
  string-repeat((string-append(s, "!!!")), 3)
where:
  my-encryptor8("A ") is "A !!!A !!!A !!!"
  my-encryptor8("1") is "1!!!1!!!1!!!"
end

my-encryptor8("Hi")








  #Encryptor 9 test 1
  support.encryptor9("hello") # -> Returns number, but based on what?

  #Encryptor 9 test 2
  support.encryptor9("a")

  support.encryptor9("b")

  support.encryptor9("c")

  support.encryptor9("d")

  support.encryptor9("h")

  support.encryptor9("e")

  support.encryptor9("l")

  support.encryptor9("o")

  support.encryptor9("z")
  # -> Returns number associated with first letter of string.
  # a = 97, z = 122


  #Encryptor 9 test 3
  support.encryptor9("1")

  support.encryptor9("2")

  support.encryptor9("9")
  # -> Returns number associated with the character.
  # 1 = 49, 9 = 57


  #Encryptor 9 test 4
  support.encryptor9("É") # -> Looking at a unicode table, returns number associated with first character of the string.



# My version of encryptor 9
fun
  my-encryptor9(s :: String) -> Number:
  doc: "Returns the unicode number for the first character."
  string-to-code-point(string-substring(s, 0, 1))
where:
  my-encryptor9("abc") is 97
  my-encryptor9("É") is 201
end

my-encryptor9("Éh!")
my-encryptor9("oiseau")
  







  #Encryptor 10 test 1
  support.encryptor10("hello")
  # Repeats string 5 times (encryptor 1), replaces vowel with following consonant and matches case (encryptor 5), and only returns the first 4 characters (encryptor 2)


#| My version of encryptor 10
fun
  my-encryptor10(s :: String) -> String:
  doc: "Replaces vowels with the following consonant while matching their case, then takes the first 4 characters of the string, and returns them repeated 5 times as a new string."
  my-encryptor1(my-encryptor2(my-encryptor5(s)))
where:
|#