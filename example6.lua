-- Pattern Interface needs some work ... don't use yet!
-- Also this example needs some work :-)

EzSVG = require "EzSVG"

doc = EzSVG.Document(1000, 1000)

pattern1 = EzSVG.Pattern(0, 0, 20, 20, nil, "userSpaceOnUse")
pattern1:add(EzSVG.Rect(0, 0, 20, 20, 0, 0, {fill="white"}))
pattern1:add(EzSVG.Circle(10, 10, 3, {fill="black", stroke="none"}))
pattern1:add(EzSVG.Polyline({0,0,0,20,20,20, 0, 0}, {stroke="black", fill="none"}))

pattern2 = EzSVG.Pattern(0, 0, 50, 50, nil, "userSpaceOnUse")
pattern2:add(EzSVG.Rect(0, 0, 50, 50, 0, 0, {fill="white"}))
pattern2:add(EzSVG.Circle(25, 25, 9, {fill="black", stroke="none"}))
pattern2:add(EzSVG.Polyline({0,0, 0, 50, 50, 0}, {stroke="black", fill="none"}))

doc:add(EzSVG.Circle(500,500,400, {fill=pattern1, stroke="black", stroke_width="10"}))
doc:add(EzSVG.Circle(500,500,200, {fill=pattern2, stroke="none"}))

doc:writeTo("example6.svg")
