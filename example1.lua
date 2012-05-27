EzSVG = require "EzSVG"

local width = 350

svg = EzSVG.Document(width, 370, EzSVG.gray(50))

lines = EzSVG.Group()

EzSVG.setStyle("stroke", "white")
EzSVG.setStyle("stroke-linecap", "round")

for x=0, width,width/80 do
    EzSVG.setStyle("stroke-width", x/150)
    lines:add(EzSVG.Line(x, 0, x, math.abs(math.sin(x/30) * 250)))
end

EzSVG.clearStyles()

svg:add(lines)


for i=0,9 do
    local x = i%3 * 70 + 100
    local y = math.floor(i/3) * 70 + 100
    
    local group = EzSVG.Group():translate(x, y)

    local text
    for r=-90,0,0.5 do
        text = EzSVG.Text(i, 0, 0, {
            fill= EzSVG.rgb(0, 255 - (r*-3), r + 90),
            font_family= "Arial Rounded MT Bold",
            font_size= "40px"
        }):rotate(r)
        
        group:add(text)
    end
    
    group:add(text:setStyle({stroke="#FFFFFF", fill="#AAFF00"}))

    svg:add(group)
end

svg:writeTo("example1.svg")