-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tapCount = 0

local balloonCount = 5
local myBackground = display.newImageRect( "./images/background.png", 360, 570 )
myBackground.x = display.contentCenterX
myBackground.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 400, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local platform2 = display.newImageRect( "platform.png", 100, 780 );
platform2.x = display.contentHeight-75;
platform2.y = 300;
print(platform2.x);



local balloon = display.newImageRect( "balloon.png", 50, 50 )
balloon.x = display.contentCenterX
balloon.y = 50
balloon.alpha = 0.8

--local balloon2 = display.newImageRect( "balloon.png", 50, 50 )
--balloon2.x = display.contentCenterX + 100
--balloon2.y = 50
--balloon2.alpha = 0.7

local balloons = {}
local currentX = 5;
local physics = require( "physics" )
physics.start()
math.randomseed(os.time())
local grav = 0.5
for i=0,balloonCount do
    grav = math.random(-5,10);
    --print(grav)
    balloons[i] = display.newImageRect( "balloon.png", 50, 50 )
    local xPlacement = math.random(50,400)
    print(xPlacement)
    balloons[i].x = xPlacement
    
    balloons[i].y = 50
    balloons[i].alpha = 0.7
    currentX = currentX + 5
    physics.addBody(balloons[i],"dynamic", { radius=25, bounce=0.3 } )
    balloons[i].gravityScale = grav
end





physics.addBody( platform, "static" )
physics.addBody(platform2, "static")

--for i=0,500 do
   
--end

physics.addBody(balloon,"dynamic", { radius=25, bounce=0.3 } )
balloon.gravityScale = 0.1

--physics.addBody(balloon2,"dynamic", { radius=25, bounce=0.3 } )
--balloon2.gravityScale = 0.5

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 120, 0, 120 ) -- either white or black

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )
