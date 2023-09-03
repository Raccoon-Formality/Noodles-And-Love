local gfx = playdate.graphics

started = false

-- positions
pos01 = -300
pos0 = -200
posL = 100
posC = 200
posR = 300
pos1 = 600
pos11 = 700

-- sprite images
image_manatee = "images/sprites/manatee/normal"
image_manatee_happy = "images/sprites/manatee/happy"
image_manatee_shock = "images/sprites/manatee/shock"
image_manatee_concern = "images/sprites/manatee/concern"
image_manatee_alt = "images/sprites/manatee/alt-normal"
image_manatee_alt_happy = "images/sprites/manatee/alt-happy"
image_manatee_alt_shock = "images/sprites/manatee/alt-shock"
image_manatee_alt_concern = "images/sprites/manatee/alt-concern"
image_wolf = "images/sprites/wolf/normal"
image_wolf_angry = "images/sprites/wolf/angry"
image_wolf_blush = "images/sprites/wolf/blush"
image_wolf_flushed = "images/sprites/wolf/flushed"
image_wolf_happy = "images/sprites/wolf/happy"
image_wolf_sad = "images/sprites/wolf/sad"
image_wolf_scared = "images/sprites/wolf/scared"
image_wolf_shock = "images/sprites/wolf/shock"
image_wolf_alt = "images/sprites/wolf/alt-normal"
image_wolf_alt_angry = "images/sprites/wolf/alt-angry"
image_wolf_alt_blush = "images/sprites/wolf/alt-blush"
image_wolf_alt_flushed = "images/sprites/wolf/alt-flushed"
image_wolf_alt_happy = "images/sprites/wolf/alt-happy"
image_wolf_alt_sad = "images/sprites/wolf/alt-sad"
image_wolf_alt_scared = "images/sprites/wolf/alt-scared"
image_wolf_alt_shock = "images/sprites/wolf/alt-shock"
image_dragon = "images/sprites/dragon"
image_dragon_angry = "images/sprites/daddy_angy"
image_daddy_happy = "images/sprites/daddy_happy"


-- make images sprites
dragon_sprite = gfx.sprite.new(gfx.image.new(image_dragon_angry))
dragon_sprite.image = image_dragon_angry
dragon_sprite:moveTo(pos01,338)
dragon_sprite.posX = pos01
dragon_sprite.isChar = true
dragon_sprite:add()
wolf_sprite = gfx.sprite.new(gfx.image.new(image_wolf_alt))
wolf_sprite.image = image_wolf_alt
wolf_sprite:moveTo(pos01,338)
wolf_sprite.posX = pos01
wolf_sprite.isChar = true
wolf_sprite:add()
manatee_sprite = gfx.sprite.new(gfx.image.new(image_manatee_happy))
manatee_sprite.image = image_manatee_happy
manatee_sprite:moveTo(pos11,328)
manatee_sprite.posX = pos11
manatee_sprite.isChar = true
manatee_sprite:add()

-- background images
image_background_boba = "images/backgrounds/boba_shop"
image_background_office = "images/backgrounds/office"
image_background_kitchen = "images/backgrounds/kitchen"
image_background_car = "images/backgrounds/car"
image_background_construction = "images/backgrounds/construct"
image_background_bar = "images/backgrounds/bar"

image_background_black = "images/backgrounds/black"

-- background sprite
bg_sprite = gfx.sprite.new(gfx.image.new(image_background_black))
bg_sprite.image = image_background_black
bg_sprite:setZIndex(-32768)
bg_sprite:moveTo(200,120)
bg_sprite:add()

-- music

music_dehumidifier = "music/dehumidifier"
music_office_ambience = "music/office_ambience"
music_morning_ambience = "music/morning"
music_kitchen_ambience = "music/kitchen"
music_restaurant_ambience = "music/restaurant"
music_construct = "music/construct"
music_blank = "music/silent"

musicFile = music_dehumidifier
--musicSample = playdate.sound.sample.new(musicFile)
musicObject = playdate.sound.fileplayer.new(musicFile)



-- sound effects

sound_metal_bar = playdate.sound.sample.new("sounds/metal_bar")
sound_alarm_clock = playdate.sound.sample.new("sounds/alarm_clock")
sound_car_door = playdate.sound.sample.new("sounds/car_door_close")


soundObject = playdate.sound.sampleplayer.new(sound_alarm_clock)

