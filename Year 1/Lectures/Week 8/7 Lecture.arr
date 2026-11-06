#Need to change context!!!
#|
   fun f(fp :: Footprint) -> ...
   cases (Footprint) fp:
   | split(name, left, right) => ... f(left)... f(right)...
   | activity (name, kg) => ....
|#

data Footprint: 
  | split(name :: String, left :: Footprint, right :: Footprint)
  | activity(name :: String, kg :: Number)
end

car = activity("car", 900)
flights = activity("flight", 1500)
heating = activity("heating", 1100)

travel = split("travel", car, flights)

my-footprint = split("my year", travel, heating)

travel
my-footprint


#Total CO2
fun total-CO2(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name :: String, left :: Footprint, right :: Footprint) => total-CO2(left) + total-CO2(right)
    | activity(name, kg) => kg
  end
where:
  total-CO2(car) is 900
  total-CO2(my-footprint) is 3500
end




#Compute number of splits
fun count-splits(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => 1 + count-splits(left) + count-splits(right)
    | activity(name, kg) => 0
  end
where:
  count-splits(car) is 0
  count-splits(my-footprint) is 2
  count-splits(travel) is 1
end





#Compute only one side
fun total-CO2-left(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => total-CO2-left(left)
    | activity(name, kg) => kg
  end
end

check "only left-most activity is counted":
  total-CO2-left(car) is 900
  total-CO2-left(my-footprint) is 900
end




fun total-CO2-right(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => total-CO2-right(right)
    | activity(name, kg) => kg
  end
end

check "only left-most activity is counted":
  total-CO2-right(car) is 900
  total-CO2-right(my-footprint) is 1100
end






#|
   Class Exercises

Hint: Identify the problem first (is it scalar, transformation, selection etc.)

|#


data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)




#-> Design a function count-streams which counts how many individual streams feed into a river network.

fun count-streams(r :: River) -> Number:
  cases (River) r:
    | merge(width :: Number, left :: River, right :: River) => 1 + count-streams(left) + count-streams(right)
    | stream(flow-rate :: Number) => 0
  end
where:
  count-streams(stream-a) is 0
  count-streams(merge-1) is 1
end





#-> Design a function max-width that finds the maximum width among all merge points in a river network.

#|
   fun max-width(r :: River) -> Number:
  cases (River) r:
    | merge(width :: Number, left :: River, right :: River) => num-max(num-max(width), (num-max(max-width(left)), (max-width(right)))
    | stream(flow-rate :: Number) => 0
  end
where:
  max-width(stream-a) is 0
  max-width(main-river) is 15
  max-width(merge-1) is 12
end
|#





#   -> Design a function widen-river that takes a river network and a number, and returns a new network where every merge point is wider by that amount.

fun widen-river(r :: River, n :: Number) -> River:
  cases (River) r:
    | merge(width :: Number, left :: River, right :: River) => n + width
    | stream(flow-rate :: Number) => stream
  end
where:
  widen-river(merge-1, 3) is merge(15, stream-a, stream-b)
end





#   -> Design a function cap-flow that takes a river network and returns a new network where no stream has flow-rate above a given number (cap any higher values at the given number).

#   -> Design a function has-large-stream that returns true if any stream in the network has flow-rate greater than 5.
