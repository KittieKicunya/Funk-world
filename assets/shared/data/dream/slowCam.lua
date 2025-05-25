local swayAmplitude = 7
local swaySpeed = 0.3
local swayTimer = 0
local zoomSpeed = 0.00005  
local maxZoom = 2.2       

function onUpdate(elapsed)
    swayTimer = swayTimer + elapsed
    local angle = math.sin(swayTimer * swaySpeed) * swayAmplitude
    setProperty('camGame.angle', angle)

    -- Медленное приближение камеры
    local currentZoom = getProperty('camGame.zoom')
    if currentZoom < maxZoom then
        setProperty('camGame.zoom', currentZoom + zoomSpeed)
    end
end