-- font stuff
local fontFam = {
    [playdate.graphics.font.kVariantNormal] = "font/Sasser-Slab",
    [playdate.graphics.font.kVariantBold] = "font/Sasser-Slab-Bold",
    [playdate.graphics.font.kVariantItalic] = "font/Sasser-Slab-Italic"
}

gfx.setFontFamily(gfx.font.newFamily(fontFam))


-- script

--[[
Events:
move sprite - {"move,sprite,posX}
background change - {"bg",image,time}
change sprite image - {"change",sprite,image}
]]--

coWorkerName = "John"
coUpper = string.upper(coWorkerName)
wolfName = "Vincent"
wolfUpper = string.upper(wolfName)

textList = {
"nar","My alarm shakes me awake.",
"nar","God, I don't wanna get out of bed.",
"nar","I know I need to, I have work today",
"nar","on a Saturday.",
"nar","but will they really even miss me there?",
"nar","...",
"nar",coWorkerName.." will have a rough time without me",
"nar","and my boss won't be happy.",
"event",{"move",dragon_sprite,posC},
"DAD","Alright, buddy, I know you like your beauty sleep,",
"DAD","but I'm pretty sure you have work today.",
"nar","fuck",
"YOU","Alright, dad, I will get up soon.",
"event",{"move",dragon_sprite,pos01},
"DAD","You better, I'm not gonna start paying for your gas again.",
"YOU","I know, I know.",
"event",{"bg",image_background_kitchen,1000},
"event",{"music",music_kitchen_ambience},
"nar","I slowly roll out of bed and head down to the kitchen.",
"nar","Like the turtle I am without my coffee.",
"nar","I shove a bagel into the toaster and make myself an iced coffee",
"nar","with a little creme and sugar, just the way I like it.",
"nar","I take a sip and wait for my bagel to toast.",
"event",{"move",dragon_sprite,posC},
"nar","Dad walks over and starts to brew some hot coffee.",
"nar","He throws some bacon and eggs into a pan.",
"nar","I take my bagel out and put some cream cheese on it.",
"nar","We stand around and have breakfast in silence.",
"DAD","So..",
"event",{"change",dragon_sprite,image_daddy_happy},
"DAD","When are you moving out?",
"YOU","Daddd",
"nar","He asks me this every morning.",
"YOU","I've got a year or so of college left,",
"YOU","then hopefully with my savings I can move out and find a job.",
"event",{"change",dragon_sprite,image_dragon},
"DAD","That long, eh?",
"DAD","Six whole years of college",
"YOU","Yep, that long.",
"YOU","It was hard to figure out what I want to do.",
"nar","I know he's joking around, but it's too early in the morning for this.",
"DAD","When are you getting home tonight?",
"YOU","I dunno, around five I guess.",
"YOU","Why?",
"event",{"change",dragon_sprite,image_daddy_happy},
"DAD","I've got a date night.",
"YOU","Oh, good for you.",
"nar","He clears his throat.",
"YOU","oh.",
"YOU","You wanna have it here?",
"YOU","and you want me to get lost as to not ruin the mood?",
"event",{"change",dragon_sprite,image_dragon},
"DAD","Well, I think I might've phrased it more gently than that.",
"event",{"change",dragon_sprite,image_daddy_happy},
"DAD","but yes.",
"event",{"change",dragon_sprite,image_dragon},
"YOU","It's not much of a date night if you don't go out.",
"YOU","Also, 5PM isn't really what I'd call 'night'.",
"DAD","Look.",
"DAD","We are both old men,",
"DAD","we want to drink booze after a hard day at work and go to sleep by nine.",
"nar","I roll my eyes.",
"YOU","Fine.",
"YOU","I'll go get high in the park",
"YOU","or maybe I'll find a friend to have a movie night with.",
"DAD","That's my boy.",
"event",{"move",dragon_sprite,pos11},
"DAD","Alright, I gotta go, have good day at work. Love you bye.",
"YOU","bye.",
"nar","fuck",
"event",{"bg",image_background_boba,1000},
"nar","I head to work and get the place ready to open up.",
"nar","Mornings are usually pretty slow here.",
"event",{"move",manatee_sprite,posC},
coUpper,"Dude!",
"YOU","Hey, "..coWorkerName..".",
coUpper,"Ready for another great day at work?",
"YOU","I guess so.",
coUpper,"What could be better than selling boba!",
"nar","I can think of a few things.",
"event",{"move",manatee_sprite,pos01},
"nar","We open up shop for the day.",
"event",{"music",music_restaurant_ambience},
"nar","Some regulars trickle in.",
"nar","I serve them their orders and play on my handheld console in-between.",
"event",{"change",manatee_sprite,image_manatee_shock},
"event",{"move",manatee_sprite,posC},
coUpper, "whatcha playin?",
"YOU","The new Cranky Raccoon game.",
"event",{"change",manatee_sprite,image_manatee_happy},
coUpper, "Oh yeah, I've heard good things about that one.",
"nar","It's getting pretty busy but I guess it _is_ the weekend.",
"event",{"change",manatee_sprite,image_manatee_concern},
"nar","Somebody's child spills ramen all over the floor.",
"event",{"move",manatee_sprite,pos01},
coUpper,"I've got it..",
"nar","The next few hours seem to slip by as I do my job or whatever.",
"nar","I start to space out.",
"event",{"move",wolf_sprite,posC},
"WOLF","Hello?",
"YOU","Oh, hey.",
"WOLF","Can I get uhhhhh...\nsome ramen?",
"YOU","Oh uhhh, yeah sure.",
"event",{"change",wolf_sprite,image_wolf_alt_happy},
"WOLF","Long day?",
"YOU","Yeah...",
"YOU","Wait, I actually don't know what time it is.",
"event",{"change",wolf_sprite,image_wolf_alt},
"nar","He checks his watch.",
"WOLF","It is 4:36",
"YOU","Damn, the whole day slipped by.",
"YOU","We should be closing soon.",
"WOLF","Really? Y'all close pretty early.",
"event",{"change",manatee_sprite,image_manatee_shock},
"event",{"move",manatee_sprite,posC},
"event",{"move",wolf_sprite,posR},
coUpper, "We are closing pretty soon",
"event",{"move",manatee_sprite,posL},
"event",{"change",manatee_sprite,image_manatee_concern},
coUpper, "Oh, sorry.",
"event",{"change",wolf_sprite,image_wolf_alt_happy},
"WOLF","Nah, you're good.",
"YOU","Oh right, speaking of which.",
"WOLF","Yeah, I would like some ramen",
"event",{"move",manatee_sprite,pos11},
"event",{"move",wolf_sprite,posC},
"event",{"change",manatee_sprite,image_manatee_happy},
coUpper, "On it.",
"event",{"change",wolf_sprite,image_wolf_alt},
"nar","I let him pay.",
"nar","He stays around since there isn't anyone in line behind him.",
"nar","He strikes up a conversation.",
"event",{"change",wolf_sprite,image_wolf_alt_happy},
"WOLF","So, what do you have going on after this?",
"event",{"change",wolf_sprite,image_wolf_alt},
"YOU","idk, my dad is kicking me out of the house for tonight.",
"YOU","Probably will go to the park and get high.",
"YOU","Maybe play some games on my handheld.",
"event",{"change",wolf_sprite,image_wolf_alt_happy},
"WOLF","Right on.",
"WOLF","Well, if it's all to same to you,",
"WOLF","maybe you should come hang with me for the rest of my shift.",
"YOU","Hmm.. yeah, maybe.",
"event",{"move",manatee_sprite,posR},
"event",{"move",wolf_sprite,posL},
coUpper,"Here is your order, "..wolfName..".",
"event",{"move",manatee_sprite,posC},
"event",{"move",wolf_sprite,pos01},
wolfUpper,"Thank you.",
"nar","Wait..",
"nar","Was he hitting on me?",
"nar","I whisper to "..coWorkerName..".",
"YOU","I think he was hitting on me.",
"event",{"change",manatee_sprite,image_manatee_shock},
coUpper,"No way! what happened?",
"YOU","I told him we were closing soon",
"YOU","and that I don't really have anything planned",
"YOU","and he suggested that I should go with him after this.",
coUpper,"No way!",
coUpper,"Are you gonna do it?",
"nar","I think it over.",
"nar","Y'know, why not?",
"nar","Why not get in some random strange I just met's car?",
"nar","and go with them to their job?",
"nar","...",
"YOU","Yeah",
"YOU","I think I am gonna do it",
"YOU","Could be kinda funny lol",
"event",{"move",manatee_sprite,pos01},
coUpper,"Alright well, let me know how that goes.",
"event",{"bg",image_background_car,250},
"event",{"music",music_blank},
"event",{"move",wolf_sprite,posC},
"event",{"sound",sound_car_door},
wolfUpper,"So, this is my car.",
"nar","It's a pretty nice car.",
wolfUpper,"I'm glad you decided to come with me-",
"YOU","Are you hitting on me?",
"event",{"change",wolf_sprite,image_wolf_alt_flushed},
wolfUpper,"...",
wolfUpper,"What if I was?",
"YOU","There would be nothing wrong with that.",
"YOU","I just like knowing I'm on a date _before_ they start.",
"event",{"change",wolf_sprite,image_wolf_alt_blush},
"nar","He laughs.",
wolfUpper,"Well, if you wanna consider this a date,",
wolfUpper,"then it will be a pretty untraditional date.",
wolfUpper,"I really just wanted a bud to hand out with for the rest of the day.",
"YOU","So..",
"YOU","Where do you work?",
wolfUpper,"Well.. it's hard to describe.",
wolfUpper,"You'll just see.",
"event",{"change",wolf_sprite,image_wolf_alt},
"event",{"bg",image_background_office,1000},
"nar","We arrive at a big building and walk up to an office.",
"YOU","Wow, you work here?",
wolfUpper,"Well, I guess I do.",
wolfUpper,"We are a construction company.",
"event",{"change",wolf_sprite,image_wolf_alt_blush},
wolfUpper,"I'm the CEO.",
"nar","Oh shit..",
"event",{"change",wolf_sprite,image_wolf_happy},
"nar","He takes his suit off and puts it on a hanger.",
wolfUpper,"I hope you don't mind, working in a suit isn't my thing.",
wolfUpper,"Also, I have to go on site a bit later.",
"nar","I think he notices me still in flushed shock.",
"event",{"change",wolf_sprite,image_wolf},
wolfUpper,"What's up? You look like you've seen a ghost.",
"event",{"change",wolf_sprite,image_wolf_happy},
"nar","He laughs.",
"YOU","You're the CEO?",
"event",{"change",wolf_sprite,image_wolf},
wolfUpper,"Yeah, I am.",
"event",{"move",wolf_sprite,pos11},
"nar","He sits in his big important business chair and starts working on some paperwork.",
"YOU","Do you have a water cooler around here?",
wolfUpper,"Yeah, just outside the door to the left.",
"nar","I walk over and take a sip of water.",
"nar","Holy fuck, he's the CEO??",
"event",{"bg",image_background_black,2000},
"nar","I might pass out..",
"nar","fuck",
"event",{"bg",image_background_office,100},
"event",{"change",wolf_sprite,image_wolf_shock},
"event",{"move",wolf_sprite,posC},
wolfUpper,"Oh shit, are you alright?",
"nar","The wolf is holding me gently in his arms.",
"nar","He carries me over to a seat and sets me down.",
"nar","He neals down in front of me.",
"YOU","Are you marrying me?",
"event",{"change",wolf_sprite,image_wolf_blush},
"nar","We both laugh.",
wolfUpper,"No, you dolt.",
"event",{"change",wolf_sprite,image_wolf_flushed},
wolfUpper,"Are you alright? You stepped outside and passed out.",
"nar","Oh..",
"YOU","I just couldn't believe you're a CEO.",
"YOU","And that you wanted me to hang out with you.",
"event",{"change",wolf_sprite,image_wolf_blush},
wolfUpper,"Heh..",
wolfUpper,"Tell you what, I just finished the paperwork,",
wolfUpper,"How about we don't talk about me being CEO anymore and go to the worksite?",
wolfUpper,"And then afterwords we can get some beer and appetizers at a bar?",
"nar","That does sound quite nice.",
"YOU","Okay, sounds good.",
"event",{"bg",image_background_car,2000},
"nar","He takes my hand and leads me back to his car.",
"nar","He opens the passenger car door for me like a gentleman.",
"nar","I blush and get in.",
"nar","He walks around to the other side, gets in, and gets the car in gear to go.",
"nar","We start driving towards the outskirts of the city.",
"YOU","So, how did you end up as the CEO of a construction company?",
wolfUpper,"Hey, I thought we weren't gonna talk about me being CEO.",
wolfUpper,"I dunno, it still doesn't really make sense to me.",
wolfUpper,"I was working my way up in the company",
wolfUpper,"and then one day the CEO just straight up died.",
wolfUpper,"So the shareholders decided to put me in charge",
"YOU","Oh, cool.",
"YOU","Well, you seem to be doing a good job.",
"event",{"change",wolf_sprite,image_wolf_flushed},
wolfUpper,"I guess..",
"event",{"change",wolf_sprite,image_wolf_blush},
wolfUpper,"What about you?",
wolfUpper,"How did you end up at that ramen shop?",
"YOU","Uhhh...",
"YOU","I put in an application and got the job.",
wolfUpper,"Haha, I guess I mean why there?",
"YOU","I dunno, I just needed to work somewhere, college ain't cheap.",
"event",{"change",wolf_sprite,image_wolf},
wolfUpper,"I hear that.",
"event",{"bg",image_background_construction,1000},
"event",{"music",music_construct},
"nar","We eventually end up at the site of a building under construction.",
"event",{"move",wolf_sprite,pos11},
wolfUpper,"Tommy! How's it going?",
"nar","Oh, well I guess I will just hang out then.",
"nar","That sure is a building.",
"nar","I find a random hard-hat and put it on.",
"RANDOM GUY","EY! What are you doing just hanging around?!",
"RANDOM GUY","Get back to work!",
"YOU","Oh, I don't work here-",
"nar","He walks up to me and pushes me towards a pile of lumber.",
"RANDOM GUY","Start moving!",
"nar","fuck",
"nar","I pick up a piece of lumber and-",
"nar","Wait, where am I even supposed to take this?",
"event",{"change",wolf_sprite,image_wolf_blush},
"event",{"move",wolf_sprite,posC},
wolfUpper,"What are you doing? haha",
"RANDOM GUY","He's working!",
"event",{"change",wolf_sprite,image_wolf},
wolfUpper,"He doesn't work here, you dolt.",
"RANDOM GUY","Oh..",
"RANDOM GUY","Why is he wearing a hard-hat then?",
"YOU","Um..",
"YOU","Safety?",
"nar","...",
"event",{"bg",image_background_car,250},
"event",{"music",music_blank},
"event",{"sound",sound_car_door},
"event",{"change",wolf_sprite,image_wolf_blush},
wolfUpper,"Sorry about him.",
"YOU","It's alright haha.",
"YOU","I'm beat, can we get some beer now?",
wolfUpper,"You picked up one piece of wood.",
"YOU","Yeah, but it was a heavy piece of wood.",
"YOU","My precious paws were made for that.",
"event",{"change",wolf_sprite,image_wolf},
wolfUpper,"Really? I thought you'd be good at it.",
"YOU","Is this what this was really all about,",
"YOU","you wanted to hire me for some manual labor?",
"event",{"change",wolf_sprite,image_wolf_blush},
wolfUpper,"No.",
wolfUpper,"I thought you were cute.",
"event",{"change",wolf_sprite,image_wolf},
"event",{"music",music_restaurant_ambience},
"event",{"bg",image_background_bar,500},
wolfUpper,"Give me a drink, bartender.",
"nar","They slide a crisp beer across the bar.",
wolfUpper,"Make that two, please.",
"nar","The bartender hands me a beer too.",
wolfUpper,"So..",
"nar","He takes a sip of his beer.",
wolfUpper,"What do you want to do with your life?",
"YOU","Damn, at least let me get buzzed first before you ask the hard questions.",
"nar","I take a long drink of my beer.",
"nar","Feels good, nice and refreshing.",
"YOU","Uhhh..",
"YOU","I wanna do something with computers I guess.",
wolfUpper,"Yeah, I can see that.",
"nar","He takes another sip.",
"event",{"change",wolf_sprite,image_wolf_flushed},
"nar","He looks like he has something he wants to say.",
"YOU","What about you?",
wolfUpper,"I want to have you over to play video games together sometime.",
"YOU","..Is that all you want to do with your life right now?",
"event",{"change",wolf_sprite,image_wolf_happy},
wolfUpper,"Yes.",
"YOU","Alright then, it's a date.",
wolfUpper,"YIPPEE!!",
wolfUpper,"Bartender, we're gonna need some mac and cheese bites over here!",
"nar","I take his hand and hold it.",
"event",{"move",wolf_sprite,pos11},
"nar","This was an interesting experience,",
"nar","definitely not what I was expecting to do tonight,",
"nar","but I did enjoy my time.",
"event",{"bg",image_background_kitchen,1000},
"event",{"music",music_blank},
"nar","After the bar, where he barely drank, he drove me home.",
"YOU","Dad?",
"nar","I find him spooning another man on the couch.",
"nar","They look cute together, I hope he's a keeper.",
"nar","Just like my wolf.",
"event",{"bg",image_background_black,250},
"event",{"music",music_dehumidifier},
"nar","*THE END*",
"nar","Written by: Matthew\nAs a part of Raccoon Formality.",
"nar","Game was originally created for the MAY WOLF game jam",
"nar","held by Unagi.",
"nar","All sprites were made by Cody.",
"nar","Background found on pexels.com\nSounds found at freesound.org",
"nar","...",
"nar","Now I need to add fluff to get to 2000 words.",
"nar","How was your day?",
"nar","If you've made it to this part,",
"nar","maybe you should send me a picture on Mastodon.",
"nar","Doesn't have to be of anything in particular",
"nar","Show me your cat or some food you got.",
"nar","idk, whatever you want.",
"nar","Oh right, btw, when this ends you won't go back to the main menu",
"nar","I'm too lazy to add an end state.",
"nar","So you will just have to close the game and move on with your life.",
"nar","Like how I will with mine.",
"nar","That has to be enough by now, right? great.",
"nar","Wouldn't it be so lame if I added unnecessary fluff to my actual story?",
"nar","I think it would have been, I'm glad I did this instead.",
"nar","Okay, have a nice rest of your day, I'm going to publish this on itch now.",
"nar","*THE END*",
}

wordCount = 0
for j=1, #textList, 2 do
    if textList[j] ~= "event" then
        _,n = textList[j+1]:gsub("%S+","")
        if textList[j] ~= "nar" then
            n += 1
        end
        wordCount += n
    end
end
print("Word Count: "..wordCount)

eventSave = {}

menu = playdate.getSystemMenu()

count = 1
min_count = 1

--[[
checkmarkMenuItem, error = menu:addCheckmarkMenuItem("Checkbox", true, function(value)
    print("Checkmark menu item value changed to: ", value)
end)
]]--

saveName = "save2"


function startGame()
musicObject:play(0)
soundObject:play()
progressText(textList[1],textList[2])

menuItem, error = menu:addMenuItem("Save", function()
    local saveTable = {}
    saveTable["num"] = count
    saveTable["min"] = count
    sprites = gfx.sprite.getAllSprites()
    local spriteCount = 1
    saveTable["sprite"] = {}
    for z=1, #sprites do
        if sprites[z].isChar then
            saveTable["sprite"][spriteCount] = sprites[z]
            spriteCount += 1
        end
    end
    spriteCount += 1
    saveTable["music"] = musicFile
    saveTable["bg"] = bg_sprite.image
    saveTable["events"] = eventSave
    print(saveTable)
    playdate.datastore.write(saveTable, saveName, true)
end)

menuItem, error = menu:addMenuItem("Load", function()
    local saveFile = playdate.datastore.read(saveName)
    if saveFile then
        count = saveFile["num"]
        min_count = saveFile["min"] 
        
        progressText(textList[count],textList[count+1])
    sprites = gfx.sprite.getAllSprites()
    local spriteCount = 1
    for z=1, #sprites do
        if sprites[z].isChar then
        moveX,moveY = saveFile["sprite"][spriteCount].posX , saveFile["sprite"][spriteCount].y
        sprites[z].posX = saveFile["sprite"][spriteCount].posX
        sprites[z]:moveTo(moveX,moveY)
        setSpriteImage(sprites[z],saveFile["sprite"][spriteCount].image)
        spriteCount += 1
        end
    end
    musicObject:stop()
    musicObject = playdate.sound.fileplayer.new(saveFile["music"])
    musicObject:play(0)
    image2 = gfx.image.new(saveFile["bg"])
    setSpriteImage(bg_sprite,saveFile["bg"])
    eventSave = saveFile["events"]
    soundObject:stop()
end
end)

--optionMenu, error = menu:addOptionsMenuItem("graphics", {"good","better","best","ULTRA"}, 1, callback)
end