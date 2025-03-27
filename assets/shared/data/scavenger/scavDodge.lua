local posy = 500
local txtPos = 620

local statusRep = 0
local tryAttack = false

function onCreate()
    if downscroll then
        posy = -100
        txtPos = 0
    end

    makeLuaSprite("miss", "warnattack", 600, posy)
    setObjectCamera('miss', 'camHUD')
    scaleObject('miss', 0.8, 0.8)
    screenCenter('miss', 'x')
    screenCenter('miss', 'y')
    

    makeLuaSprite("scav", "mechanics/scavRep/scav-happy", 600, posy)
    setObjectCamera('scav', 'camHUD')
    scaleObject('scav', 1.6, 1.6)
    screenCenter('scav', 'x')
    addLuaSprite('scav', true)

    makeLuaText('txtRep', 'positive', 500, 600, txtPos)
    screenCenter('txtRep', 'x')
    setTextSize('txtRep', 50)
    setObjectCamera('txtRep', 'camHUD')
    addLuaSprite('txtRep', true)

    makeLuaSprite("scavn", "mechanics/scavRep/scav-normal", 600, posy)
    setObjectCamera('scavn', 'camHUD')
    scaleObject('scavn', 1.6, 1.6)
    screenCenter('scavn', 'x')

    makeLuaSprite("scavnn", "mechanics/scavRep/scav-neutral", 600, posy)
    setObjectCamera('scavnn', 'camHUD')
    scaleObject('scavnn', 1.6, 1.6)
    screenCenter('scavnn', 'x')

    makeLuaSprite("scava", "mechanics/scavRep/scav-angry", 600, posy)
    setObjectCamera('scava', 'camHUD')
    scaleObject('scava', 1.6, 1.6)
    screenCenter('scava', 'x')

    makeLuaSprite("scavaa", "mechanics/scavRep/scav-agressive", 600, posy)
    setObjectCamera('scavaa', 'camHUD')
    scaleObject('scavaa', 1.6, 1.6)
    screenCenter('scavaa', 'x')
    addLuaSprite('miss', true) 

    doTweenAlpha('gggkarma', 'miss', 0, 0.01, 'linear')
    

end

function onUpdate(elapsed)
    if getProperty('songMisses') == 3 then
        statusRep = 1
        setTextString("txtRep", 'normal')
        removeLuaSprite('scav', true)
        addLuaSprite('scavn', false)
    end
    if getProperty('songMisses') == 6 then
        statusRep = 2
        setTextString("txtRep", 'neutral')
        removeLuaSprite('scavn', true)
        addLuaSprite('scavnn', false)
    end
    if getProperty('songMisses') == 10 then
        statusRep = 3
        setTextString("txtRep", 'bad')
        removeLuaSprite('scavnn', true)
        addLuaSprite('scava', false)
    end
    if getProperty('songMisses') == 20 then
        statusRep = 4
        setTextString("txtRep", 'agressive')
        removeLuaSprite('scava', true)
        addLuaSprite('scavaa', false)
    end

    if tryAttack and keyJustPressed('ACCEPT') then
        tryAttack = false
        doTweenAlpha('gggkarma', 'miss', 0, 0.01, 'linear')
        cancelTimer('attack')
    end


    if tryAttack then
        doTweenAlpha('gggkarma', 'miss', 1, 0.01, 'linear')
        
    end
end


function onEndSong()
    if statusRep == 4 then
        setProperty('health',0)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'attack' then
        setProperty('health', 0)
    end
    
end

function onEvent(name, value1, value2)
    if name == "scavDodge" then
        if value1 == statusRep then
            tryAttack = true
            runTimer('attack', 2, 0)
        end
	end
end
