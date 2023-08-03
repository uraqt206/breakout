Serving = Class { __includes = BaseState }
local paddle
local ball = Ball(1, 0, 0)
local bricks

function Serving:init()
  bricks = LevelMaker:generateBricks()
end

function Serving:enter(_paddle)
  paddle = _paddle
end

function Serving:update(dt)
  paddle:update(dt)
  ball.x = paddle.x + 28
  ball.y = paddle.y - 10

  if love.keyboard.wasPressed('space') then
    gStateMachine:change('playing', {
      choice = paddle, 
      ball = ball, 
      bricks = bricks,
    })
  end
end

function Serving:render()
  paddle:render()
  ball:render()  
  for k, v in pairs(bricks) do
    v:render()
  end
end