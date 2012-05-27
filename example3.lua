EzSVG = require "EzSVG"

local dim = 1000
local svg = EzSVG.Document(dim, dim, "white")

local paths = {}
local number = 90

local inset = 90

local textContent = EzSVG.Text("Die Gedanken sind frei, wer kann sie erraten, sie fliegen vorbei wie nächtliche Schatten. Kein Mensch kann sie wissen, kein Jäger erschießen mit Pulver und Blei: Die Gedanken sind frei!")

for i=0,number do
    local path = EzSVG.Path()
        
    local phi = (i/(number+1)*2*math.pi)
    
    local sx = math.sin(phi) * inset + (dim/2)
    local sy = math.cos(phi) * inset + (dim/2)
    
    path:moveToA(sx, sy)
    for e=0,(dim/2)-inset do
        path:lineToA(
            math.sin(e/200 + phi) * (e + inset) + dim/2,
            math.cos(e/200 + phi) * (e + inset) + dim/2
        )
    end
    
    table.insert(paths, path)
end

EzSVG.setStyle({
    fill="black",
    font_family="Arial",
    font_size=8
})


for i, v in pairs(paths) do
    local text = EzSVG.Text(EzSVG.TextRef(textContent)):setPath(v)
    svg:add(text)    
end

svg:writeTo("example3.svg") 