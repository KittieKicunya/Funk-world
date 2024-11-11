function onCreatePost()

    setProperty("healthBar.percent", 20)
    if downscroll == true then
		KarmaPos = 15
	else
		KarmaPos = 585
	end

    setProperty('healthBar.visible', false)
    setProperty("iconP1.alpha", 0.8)
    setProperty("iconP2.alpha", 0.8)
    setProperty("scoreTxt.visible", false)
    setProperty("timeBar.visible", false)
    setTextFont("timeBar", 'rain-world-menu.ttf')

    makeLuaSprite("shit", 'interface/health_karma/shit', 20, KarmaPos)
    scaleObject("shit", 2.3, 2.3)
    setProperty("shit.antialiasing", false)
    setObjectCamera("shit", 'HUD')
    addLuaSprite("shit", true)

    makeLuaSprite("badkarma", 'interface/health_karma/bad', 20, KarmaPos)
    scaleObject("badkarma", 2.3, 2.3)
    setProperty("badkarma.antialiasing", false)
    setObjectCamera("badkarma", 'HUD')
    addLuaSprite("badkarma", true)

    makeLuaSprite("okkarma", 'interface/health_karma/good', 20, KarmaPos)
    scaleObject("okkarma", 2.3, 2.3)
    setProperty("okkarma.antialiasing", false)
    setObjectCamera("okkarma", 'HUD')
    addLuaSprite("okkarma", true)

    makeLuaSprite("normkarma", 'interface/health_karma/great', 20, KarmaPos)
    scaleObject("normkarma", 2.3, 2.3)
    setProperty("normkarma.antialiasing", false)
    setObjectCamera("normkarma", 'HUD')
    addLuaSprite("normkarma", true)

    makeLuaSprite("coolkarma", 'interface/health_karma/sick', 20, KarmaPos)
    scaleObject("coolkarma", 2.3, 2.3)
    setProperty("coolkarma.antialiasing", false)
    setObjectCamera("coolkarma", 'HUD')
    addLuaSprite("coolkarma", true)

    makeLuaSprite("arrow", 'interface/health_karma/arrow', 990, 550)
    setProperty("arrow.antialiasing", false)
    scaleObject("arrow", 2.2, 2.2)
    setObjectCamera("arrow", 'HUD')
    addLuaSprite("arrow", true)

    setProperty("shit.visible", true)
    setProperty("badkarma.visible", false)
    setProperty("okkarma.visible", false)
    setProperty("normkarma.visible", false)
    setProperty("coolkarma.visible", false)
    setProperty("timeTxt.x", -30)
    setProperty("timeTxt.y", 690)
    scaleObject("timeTxt", 0.5, 0.5)

    

    
    
    
    
end


function onUpdatePost(elapsed)


    setProperty('iconP1.x', 950)
	setProperty('iconP1.y', 570)
	setProperty('iconP2.x', 1050)
	setProperty('iconP2.y', 570)
    scaleObject("iconP1", 0.5, 0.5)
    scaleObject("iconP2", 0.5, 0.5)

    if rating >= 0.95 then

        setProperty("shit.visible", false)
    setProperty("badkarma.visible", false)
    setProperty("okkarma.visible", false)
    setProperty("normkarma.visible", false)
    setProperty("coolkarma.visible", true)

    elseif rating >= 0.80 then

        setProperty("shit.visible", false)
    setProperty("badkarma.visible", false)
    setProperty("okkarma.visible", false)
    setProperty("normkarma.visible", true)
    setProperty("coolkarma.visible", false)

elseif rating >= 0.75 then

    setProperty("shit.visible", false)
setProperty("badkarma.visible", false)
setProperty("okkarma.visible", true)
setProperty("normkarma.visible", false)
setProperty("coolkarma.visible", false)

elseif rating >= 0.35 then

    setProperty("shit.visible", false)
setProperty("badkarma.visible", true)
setProperty("okkarma.visible", false)
setProperty("normkarma.visible", false)
setProperty("coolkarma.visible", false)

    elseif rating <= 0.35 then

        setProperty("shit.visible", true)
    setProperty("badkarma.visible", false)
    setProperty("okkarma.visible", false)
    setProperty("normkarma.visible", false)
    setProperty("coolkarma.visible", false)

    end
end

function onUpdateScore()

	if downscroll == true then
		ratescoreY = 80 
	else
		ratescoreY = 670 
	end

	makeLuaText('therates', 'Score : '..score.. ' | Misses : '..misses..' | Combo : ' .. combo ..' ( ' .. ratingFC .. ' )', 500, 135, ratescoreY)
	setTextAlignment('therates', 'left')
	setTextColor('therates', 'FFFFFF')
	setTextFont('therates', 'rain-world-menu.ttf')
	setTextSize('therates', 20)
	setTextBorder('therates', 0, 'd4d4d4')
    setObjectCamera('therates', 'HUD')
	addLuaText('therates', true)
	setObjectOrder('therates',getObjectOrder('sick') + 2)
    

	
	if inGameOver then
		setProperty('therates.alpha',0)
	end
end

function onUpdate()
    
end

function trans()
	if ratechange == true then
	setProperty('trans.alpha',1)
	objectPlayAnimation('trans','trans',true);
	ratechange = false
	end
end

function onBeatHit()
        if mustHitSection == false then
         
            doTweenX("arrowMove", "arrow", 1080, 1, "cubeOut")
       -- Проверка, если это секция игрока
       elseif mustHitSection == true then
           doTweenX("arrowMove", "arrow", 990, 1, "cubeOut") 
       end
    
end

