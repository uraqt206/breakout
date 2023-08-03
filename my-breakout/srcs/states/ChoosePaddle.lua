ChoosePaddle = Class { __includes = BaseState }

function ChoosePaddle:init()
  paddle = Paddle()
end

function ChoosePaddle:update(dt)
  if love.keyboard.wasPressed('a') then
    paddle.current = (paddle.current - 1 + 4) % 4
  end

  if love.keyboard.wasPressed('d') then
    paddle.current = (paddle.current + 1) % 4
  end

  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('serving', paddle)
  end
end

function ChoosePaddle:render()
  love.graphics.setFont(gFonts['medium'])
  love.graphics.printf('Choose Your Favorite Color!', 0, VIRTUAL_HEIGHT/2 - 10, VIRTUAL_WIDTH, 'center')
  love.graphics.draw(gTextures['arrows'], gArrows[1], 100, VIRTUAL_HEIGHT - 50)
  love.graphics.draw(gTextures['arrows'], gArrows[2], VIRTUAL_WIDTH - 124, VIRTUAL_HEIGHT - 50)
  paddle:render()
end