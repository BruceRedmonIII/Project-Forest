
  health = {}
function health:load()
  health.state = "healOne"
  
  health.healthOneX = 85
  health.healthOneY = 75
  health.healthOneScale = .19
  
  health.healthTwoX = 145
  health.healthTwoY = 75
  health.healthTwoScale = .19
  
  health.healthThreeX = 205
  health.healthThreeY = 75
  health.healthThreeScale = .19
    
  heartFrame = {}
  heartFrame.x = 210
  heartFrame.y = 89
  heartFrame.scale = .2
  heartFrame.image = love.graphics.newImage("Assets/Character/BasicHearts/Backgrounds/Blue 4.png")
  heartFrameWidth = heartFrame.image:getWidth()
  heartFrameHeight = heartFrame.image:getHeight()
  health:loadAssets()
  
end

function health:update(dt)
    health:setState()
    health:animate(dt)
end



function health:setState()
  
  
end

function health:increase()
  
  
  
end



function health:decrease()
  
  
  
end


function health:loadAssets()
  health.animation = {timer = 0, rate = 0.05}
  health.animation.healOne = {total = 41, current = 1, image = {}}
  for i = 1, health.animation.healOne.total do
      health.animation.healOne.image[i] = love.graphics.newImage("Assets/Character/BasicHearts/HeartFill/HeartFillSpliceFolder/HeartFillSplice_"..i..".png")
    end
      health.animation.healTwo = {total = 41, current = 1, image = {}}
      for i = 1, health.animation.healTwo.total do
      health.animation.healTwo.image[i] = love.graphics.newImage("Assets/Character/BasicHearts/HeartFill/HeartFillSpliceFolder/HeartFillSplice_"..i..".png")
    end
      health.animation.healThree = {total = 41, current = 1, image = {}}
      for i = 1, health.animation.healThree.total do
      health.animation.healThree.image[i] = love.graphics.newImage("Assets/Character/BasicHearts/HeartFill/HeartFillSpliceFolder/HeartFillSplice_"..i..".png")
    end

  health.animation.draw = health.animation.healOne.image[1]
  health.animation.width = health.animation.draw:getWidth()
  health.animation.height = health.animation.draw:getHeight()
  
end

function health:animate(dt)
  health.animation.timer = health.animation.timer + dt
  if health.animation.timer > health.animation.rate then
    health.animation.timer = 0
    health:setNewFrame()
    end
  
end


function health:setNewFrame()
  local anim = health.animation[health.state]
  if anim.current < anim.total then
     anim.current = anim.current + 1
  else
    anim.current = 41
  end
  health.animation.draw = anim.image[anim.current]
end

function health:draw()
  if player.lives >= 1 then
  love.graphics.draw(health.animation.draw, health.healthOneX, health.healthOneY, 0, health.healthOneScale, health.healthOneScale, health.animation.width, health.animation.height)
end
if player.lives >= 2 then
  love.graphics.draw(health.animation.draw, health.healthTwoX, health.healthTwoY, 0, health.healthTwoScale, health.healthTwoScale, health.animation.width, health.animation.height)
end
if player.lives == 3 then
  love.graphics.draw(health.animation.draw, health.healthThreeX, health.healthThreeY, 0, health.healthThreeScale, health.healthThreeScale, health.animation.width, health.animation.height)
  end
end
