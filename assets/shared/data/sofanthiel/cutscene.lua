function onStartCountdown()
    -- Проверяем, была ли уже показана катсцена
    if not seenCutscene then
        -- Воспроизводим видео 'intro.mp4'
        startVideo('survivorship_cutscene')
        -- Отменяем первый отсчет, чтобы сначала показать видео
        return Function_Stop
    end
    -- Продолжаем с отсчетом, если катсцена уже была показана
    return Function_Continue
end
