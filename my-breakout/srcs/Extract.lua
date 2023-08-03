function getArrows(atlas, width, height)
  quads = {}

  for i = 0, 1 do
    quads[i+1] = love.graphics.newQuad(i * width, 0, width, height,  atlas)
  end

  return quads;
end

function getPaddles(atlas)
  quads = {}
  local cnt = 0
  local x = 0
  local y = 64

  for i = 1, 4 do
    quads[cnt+1] = love.graphics.newQuad(x,      y, 32, 16, atlas)
    quads[cnt+2] = love.graphics.newQuad(x + 32, y, 64, 16, atlas)
    quads[cnt+3] = love.graphics.newQuad(x + 96, y, 96, 16, atlas)
    quads[cnt+4] = love.graphics.newQuad(x, y + 16, 128, 16, atlas)

    y = y + 32
    cnt = cnt + 4
  end

  return quads
end

function slice(tbl, left, right)
  local ans = {}

  for i = left, right do
    ans[i] = tbl[i]
  end

  return ans;
end

function getBricks(atlas, width, height)
  local quads = {}
  local img_width = atlas:getWidth()
  local img_height = atlas:getHeight()

  local cnt = 0
  for i = 0, 3 do
    for j = 0, 5 do
      cnt = cnt + 1
      quads[cnt] = love.graphics.newQuad(i * width, j * height, width, height, atlas)
    end
  end 

  return slice(quads, 1, 21)
end

function getBalls(atlas, width, height)
  local quads = {}
  local cnt = 0
  local x = 3 * 32
  local y = 3 * 16

  for i = 0, 3 do
    cnt = cnt + 1
    quads[cnt] = love.graphics.newQuad(x + i * width, y, width, height, atlas)
  end

  y = y + height
  for i = 0, 2 do
    cnt = cnt + 1
    quads[cnt] = love.graphics.newQuad(x + i * width, y, width, height, atlas)
  end

  return quads
end