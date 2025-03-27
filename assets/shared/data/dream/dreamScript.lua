function onCreate()
    removeLuaScript("health")
    removeLuaScript("JollyHUdFunkWorld")
    removeLuaScript("RWNewCycle")

    setProperty('skipCountdown', true)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
end

function onUpdate(elapsed)
    setProperty('health', 1)
end