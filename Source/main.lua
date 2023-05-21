import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "var"

local gfx = playdate.graphics
local lume = import "lume"


-- setting up visual novel stuff (pretty hacked together) --
font = gfx.getFont()
fontBold = gfx.getFont("bold")
fontHeight = font:getHeight()




--wrapText(textList,372,font)

name = textList[1]
dio = textList[2]
wid = fontBold:getTextWidth(name)
nameBoxImage = gfx.image.new(wid+4,fontHeight+4,gfx.kColorClear)
gfx.pushContext(nameBoxImage)
    playdate.graphics.setColor(playdate.graphics.kColorWhite)
    gfx.fillRect(0,0,wid+4,fontHeight+4)
    playdate.graphics.setColor(playdate.graphics.kColorBlack)
    gfx.drawText("*"..name.."*",2,4)
gfx.popContext()
nameBoxSprite = gfx.sprite.new(nameBoxImage)
nameBoxSprite:moveTo((wid/2)+16,178)
nameBoxSprite:setZIndex(32766)
nameBoxSprite:add()


dioBoxImage = gfx.image.new(396,fontHeight*2+10,gfx.kColorClear)
gfx.pushContext(dioBoxImage)
    playdate.graphics.setColor(playdate.graphics.kColorWhite)
    gfx.fillRoundRect(0,0,396,fontHeight*2+10,10)
    playdate.graphics.setColor(playdate.graphics.kColorBlack)
    gfx.drawText(dio,14,6)
gfx.popContext()
dioBoxSprite = gfx.sprite.new(dioBoxImage)
dioBoxSprite:moveTo(200,210)
dioBoxSprite:setZIndex(32766)
dioBoxSprite:add()

alpha = 0
duration = 500
animator = nil --playdate.graphics.animator.new(-1, 0, 0)

startScreen = gfx.image.new("start")

-- main update function --
function playdate.update()
    if not started then
        startScreen:draw(0,0)
        if playdate.buttonJustPressed(playdate.kButtonA) then
            started = true
            startGame()
        end
    else
    --progress text
    if playdate.buttonJustPressed(playdate.kButtonA) or playdate.getCrankChange() > 2.0 then
        count += 2
        if count > #textList then
            count -= 2
        end
        progressText(textList[count],textList[count+1])
    end

    --reverse text
    if playdate.buttonJustPressed(playdate.kButtonB) or playdate.getCrankChange() < -2.0 then
        count -= 2
        if count < 0 then --or count < min_count then
            count += 2
        end
        -- if get to event, revert all events until you get to previous text --
        while textList[count] == "event" do
            reverseEvent(textList[count],textList[count+1])
            count -= 2
        end
        progressText(textList[count],textList[count+1])
    end
    
    -- move sprites (may need to be updated if you want to add more sprites) --
    -- could make better with For Loop but too lazy --
    --[[
    moveX, moveY = wolf_sprite:getPosition()
    lerpX = math.floor(lume.lerp(moveX,wolf_sprite.posX,0.1)/2.0)*2.0
    wolf_sprite:moveTo(lerpX, moveY)
    moveX, moveY = manatee_sprite:getPosition()
    lerpX = math.floor(lume.lerp(moveX,manatee_sprite.posX,0.1)/2.0)*2.0
    manatee_sprite:moveTo(lerpX, moveY)
    ]]--

    local sprites = gfx.sprite.getAllSprites()
    for s=1, #sprites do
        if sprites[s].isChar then
            moveX, moveY = sprites[s]:getPosition()
            lerpX = math.floor(lume.lerp(moveX,sprites[s].posX,0.1)/2.0)*2.0
            sprites[s]:moveTo(lerpX,moveY)
        end
    end

    -- background transitions --
    if animator ~= nil and not animator:ended() then
        bg_image = gfx.image.new(400,240)
        gfx.pushContext(bg_image)
            image1:draw(0,0)
            alpha = animator:currentValue()
            gfx.setStencilPattern(alpha, gfx.image.kDitherTypeBayer2x2)
            image2:draw(0,0)
        gfx.popContext()
        bg_sprite:setImage(bg_image)
    end


    gfx.sprite.update()
    

    --playdate.drawFPS(0,0)


