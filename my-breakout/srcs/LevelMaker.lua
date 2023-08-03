LevelMaker = Class {}

local numRow = 3
local numCol = 12

function LevelMaker:generateBricks()
  local bricks = {}
  local cnt = 0
  local x = 10
  local y = 10

  for i = 0, numRow-1 do
    x = 20
    for j = 0, numCol-1 do
      cnt = cnt + 1
      bricks[cnt] = Brick(0, 1, x, y)
      x = x + 32 + 1
    end
    y = y + 16 + 1
  end

  return bricks
end