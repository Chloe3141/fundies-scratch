use context starter2024
include image

# weight is a name.
#Read as: 'weight is defined as 70'.
weight = 70 # This complete statement is a definition.

height-a = 170

# Below is an exression; code that computes something.
#bmi = weight * height

# Lists are used for efficiency with large amounts of data.
#height-list = [160, 170, 155, 188, 190, 130, 150]

# Statement is code that unstructs rather than computes.
# For example, a definition is a statement.


#define width & height
rect-width = 120
rect-height = 40


flag-before = above(rectangle(rect-width, rect-height, "solid", "red"), rectangle(rect-width, rect-height, "solid", "green"))

flag-before

# class exercises
orange-triangle = triangle(35, "solid", "orange")

long = 40
color = "blue"

defined-square = square(long, "solid", color)
reg-square = square(40, "solid", "blue")

check "same image, different code":
  defined-square is reg-square
end
# Above code used to check if both codes are the same.


#fun
# flag-before(width :: num) -> Image
# doc: "Creates a flag with 2 horizontal stripes."
#where:

cir = circle(5, "solid", "yellow")

rect = rectangle(40, 30, "solid", "black")

overlay(cir, rect)

overlay(beside(cir, cir), rect)


fun
  vert-3-flag(L :: String, M :: String, R :: String):
  doc: "Produces image of a flag with 3 vertical stripes of equal width."
  frame(
    beside(rectangle(40, 80, "solid", L),
      beside(rectangle(40, 80, "solid", M),
        rectangle(40, 80, "solid", R))))
end

vert-3-flag("blue", "white", "red")



fun
  horz-3-flag(top :: String, mid :: String, bot :: String):
  doc: "Produces image of a flag with 3 horizontal stripes of equal height."
  frame(
    above(rectangle(120, 26.67, "solid", top),
      above(rectangle(120, 26.67, "solid", mid),
        rectangle(120, 26.67, "solid", bot))))
end

horz-3-flag("red", "white", "blue")


frame(
  above(rectangle(120, 4.9, "solid", "red"),
    above(rectangle(120, 4.9, "solid", "white"),
      above(rectangle(120, 4.9, "solid", "red")
        
        above(rectangle(120, 4.9, "solid", "white"),
          above(rectangle(120, 4.9, "solid", "red"),
            above(rectangle(120, 4.9, "solid", "white"),
              above(rectangle(120, 4.9, "solid", "red"),
                above(rectangle(120, 4.9, "solid", "white"),
                  above(rectangle(120, 4.9, "solid", "red"),
                    above(rectangle(120, 4.9, "solid", "white"),
                      above(rectangle(120, 4.9, "solid", "red"),
                        above(rectangle(120, 4.9, "solid", "white"),
                          above(rectangle(120, 4.9, "solid", "red")))))))))))))))