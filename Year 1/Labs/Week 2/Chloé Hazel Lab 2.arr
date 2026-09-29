import file("lab2-support.arr") as support

#Encryptor 1 test 1
support.encryptor1("hello ") # -> Repeats string 5 times




#Encryptor 2 test 1
support.encryptor2("hello") # -> Returns string minus one character or only as the first 3 characters.

#Encryptor 2 test 2
support.encryptor2("hellooo") # -> Returns first four characters




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




#Encryptor 4 test 1
support.encryptor4("hello") # -> Returns string repeated 5 times, but with last character missing or only first 3 characters.

#Encryptor 4 test 2
support.encryptor4("hellooo") # -> Returns string repeated 5 times, with only first 3 characters.




#Encryptor 5 test 1
support.encryptor5("hello") # -> Returns string with consonants instead of vowels

#Encryptor 5 test 2
support.encryptor5("aeiou")
# a=b, e=f, i=j, o=p, u=v

#Encryptor 5 test 3
support.encryptor5("AEIOU")
# A=B, E=F, I=J, O=P, U=V, case changes
#It's always the consonant after the vowel with matching case.



#Encryptor 6 test 1
support.encryptor6("hello") # -> Returns same string. Inconclusive.

#Encryptor 6 test 2
support.encryptor6("Hello !") # -> Returns uppercase starting letter as lowercase.

#Encryptor 6 test 3
support.encryptor6("HELLO") # -> Returns all uppercase letters as lowercase.




#Encryptor 7 test 1
support.encryptor7("hello") # -> Returns string length plus one. (0 to 4) + 1 = 5




#Encryptor 8 test 1
support.encryptor8("hello") # -> Repeats string 3 times with 3 ! in between.




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




#Encryptor 10 test 1
support.encryptor10("hello")
# Repeats string 5 times (encryptor 1), replaces vowel with following consonant and matches case (encryptor 5), and only returns the first 4 characters (encryptor 2)









# 9 look at documentation for string to code, unicode?

#not code to string, string to code


#10 do everything you've done in the others, in one encryptor.



#string sub-string, place inside repeat??



#for encryptors that combine actions of multiple encryptors, put one encryptor on the outside for the function and put the other on the inside, or a function on the inside?