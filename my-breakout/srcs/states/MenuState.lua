MenuState = Class { __includes = BaseState }

function MenuState:init()
    self.current = 1
end

function MenuState:update(dt)
    if love.keyboard.wasPressed('up') then
        self.current = math.max(self.current - 1, 1)
    end
    
    if love.keyboard.wasPressed('down') then
        self.current = math.min(self.current + 1, 2)
    end
end

function MenuState:render()
    love.graphics.setFont(gFonts['big'])
    love.graphics.printf('BREAKOUT', 0, VIRTUAL_HEIGHT/2 - 30, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    if self.current == 1 then
        love.graphics.setColor(0/255, 204/255, 204/255, 255/255)
    end
    love.graphics.printf('start game', 0, VIRTUAL_HEIGHT/2 + 75, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(1, 1, 1, 1)

    if self.current == 2 then
        love.graphics.setColor(0/255, 204/255, 204/255, 255/255)
    end
    love.graphics.printf('high score', 0, VIRTUAL_HEIGHT/2 + 95, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(1, 1, 1, 1)
end