function onCreate()
    makeLuaSprite("black", "", -900, -500)
    makeGraphic("black", 4000, 4000, "000000")
    setScrollFactor("black", 0.0, 0.0)
    addLuaSprite("black", true)
end

function onStartCountdown()
    triggerEvent('Camera Follow Pos', '400', '-900')
    setProperty('camFollow.x', 540)
    setProperty('camFollow.y', -900)
end

function onStepHit()
    if curStep == 5 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 40 then
        doTweenAlpha('fadeTween', 'black', 0, 2, 'linear')
        doTweenY('cameraMoveY', 'camFollow', 550, 10, 'CubeInOut')
    end
    if curStep == 149 then
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Camera Follow Pos', '', '')
    end
    if curStep == 168 then
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 179 then
        setProperty('defaultCamZoom', 1.1)
    end
    if curStep == 189 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curStep == 213 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 253 then
        setProperty('defaultCamZoom', 0.6)
        triggerEvent('Camera Follow Pos', '540', '400')
    end
    if curStep == 290 then
        triggerEvent('Camera Follow Pos', '', '')
    end
    if curStep == 296 then
        setProperty('defaultCamZoom', 1.3)
    end
    if curStep == 307 then
        setProperty('defaultCamZoom', 1.5)
    end
    if curStep == 320 then
        setProperty('defaultCamZoom', 0.6)
        triggerEvent('Camera Follow Pos', '540', '400')
    end
    if curStep == 341 then
        setProperty('defaultCamZoom', 0.65)
    end
    if curStep == 352 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curStep == 363 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 373 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curStep == 383 then
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Camera Follow Pos', '', '')
    end
    if curStep == 554 then
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Camera Follow Pos', '540', '600')
    end
    if curStep == 680 then
        triggerEvent('Camera Follow Pos', '540', '400')
    end
    if curStep == 693 then

        setProperty('defaultCamZoom', 0.65)
    end
    if curStep == 704 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curStep == 715 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 725 then
        setProperty('defaultCamZoom', 0.5)
        doTweenY('cameraMoveY', 'camFollow', -2000, 3, 'CubeInOut')
    end
    if curStep == 730 then
        doTweenAlpha('fadeTween', 'black', 1, 2, 'linear')
    end
end
