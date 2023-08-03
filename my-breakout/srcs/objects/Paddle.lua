Paddle = Class{}

function Paddle:init() 
  self.x = VIRTUAL_WIDTH/2 - 32
  self.y = VIRTUAL_HEIGHT - 30
  self.dx = 0
  self.current = 0
  self.tier = 2
  self.width = gLens[self.tier]
  self.height = 16
end

function Paddle:update(dt)
  if love.keyboard.isDown('a') then
    self.dx = -PADDLE_SPEED
  elseif love.keyboard.isDown('d') then
    self.dx = PADDLE_SPEED
  else
    self.dx = 0
  end

  self.x =  self.x + self.dx * dt

  if self.x < 0 then
    self.x = 0
  end

  if self.x + gLens[self.tier] > VIRTUAL_WIDTH then
    self.x = VIRTUAL_WIDTH - gLens[self.tier]
  end
end

function Paddle:render() 
  love.graphics.draw(gTextures['blocks'], gPaddle[self.current * 4 + self.tier], self.x, self.y)
end