function onCreate()
    particles = {}
    particleTimer = 0
    particleInterval = 0.1
    particleImage = 'particle'
    preloadImage(particleImage)
    minScale = 0.01
    maxScale = 0.2
    minAlpha = 0.1
    maxAlpha = 0.8
    minSpeed = 40
    maxSpeed = 300
    minLifetime = 5
    maxLifetime = 20
    
    screenWidth = getPropertyFromClass('flixel.FlxG', 'width')
    screenHeight = getPropertyFromClass('flixel.FlxG', 'height')
    
    particlesActive = false
end

function onStepHit()
    if curStep == 133 then
        particlesActive = true
        createParticle() -- Создаем первую частицу сразу
    end
end

function onUpdate(elapsed)
    if not particlesActive then return end
    
    particleTimer = particleTimer + elapsed
    if particleTimer >= particleInterval then
        particleTimer = 0
        createParticle()
    end
    
    for i = #particles, 1, -1 do
        local p = particles[i]
        setProperty(p.tag..'.y', getProperty(p.tag..'.y') - p.speed * elapsed)
        p.lifetime = p.lifetime - elapsed
        
        if p.lifetime <= p.fadeTime then
            local fadePercent = p.lifetime / p.fadeTime
            setProperty(p.tag..'.alpha', p.alpha * fadePercent)
            setProperty(p.tag..'.scale.x', p.scale * fadePercent)
            setProperty(p.tag..'.scale.y', p.scale * fadePercent)
        end
        
        if p.lifetime <= 0 then
            removeLuaSprite(p.tag, true)
            table.remove(particles, i)
        end
    end
end

function createParticle()
    local tag = 'particle_'..getRandomInt(1, 1000000)
    local scale = getRandomFloat(minScale, maxScale)
    local alpha = getRandomFloat(minAlpha, maxAlpha)
    local speed = getRandomFloat(minSpeed, maxSpeed)
    local lifetime = getRandomFloat(minLifetime, maxLifetime)
    local fadeTime = lifetime * 0.5

    makeLuaSprite(tag, particleImage, getRandomInt(-3000, 3000), 1500)
    setScrollFactor(tag, 0, 0)
    setProperty(tag..'.scale.x', scale)
    setProperty(tag..'.scale.y', scale)
    setProperty(tag..'.alpha', alpha)
    addLuaSprite(tag, true)

    table.insert(particles, {
        tag = tag,
        scale = scale,
        alpha = alpha,
        speed = speed,
        lifetime = lifetime,
        fadeTime = fadeTime
    })
end

function getRandomFloat(min, max)
    return min + math.random() * (max - min)
end

function preloadImage(image)
    if not checkFileExists('images/'..image..'.png') then
        debugPrint('Ошибка: изображение '..image..' не найдено!')
        return false
    end
    return true
end