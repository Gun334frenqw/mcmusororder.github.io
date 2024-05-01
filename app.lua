-- app.lua
local lapis = require("lapis")
local app = lapis.Application()

-- Initialize empty table to store orders
local orders = {}

-- Define routes
app:get("/", function(self)
  return { orders = orders }
end)


app:get("/mark_done/:index", function(self)
  local index = tonumber(self.params.index)
  if orders[index] then
    orders[index].status = "Done"
  end
  return { redirect_to = self:url_for("index") }
end)

app:get("/kitchen", function(self)
  return { orders = orders }
end)

return app
