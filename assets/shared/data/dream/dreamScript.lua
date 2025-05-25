function onCreate()

    setProperty('camGame.zoom', 0.2)

    makeLuaSprite('black', '', -100, -100)
    makeGraphic('black', 1500, 1080, '000000')
    scaleObject('black', 9000, 9000, false)
    setScrollFactor('black', 0.0, 0.0)
    addLuaSprite('black', false)

    removeLuaScript("scripts/health")
    removeLuaScript("scripts/JollyHUdFunkWorld")
    removeLuaScript("scripts/RWNewCycle")

    setProperty('skipCountdown', true)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('dad.visible', false)
    setProperty('gf.visible', false)

    
end

function onUpdate(elapsed)
    setProperty('health', 1)
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
end

function onStepHit()
end