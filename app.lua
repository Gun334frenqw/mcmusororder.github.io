local lapis = require("lapis")
local app = lapis.Application()

-- Database to store orders
local orders = {}

-- Action to create a new order
app:post("/orders", function(self)
  local order = self.params.order
  table.insert(orders, {text = order, status = "pending"})
  return { redirect_to = "/board" }
end)

-- Action to view orders in the kitchen
app:get("/kitchen", function(self)
  return { render = "kitchen", orders = orders }
end)

-- Action to mark an order as done or delivered
app:post("/kitchen/:id", function(self)
  local id = tonumber(self.params.id)
  local order = orders[id]
  if order then
    order.status = self.params.status
  end
  return { redirect_to = "/kitchen" }
end)

-- Action to view the board
app:get("/board", function(self)
  return { render = "board", orders = orders }
end)

return app
