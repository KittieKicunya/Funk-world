local deathsdata = getPropertyFromClass("states.PlayState", "deathCounter")

function onSongStart()

    removeLuaScript('scripts/RWNewCycle')

    makeLuaSprite("fon", '', 0, 0)
    makeGraphic("fon", 1920, 1000, '010101')
    setObjectCamera("fon", 'HUD')
    setProperty("fon.alpha", 0)
    addLuaSprite("fon", false)

    makeLuaSprite("black1", '', 0, -100)
    makeGraphic("black1", 1920, 70, '010101')
    setObjectCamera("black1", 'HUD')
    setObjectOrder('black1', getObjectOrder('healthBar')+4)
    addLuaSprite("black1", true)
    doTweenY("completed", "black1", 0, 1.0, "CubeOut")

    makeLuaSprite("black2", '', 0, 750)
    makeGraphic("black2", 1920, 70, '010101')
    setObjectCamera("black2", 'HUD')
    setObjectOrder('black2', getObjectOrder('healthBar')+4)
    addLuaSprite("black2", true)
    doTweenY("complete", "black2", 650, 1.0, "CubeOut")

    makeLuaText("cycle", "cycle ".. deathsdata .. ' - '.. songName, 512, 0.0, 660.0)
    setTextSize("cycle", 40)
    setObjectCamera("cycle", 'HUD')
    setObjectOrder('cycle', getObjectOrder('fon')+5)
    setProperty("cycle.alpha", 0)
    setTextAlignment('cucle', 'right')
    addLuaText("cycle", true)
    doTweenAlpha('cikl', 'cycle', 0, 0.001, 'CubeInOut')

    

    doTweenAlpha('gggkarma', 'shit', 0, 1, 'linear')
    doTweenAlpha('hideIconP1', 'iconP1', 0, 1, 'linear')
    doTweenAlpha('hideIconP2', 'iconP2', 0, 1, 'linear')
    doTweenAlpha('hidetime', 'timeTxt', 0, 1, 'linear')
    doTweenAlpha('fonchik', 'fon', 0.5, 1, 'linear')
    doTweenAlpha('cikl', 'cycle', 1, 1, 'CubeInOut')
    doTweenAlpha('pip1', 'pipslot1', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt2', 'pipslot2', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt3', 'pipslot3', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt4', 'pipslot4', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt5', 'pipslot5', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt6', 'pipslot6', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt7', 'pipslot7', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt8', 'pipslot8', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt9', 'pipslot9', 0, 1, 'CubeInOut')
    doTweenAlpha('pipslt10', 'pipslot10', 0, 1, 'CubeInOut')
    doTweenAlpha('pipsl', 'therates', 0, 1, 'CubeInOut')
    doTweenAlpha('str', 'arrow', 0, 1, 'CubeInOut')
    doTweenAlpha('ico', 'scav', 0, 1, 'CubeInOut')
    doTweenAlpha('txtRep', 'txtRep', 0, 1, 'CubeInOut')
    

    for i=0,7 do
        noteTweenAlpha(i+16, i, math.floor(curStep/12), 1)
    end

    runTimer('cycleData', 5, 1)
    
    ---
    --- @param tag string
    --- @param loops integer
    --- @param loopsLeft integer
    ---
    function onTimerCompleted(tag, loops, loopsLeft)
        for i=0,7 do
            noteTweenAlpha(i+16, i, 1, 1)
        end
        doTweenAlpha('txtRep', 'txtRep', 1, 1, 'CubeInOut')
        doTweenAlpha('ico', 'scav', 1, 1, 'CubeInOut')
            doTweenAlpha('gggkarma', 'shit', 1, 1, 'linear')
            doTweenAlpha('hideIconP1', 'iconP1', 0.8, 2, 'linear')
            doTweenAlpha('hideIconP2', 'iconP2', 0.8, 2, 'linear')
            doTweenY("complete", "black1", -100, 1.0, "CubeIn")
            doTweenY("completed", "black2", 750, 1.0, "CubeIn")
            doTweenAlpha('cikl', 'cycle', 0, 1, 'CubeInOut')
            doTweenAlpha('fonchik', 'fon', 0, 1, 'linear')
            doTweenAlpha('hidetime', 'timeTxt', 1, 1, 'linear')
            doTweenAlpha('pip1', 'pipslot1', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt2', 'pipslot2', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt3', 'pipslot3', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt4', 'pipslot4', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt5', 'pipslot5', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt6', 'pipslot6', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt7', 'pipslot7', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt8', 'pipslot8', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt9', 'pipslot9', 1, 1, 'CubeInOut')
    doTweenAlpha('pipslt10', 'pipslot10', 1, 1, 'CubeInOut')
    doTweenAlpha('pipsl', 'therates', 1, 1, 'CubeInOut')
    doTweenAlpha('str', 'arrow', 1, 1, 'CubeInOut')
    
    end
    
end