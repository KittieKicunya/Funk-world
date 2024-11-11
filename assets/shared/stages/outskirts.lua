

function onCreate()
	makeLuaSprite('bg', 'Outskirts/bg', -1500, -1206)
	setScrollFactor('bg', 0.3, 0.3)
	scaleObject("bg", 1.2, 1.2)
	addLuaSprite('bg', false)

	makeLuaSprite('fg', 'Outskirts/fg', -1200, -1240)
	setScrollFactor('fg', 1.0, 1.0)
	addLuaSprite('fg', false)
end

