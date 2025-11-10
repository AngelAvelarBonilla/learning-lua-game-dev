local Circle = Class:extend()

function Circle:new(x, y, radius)
  self.creation_time = love.timer.getTime()
  self.x = x
  self.y = y
  self.radius = radius
end

function Circle:update(dt)
end

function Circle:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Circle
