EzSVG = require "EzSVG"
local dim = 500

svg = EzSVG.Document(dim, dim, EzSVG.gray(40))

group = EzSVG.Group()
circles = EzSVG.Group()

svg:add(group)
svg:add(circles)

local num = 800

EzSVG.setStyle({
    stroke_linecap= "round",
    fill= "white",
    stroke= "white"
})

for i=0,num do
    local norm = i / num
    
    local length = dim/2.1 * (0.5 + math.abs(math.sin(norm * 80)) * 0.5)
    local lw = math.abs(math.sin(norm*200)) * 1
        
    local x = dim/2 + math.sin(norm * 50) * length
    local y = dim/2 + math.cos(norm * 50) * length
    
    local line = EzSVG.Line(dim/2, dim/2, x, y, {
        stroke_width= lw + 0.3
    })
    
    group:add(line)
    
    local circle = EzSVG.Circle(x, y, lw * 15, {
        fill= "#000000",
        stroke_width = 1
    })
    
    circles:add(circle)
    
end

svg:add(EzSVG.Circle(dim/2, dim/2, 60, {
    fill= "black",
    stroke= "white",
    stroke_width = 5
}))

svg:writeTo("example2.svg")