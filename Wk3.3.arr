use context starter2024
3.95 <= 10

20 <= 10


fun add-shipping(order-amt :: Number) -> Number:
  doc: "add shipping costs to order total"
  if order-amt <= 10:
    order-amt + 4
  else if (order-amt > 10) and (order-amt <= 30):
    order-amt + 8
  else:
    order-amt + 12
  end
where:
  add-shipping(10) is 10 + 4
  add-shipping(3.95) is 3.95 + 4
  add-shipping(20) is 20 + 8
  add-shipping(10.01) is 10.01 + 8
  add-shipping(30) is 30 + 8
  add-shipping(32) is 32 + 12
end

