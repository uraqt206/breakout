require 'srcs/libraries'

function love.load() 
    love.window.setTitle('breakout')

    love.graphics.setDefaultFilter('nearest', 'nearest')

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
    })

    gTextures = {
        ['arrows'] = love.graphics.newImage('graphics/arrows.png'),
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['blocks'] = love.graphics.newImage('graphics/blocks.png'),
        ['breakout'] = love.graphics.newImage('graphics/breakout.png'),
        ['hearts'] = love.graphics.newImage('graphics/hearts.png'),
        ['particle'] = love.graphics.newImage('graphics/particle.png'),
        ['ui'] = love.graphics.newImage('graphics/ui.png'),
    }

    gSounds = {
        ['brick-hit-1'] = love.audio.newSource('sounds/brick-hit-1.wav', 'static'),
        ['brick-hit-2'] = love.audio.newSource('sounds/brick-hit-2.wav', 'static'),
        ['confirm'] = love.audio.newSource('sounds/confirm.wav', 'static'),
        ['high_score'] = love.audio.newSource('sounds/high_score.wav', 'static'),
        ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),
        ['music'] = love.audio.newSource('sounds/music.wav', 'static'),
        ['no-select'] = love.audio.newSource('sounds/no-select.wav', 'static'),
        ['paddle_hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['pause'] = love.audio.newSource('sounds/pause.wav', 'static'),
        ['recover'] = love.audio.newSource('sounds/recover.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['select'] = love.audio.newSource('sounds/select.wav', 'static'),
        ['victory'] = love.audio.newSource('sounds/victory.wav', 'static'),
        ['wall_hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
    }
    
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['big'] = love.graphics.newFont('fonts/font.ttf', 32),
    }

    gStateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
    }
    gStateMachine:change('menu')

    love.keyboard.keysPressed = {}
end

function love.resize(w, h) 
    Push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'backspace' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw() 
    Push:start()
    
    local BG_WIDTH = gTextures['background']:getWidth()
    local BG_HEIGHT = gTextures['background']:getHeight()
    love.graphics.draw(gTextures['background'], 0, 0, 0, VIRTUAL_WIDTH / BG_WIDTH + 0.5, VIRTUAL_HEIGHT / BG_HEIGHT + 0.5)
    gStateMachine:render()

    Push:finish()
end