include image

#|fun
  multi-flag(a :: String, b :: String, m :: String, c :: String, d :: String) -> Image:
   doc:"Produces a flag with 6 horizontal stripes."
   above(above(above(above((rectangle(150, 20, "solid", a)), rectangle(150, 20, "solid", b)), rectangle(150,20, "solid", m)), rectangle(150, 20, "solid", c)), rectangle(150, 20, "solid", d))
end

multi-flag("red", "orange", "white", "pink", "purple")

fun
  two-half-flag(a, b, c):
  above(rectangle(150, 50, "solid", a),
    above(rectangle(150, 10, "solid", b), rectangle(150, 50, "solid", c)))
end


two-half-flag("pink", "purple", "blue")
|#





#|fun
L-flag(c1, c2, c3, c4, c5, c6, c7) -> Image:
  doc: "Produces L flag."
  above(
rectangle(150, 20, "solid", c1),
above(
rectangle(150, 20, "solid", c2),
above(
rectangle(150, 20, "solid", c3),
above(
rectangle(150, 20, "solid", c4),
above(
rectangle(150, 20, "solid", c5),
above(
rectangle(150, 20, "solid", c6),
rectangle(150, 20, "solid", c7)
)
)
)
)
)
)
end


L-flag("red", "orange", "yellow", "white", "pink", "magenta", "maroon")

|#