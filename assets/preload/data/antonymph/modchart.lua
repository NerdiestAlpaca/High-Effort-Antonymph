local swaying = false
local bounce = false

function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
    for i = 0, 7 do 
        setActorX(1300, i)
    end
    for i = 0, 3 do
        if getActorAlpha(i) ~= 0 then 
            setActorAlpha(0,i)
        end
    end
    error1 = makeSprite('error1','error1', true)
    setActorX(100,'error1')
	setActorY(0,'error1')
	setActorAlpha(0,'error1')
	setActorScale(1.5,'error1')
    error2 = makeSprite('error2','error2', true)
    setActorX(800,'error2')
    setActorY(0,'error2')
    setActorAlpha(0,'error2')
    setActorScale(1.5,'error2')
    error3 = makeSprite('error3','error3', true)
    setActorX(200,'error3')
    setActorY(0,'error3')
    setActorAlpha(0,'error3')
    setActorScale(1.5,'error3')
    error4 = makeSprite('error4','error4', true)
    setActorX(480,'error4')
    setActorY(-50,'error4')
    setActorAlpha(0,'error4')
    setActorScale(1.5,'error4')
    error5 = makeSprite('error5','error5', true)
    setActorX(200,'error5')
    setActorY(0,'error5')
    setActorAlpha(0,'error5')
    setActorScale(1.5,'error5')
    error6 = makeSprite('error6','error6', true)
    setActorX(900,'error6')
    setActorY(0,'error6')
    setActorAlpha(0,'error6')
    setActorScale(1.5,'error6')
    error7 = makeSprite('error7','error7', true)
    setActorX(300,'error7')
    setActorY(100,'error7')
    setActorAlpha(0,'error7')
    setActorScale(1.5,'error7')
    login = makeSprite('login','login', true)
    setActorX(0,'login')
    setActorY(-200,'login')
    setActorAlpha(0,'login')
    setActorScale(2,'login')
    setActorScale(0.3,'girlfriend')
    setActorY(-300, 'girlfriend')
    setActorX(1000, 'girlfriend')
    setActorAlpha(0, 'girlfriend')
    setActorScale(0.6,'boyfriend')
    setActorY(0, 'boyfriend')
    setActorX(700, 'boyfriend')
    setActorAlpha(0, 'boyfriend')
    setActorScale(0.2,'dad')
    setActorY(0, 'dad')
    setActorX(20, 'dad')
    setActorAlpha(0, 'dad')
    showOnlyStrums = true
    setCamZoom(0.77)
end


function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end


function songStart()
    setCamZoom(0.77)
end

local defaultHudX = 0
local defaultHudY = 0

local defaultWindowX = 0
local defaultWindowY = 0

local moveWindow = false


local xTo4 = 0
local xTo5 = 0
local xTo6 = 0
local bfX = 0


local xTo7 = 0


function defaultWindow()
    setHudPosition(defaultHudX,defaultHudY)
    setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    setHudAngle(0)
end

function update (elapsed) 
    local currentBeat = (songPos / 1000)*(bpm/60)
    setCamZoom(0.77)
    for i = 0, 3 do 
        setActorAlpha(0,i)
    end
    if swaying then
		for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
            setActorY(defaultStrum0Y + 0, i)
		end
    end
    if bounce then
        for i=0,7 do
            setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.1) * 10), i)
        end
    end
    if swaying2 then
        local currentBeat = (songPos / 900)*(bpm/60)
		for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 20 * math.sin((currentBeat + i*0)), i)
            setActorY(defaultStrum0Y + 0, i)
		end
    end
end


function beatHit (beat)

end



function bumpArrows()
end

local startBumping = false


local lastStep = 0

function stepHit (step)
if step == 1 then
    tweenFadeIn('boyfriend',1,1)
    tweenFadeIn('girlfriend',1,1)
    tweenFadeIn('dad',1,1)
    setCamZoom(0.77)
    for i = 4, 7 do -- go to the center
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 3, 'setDefault')
    end
end
if step == 256 then
    swaying = true
end
if step == 380 then
    bounce = true
end
if step == 384 then
    bounce = false
    swaying = false
    swaying2 = true
end
if step == 386 or step == 514 then
    tweenFadeIn('error1',1,0.2)
    end
if step == 410 or step == 538 then
    tweenFadeOut('error1',0,0.2)
     end
if step == 412 then
    tweenFadeIn('error2',1,0.2)
    end
if step == 446 then
    tweenFadeOut('error2',0,0.2)
    end
if step == 448 then
    tweenFadeIn('error3',1,0.2)
    end
if step == 480 then
    tweenFadeOut('error3',0,0.2)
     end
if step == 482 then
    tweenFadeIn('error4',1,0.2)
    end
if step == 512 then
    tweenFadeOut('error4',0,0.2)
     end
if step == 540 then
    tweenFadeIn('error5',1,0.2)
end
if step == 576 then
    tweenFadeOut('error5',0,0.2)
end
if step == 578 then
    tweenFadeIn('error6',1,0.2)
end
if step == 602 then
    tweenFadeOut('error6',0,0.2)
end
if step == 604 then
    tweenFadeIn('error7',1,0.2)
end
if step == 640 then
    tweenFadeOut('error7',0,0.2)
end
if step == 910 then
    tweenFadeOut('girlfriend',0,0.2)
    tweenFadeIn('login',1,0.2)
    tweenPosYAngle('boyfriend', getActorY('boyfriend') + 100 ,getActorAngle('boyfriend') + 0, 1)
    tweenPosYAngle('dad', getActorY('dad') + 100 ,getActorAngle('dad') + 0, 1)
    setActorScale(0.36, 'dad')
end
if step == 1034 then
    tweenFadeOut('login',0,0.2)
    tweenFadeIn('girlfriend',1,0.2)
    tweenPosYAngle('boyfriend', getActorY('boyfriend') - 100 ,getActorAngle('boyfriend') + 0, 1)
    tweenPosYAngle('dad', getActorY('dad') - 100 ,getActorAngle('dad') + 0, 1)
    setActorScale(0.2,'dad')
end
end

function keyPressed (key)

end