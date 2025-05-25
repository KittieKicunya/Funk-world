function onCreate()
    -- Создаем черный экран поверх всего
    makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    setProperty('blackScreen.alpha', 1)
    addLuaSprite('blackScreen', true)

    -- Устанавливаем начальный зум камеры
end

function onCreatePost()
    -- Запускаем таймер для начала исчезновения черного экрана через 1 секунду
    runTimer('startFade', 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startFade' then
        -- Плавно убираем черный экран за 2 секунды
        doTweenAlpha('fadeBlack', 'blackScreen', 0, 2, 'linear')
    end
end