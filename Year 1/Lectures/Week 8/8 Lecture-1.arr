data Comment:
    comment(author :: String, text :: String, likes :: Number, replies :: List<Comment>)
end

r1 = comment("@user1", "I am feeling anxious", 4, [list: ]) # Child node
c1 = comment("@user2", "We are about to get our grades", 15, [list: r1]) # Main node

c2 = comment("@user3", "One of the greatest comebacks!!! #GOAT", 30, [list: ])

r2 = comment("@user45", "Today is super cold! Hot chocolate?", 5, [list: ])

r3 = comment("@user65", "I am very happy today", 40, [list: ])

c3 = comment("@user7", "the London weather is not for everyone", 3, [list: r2, r3])

thread = comment("@user54", "Thunderstorm warning for Thursday", 120, [list: c1, c2, c3])

#Replies built first so that there's something to put into comments (bottom-up approach)




fun count-comments-list(cs :: List<Comment>) -> Number:
  doc: "How many comments are in all threads."
  cases (List) cs:
    | empty => 0
    | link(f, r) => count-comments(f) + count-comments-list(r)
  end
end




fun count-comments(c :: Comment) -> Number:
  doc: "How many comments are in the thread."
  1 + count-comments-list(c.replies #| Means go to comment, then replies|#)
where:
  count-comments(r1) is 1
  count-comments(c3) is 3
  count-comments(thread) is 217
end











fun total-likes-list(tl :: List<Comment>) -> Number:
  doc: "How many likes are in all threads."
  cases (List) tl:
    | empty => 0
    | link(f, r) => count-likes(f) + total-likes-list(r)
  end
end






fun count-likes(c :: Comment) -> Number:
  doc: "Counts likes in all threads."
  c.likes + total-likes-list(c.replies)
where:
  count-likes(r1) is 4
  count-likes(c3) is 48
  count-likes(thread) is 217
end










# Which comments got no reply?

fun has-reply(c :: Comments) -> List:
  doc: "Identifies which comments received no reply."
  cases (Comments) c:
    | empty => empty
    | link(f, r) =>
      if replies = " ":
        has-reply(r)
      else if 
        