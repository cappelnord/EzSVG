-- doesn't render in most applications and very slow on all others
-- Rendering the Patterns as images and then mask would be faster and smarter :-)

EzSVG = require "EzSVG"

local dim = 1000

doc = EzSVG.Document(dim, dim, "#222222")

local flowerPattern = function(image, background, num, minWidth, maxWidth)
    local group = EzSVG.Pattern(0, 0, dim, dim, nil, "userSpaceOnUse")
    
    group:add(EzSVG.Rect(0,0,dim,dim,0,0,{fill=background}))
    
    for i=0, num do
        local randCoord = function()
            return math.random() * (dim + maxWidth) - maxWidth
        end
        
        local x = randCoord()
        local y = randCoord()
        local width = math.random() * (maxWidth - minWidth) + minWidth
        
        local image = EzSVG.Image(image, x, y, width, width)
        image:rotate(math.random() * 360, x + width/2, y + width/2)
        
        group:add(image)
        
    end    
    
    return group
end

local flowers = {
    flowerPattern("img/flower1.png", "#222222", 200, 200, 300),
    -- flowerPattern("img/flower2.png"),
    flowerPattern("img/flower3.png", EzSVG.rgb(60, 159, 216), 100, 90, 170)
}

local num = 0
for r=450,50,-25 do
    doc:add(EzSVG.Circle(dim/2, dim/2, r, {
        fill = flowers[num%2 + 1],
    }))
    num = num + 1
end

doc:writeTo("example7.svg")