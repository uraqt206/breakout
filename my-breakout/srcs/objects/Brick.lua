Brick = Class {}

function Brick:init(skin, tier, x, y)
  self.skin = skin
  self.tier = tier
  self.width = 32
  self.height = 16
  self.x, self.y = x, y
  self.destroy = false
end

function Brick:render()
  if not self.destroy then
    love.graphics.draw(gTextures['blocks'], gBricks[self.skin * 4 + self.tier], self.x, self.y)
  end
end