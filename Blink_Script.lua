Blinktimer = 0
BlinkAt = 5  --seconds to wait before blink
SPS = 1 -- amount of seconds in second (sps)


-----Blink Script-----
function pings.Blink()
animations.model.YourAnimationName:play()
end
----------------------





-----Do Not Touch-----
function events.tick()
Blinktimer = Blinktimer + SPS

if Blinktimer >= BlinkAt*20 then
pings.Blink()
Blinktimer = 0
end

BlinkclockTimer = math.floor((Blinktimer/20)/60) .. ':' .. math.floor(Blinktimer/20/10) - math.floor((Blinktimer/20)/60) * 6 .. math.floor((Blinktimer/20) - math.floor(Blinktimer/20/10)*10)

if world:getTime() == math.floor((world:getTime())/20)*20 then
pings.syncTimer(math.floor(Blinktimer/20))

-----Debug Zone-----

--log((math.floor((Blinktimer)/40)*40) + 10)
--printJson('[{"text":"Time","color":"#8800ff"},{"text":"' .. BlinkclockTimer .. '","color":"#ffaaaa"}]')

----------------------

end
end

function pings.syncTimer(tick)
Blinktimer = tick * 20
end
----------------------