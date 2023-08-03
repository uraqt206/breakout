PlayingState = Class { __includes = BaseState }

function PlayingState:enter(params)
  self.paddle = params.choice
  self.ball = params.ball
  self.bricks = params.bricks
  self.ball.dy = math.random(-150, -10)
  self.ball.dx = math.random(-150, 150)
end

function PlayingState:update(dt)
  self.paddle:update(dt)
  self.ball:update(dt)

  if self.ball:collides(self.paddle) then
    self.ball.y = self.paddle.y - 9
    self.ball.dy = -self.ball.dy
    self.ball.dx = math.random(-150, 150)
  end

  for k, v in pairs(self.bricks) do
    if self.ball:collides(v) then
      v.destroy = true
    end
  end
end

function PlayingState:render() 
  self.paddle:render()
  self.ball:render()

  for k, v in pairs(self.bricks) do
    v:render()
  end
end