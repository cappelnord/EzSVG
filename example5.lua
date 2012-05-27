EzSVG = require "EzSVG"

local dim = 1000
local step = 50

doc = EzSVG.Document(dim, dim, "white")
group = EzSVG.Group()

for y=0,dim,step do
    local path = EzSVG.Polyline({0, y, 500, y/2, 1000, 1000-y}, {
        fill="none",
        stroke="black",
        stroke_width=1
    })
    group:add(path)
end

doc:add(group)
doc:add(EzSVG.Use(group):rotate(180, 500, 500))
doc:add(EzSVG.Use(group):rotate(90, 500, 500))
doc:add(EzSVG.Use(group):rotate(270, 500, 500))

doc:add(EzSVG.Rect(0,0,dim,dim, 0, 0, {fill="none", stroke="black", stroke_width="5"}))

doc:writeTo("example5.svg")