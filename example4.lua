-- Gradient Interface needs some Work
-- Better don't use now

EzSVG = require "EzSVG"

svg = EzSVG.Document(1000, 1000, "#222222")

local r = 20

for x=0,1000-r*2,r*2 do
    for y=0,1000-r*2,r*2 do
    
        local gradient = EzSVG.LinearGradient(0, y/20, 100, x/10)
        local hue = x/4 + y/8
        gradient:addStop(0, EzSVG.hsv(hue, 50, 50))
                :addStop(50, EzSVG.hsv(hue, 255, 255))
                :addStop(100, EzSVG.hsv(hue, 50, 255))
        
        local circle = EzSVG.Circle(x+r, y+r, r * 0.9)
        
        circle:setStyle({
            fill=gradient,
            stroke="#777777"
        })
        
        svg:add(circle)
    end
end

svg:writeTo("example4.svg")