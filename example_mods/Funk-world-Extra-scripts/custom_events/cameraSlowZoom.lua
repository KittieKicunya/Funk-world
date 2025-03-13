---
--- @param eventName string
--- @param value1 string
--- @param value2 string
--- @param strumTime float
---
function onEvent(ZoomCam, value1, value2, strumTime)
    setProperty("camGame.zoom", value1)
end