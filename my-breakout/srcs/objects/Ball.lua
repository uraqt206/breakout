Ball = Class {}

function Ball:init(skin, x, y)
  self.skin = skin
  self.dx = 0
  self.dy = 0
  self.x, self.y = x, y
end

function Ball:update(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  self.dy = self.dy + self.dy * dt / 100

  if self.x < 0 then
    self.x = 0
    self.dx = -self.dx
    self.dy = math.random(-150, 150) 
  end

  if self.x + 8 > VIRTUAL_WIDTH then
    self.x = VIRTUAL_WIDTH - 8
    self.dx = -self.dx
    self.dy = math.random(-150, 150)
  end

  if self.y < 0 then
    self.y = 0
    self.dy = -self.dy
    self.dx = math.random(-150, 150)
  end
end

function Ball:render()
  love.graphics.draw(gTextures['blocks'], gBalls[self.skin], self.x, self.y)
end

function Ball:collides(stuff)
  if self.x + 8 < stuff.x then
    return false
  elseif self.x > stuff.x + stuff.width then
    return  false
  elseif self.y + 8 < stuff.y then
    return false
  elseif self.y > stuff.y + stuff.height then
    return false
  else
    return true
  end
end
