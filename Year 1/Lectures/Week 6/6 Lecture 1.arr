use context dcic2024

#|
data name:
   constructor *used to call function* (data-types/type annotation)
   end
|#

data My-Post:
    post(username :: String, caption :: String, likes :: Number, shares :: Number)
end


post-1 = post("@climate_now", "Arctic sea ice hits a record low", 1250, 340)
post-2 = post("@cityfarm", "Our rooftop garden this week", 84, 4)
post-3 = post("@nu_london", "Welcome to week 6!", 410, 12)

feed :: List<My-Post> = [list: post-1, post-2, post-3]

"Line 20"
feed

# Number of likes for post-1
post-1.likes


# Username of post-2
post-2.username


#How many posts in the feed/how to check the length
feed.length()










#Functions over a Post
fun engagement(p :: My-Post) -> Number:
  doc: "Likes + shares for a post."
  p.likes + p.shares
where:
  engagement(post-1) is 1590
  engagement(post("@hello", "hello this is James Bond", 0, 0)) is 0
end



fun is-viral(p :: My-Post) -> Boolean:
  doc: "When a post has more than 1000 likes."
  p.likes > 1000
where:
  is-viral(post-1) is true
  is-viral(post-2) is false
  is-viral(post("@JamesBond", "Hello, my name is James Bond", 1000, 50)) is false
end












#Conditional data

#priority: variants with no fields

data Priority:
  | low
  | medium
  | high
end

task-1-priority = low
task-2-priority = medium
task-3-priority = high

check:
  is-Priority(task-1-priority) is true
  is-low(task-1-priority) is true
  is-medium(task-3-priority) is false
  is-high(task-3-priority) is true
end


#task: variants with fields
data Task:
  | task(description :: String, priority :: Priority)
  | note(description :: String)
end


task-1 = task("Buy groceries", high)
task-2 = task("Pay council task", high)
note-1 = note("PDI exam is on October 30th")


"Line 108"
task-1.priority
note-1.description
is-task(task-1)
is-note(task-1)




#describe
#cases is an alternative to if
fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p) => "TASK: " + d
    | note(d) => "NOTE: " + d
  end
end

#The task(d, p) pattern must have 1 name per field, in order.
#The note branch has one name because note has one field.

"Line 129"
describe(task-1)
describe(note-1)


#####MIGHT BE ON EXAM####
#DO READING AND COMPLETE EXERCISES!!!!!#
fun is-urgent(t :: Task) -> Boolean:
  doc: "True for a task with high priority; notes are never urgent."
  cases (Task) t:
    | task(d, p) => is-high(p)
    | else => false
  end
where:
  is-urgent(task-2) is true
  is-urgent(task-1) is true
  is-urgent(note-1) is false
end




# a variant with no branch
fun describe-again(t :: Task) -> String:
  cases (Task) t:
    | task(d, p) => "Task: " + d
  end
end
#Can't be executed with a note because there is no branch with what to do with note.
"Line 158"
describe-again(task-1)
