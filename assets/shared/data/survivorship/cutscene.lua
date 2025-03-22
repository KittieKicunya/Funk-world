local allowCountdown = false

function onStartCountdown()

    if not allowCountdown then
       
        startVideo('survivorship_cutscene')
        allowCountdown = true;
        return Function_Stop;
        
    end

    return Function_Continue;

end