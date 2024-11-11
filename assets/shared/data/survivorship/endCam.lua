
function onStepHit()
    
    if curStep == 1024 then
        
        triggerEvent('Camera Follow Pos', 862, -2000)
        cameraFade('HUD', '010101', 2, false)

    end
end
