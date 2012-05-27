 -- include the library
EzSVG = require "EzSVG"

 -- create a document
local doc = EzSVG.Document(1000, 1000)

 -- set styling for all new created elements
EzSVG.setStyle({
    stroke_width= 2,
    stroke= "black"
})

for d=0,1000,100 do
    -- create a circle
    local circle = EzSVG.Circle(d, d, d/10)
    -- add circle to the doc
    doc:add(circle)
     -- set a fill color
    circle:setStyle("fill", EzSVG.rgb(d/4, 0, 0))
end

-- you can also set a single style
EzSVG.setStyle("stroke", "green")

-- create a group (very handy, also stays a group in Inkscape/Illustrator)
local group = EzSVG.Group()

for r=0,360, 10 do
    -- create a line and add a transform (rotation with r degrees, centered on 500/500)
    local line = EzSVG.Line(100, 500, 900, 500):rotate(r, 500, 500)
    -- add it to the group
    group:add(line)     
end

-- add the group to the document
doc:add(group)

-- clear the style
EzSVG.clearStyle()

-- create a path object and set its styling
local path = EzSVG.Path({
    stroke = "blue",
    stroke_width = 2,
    fill = EzSVG.RadialGradient():addStop(0, "black"):addStop(100, "yellow"),
    fill_opacity = "0.8"
})

-- draw the path
path:moveToA(500, 500)
    :sqCurveTo(300,300)
    :sqCurveTo(-200, 0)
    :sqCurveTo(-200, -400)
    :sqCurveToA(500, 500)
    
-- add path to the doc
doc:add(path)

-- add text to doc, add a path and style it
doc:add(EzSVG.Text(
    "It's so ez to draw some lines, it's so easy to draw some lines ..."
):setPath(path):setStyle({
    font_size= 60,
    font_family= "Arial",
    fill= "#CCCCCC",
    stroke= "black"
}))

 -- generate the svg and write to file
doc:writeTo("doc-example.svg")