end
end

-- change sprite image function --
function setSpriteImage(sprite,image)
    sprite:setImage(gfx.image.new(image))
end

-- unused, will be removed
function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

-- progress text function (very convoluted but it works) --
function progressText(name,text)
    if name == "event" then
        count += 1
        if textList[count][1] == "move" then
            if eventSave[count] == nil then
                eventSave[count] = textList[count][2].posX
            end
            textList[count][2].posX = textList[count][3]
        elseif textList[count][1] == "bg" then
            if eventSave[count] == nil then
                eventSave[count] = bg_sprite.image
            end
            image1 = bg_sprite:getImage()
            bg_sprite.image = textList[count][2]
            image2 = gfx.image.new(textList[count][2])
            animator = playdate.graphics.animator.new(textList[count][3], 0, 1)
        elseif textList[count][1] == "change" then
            if eventSave[count] == nil then
                eventSave[count] = textList[count][2].image
            end
            setSpriteImage(textList[count][2],textList[count][3])
            textList[count][2].image = textList[count][3]
        elseif textList[count][1] == "music" then
            if eventSave[count] == nil then
                eventSave[count] = musicFile
            end
            musicFile = textList[count][2]
            musicSample = playdate.sound.sample.new(musicFile)
            musicObject:setSample(musicSample)
            musicObject:play(0)
        
        elseif textList[count][1] == "sound" then
            soundObject:setSample(textList[count][2])
            soundObject:play()
        end
        count += 1
        progressText(textList[count],textList[count+1])

    else
        if name ~= "nar" then
        nameBoxSprite:setVisible(true)
        wid = fontBold:getTextWidth(name)
        nameBoxImage = gfx.image.new(wid+4,fontHeight+4,gfx.kColorClear)
        gfx.pushContext(nameBoxImage)
            playdate.graphics.setColor(playdate.graphics.kColorWhite)
            gfx.fillRect(0,0,wid+4,fontHeight+4)
            playdate.graphics.setColor(playdate.graphics.kColorBlack)
            gfx.drawText("*"..name.."*",2,4)
        gfx.popContext()
        nameBoxSprite:moveTo((wid/2)+12,176)
        nameBoxSprite:setImage(nameBoxImage)
        else
            nameBoxSprite:setVisible(false)
        end


        dioBoxImage = gfx.image.new(396,fontHeight*2+10,gfx.kColorClear)
        gfx.pushContext(dioBoxImage)
            playdate.graphics.setColor(playdate.graphics.kColorWhite)
            gfx.fillRoundRect(0,0,396,fontHeight*2+10,10)
            playdate.graphics.setColor(playdate.graphics.kColorBlack)
            gfx.drawText(wrapText(text,370,font),14,6)
        gfx.popContext()
        dioBoxSprite:setImage(dioBoxImage)
    end
end


-- reverse events function --
function reverseEvent(name,text)
count += 1
if textList[count][1] == "move" then
    textList[count][2].posX = eventSave[count]
elseif textList[count][1] == "bg" then
    --animator = playdate.graphics.animator.new(0, 1, 1)
    image2 = gfx.image.new(eventSave[count])
    setSpriteImage(bg_sprite,eventSave[count])
    bg_sprite.image = eventSave[count]
elseif textList[count][1] == "change" then
    setSpriteImage(textList[count][2],eventSave[count])
elseif textList[count][1] == "music" then
    
    musicFile = eventSave[count]
    musicSample = playdate.sound.sample.new(musicFile)
    musicObject:setSample(musicSample)
    musicObject:play(0)
end
count += 1
count -= 2
end

function wrapText(line, width, font)
    font = font or gfx.getFont()
    local currentWidth, currentLine = 0, ""
    if line == "" or font:getTextWidth(line) <= width then
        return line
    else
    newLine = ""
    for word in line:gmatch("%S+") do
        if (font:getTextWidth(currentLine) + font:getTextWidth(word)) > width then
            newLine = newLine .. "\n" .. word .. " "
            currentLine = ""
        else
            newLine = newLine .. word .. " "
            currentLine = currentLine .. word .. " "
        end
    end
    return newLine
    end
end