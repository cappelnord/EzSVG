EzSVG = require "EzSVG"

svg = EzSVG.Document(1000, 1000, "#222222")

local r = 20

for x=0,1000-r*2,r*2 do
    for y=0,1000-r*2,r*2 do
    
        local gradient = EzSVG.LinearGradient(0, y/20, 100, x/10)
        gradient:addStop(0, "black")
                :addStop(50, EzSVG.rgb(x/4, 255 - y/4, (x + y) / 8))
                :addStop(100, "white")
        
        local circle = EzSVG.Circle(x+r, y+r, r * 0.9)
        
        circle:setStyle({
            fill=gradient,
            stroke="#777777"
        })
        
        svg:add(circle)
    end
end

svg:writeTo("example4.svg")