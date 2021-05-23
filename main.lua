
    local utf8 = require("utf8")

function love.load()
    text = " "

    textx = 0
    texty = 130

    love.keyboard.setKeyRepeat(true)

end

function love.textinput(t)
    text = text .. t
end

function love.keypressed(key)
    if key == "backspace" then
        local byteoffset = utf8.offset(text, -1)

        if byteoffset then
            text = string.sub(text, 1, byteoffset - 1)
            end   
        end
        if key == "down" then
            textx = 0
            texty = texty + 5 
         end
         if key == "up" then
            textx = 0
            texty = texty - 5 
         end
end


function love.update()
    if texty < 130 then
        texty = 130
    end
    if texty > 450 then
        texty = 450
    end
end

function love.draw()
    love.graphics.print("Skriv saker:", 100, 85)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle( "fill", 0, 100, 800, 400 )
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 125, 800, 350)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(text, textx, texty, love.graphics.getWidth())
end





