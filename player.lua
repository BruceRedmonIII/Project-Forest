
player = {}


function player:load()
  player.gameover = false
  player.startingPositionX = 80
  player.startingPositionY = 570
  
  player.leavingPositionX = 700
  player.leavingPositionY = 600
  
  player.entered = true
  player.left = false
  
  player.x = 30
  player.y = 300
  player.width = 20
  player.height = 60
  player.xVelocity = 0
  player.yVelocity = 0
  player.maxSpeed = 350
  player.acceleration = 4000
  player.friction = 3500
  player.gravity = 1500
  player.jumpAmount = -500
  player.onGround = false
  player.scale = .5
  player.direction = "right"
  player.state = "idle"
  player.dashSpeed = 1000
  player.particleX = 0
  player.particleY = 0
  player.projectileAmount = 1
  player.lives = 3
  player.wallJumpReady = false
  
  player.collider = {}
  player.collider.x = 0
  player.collider.y = 0
  player.collider.colliderOffsetX = -20
  player.collider.colliderOffsetY = -60
  player.collider.w = 46.545454
  player.collider.h = 116.363636
  
  characterImage = love.graphics.newImage("Assets/Character/BlueWizard/2BlueWizardWalk/Chara_BlueWalk00000.png")
  playerWidth, playerHeight = characterImage:getDimensions()
  
  
  player.physics = {}
  
  
  player.physics.body = love.physics.newBody(world, player.x, player.y, "dynamic")
  player.physics.body:setFixedRotation(true)
  player.physics.shape = love.physics.newRectangleShape((playerWidth * player.scale)/5.5, (playerHeight * player.scale)/2.2)
  player.physics.fixture = love.physics.newFixture(player.physics.body, player.physics.shape)
  
  player:loadAssets()
--  player:loadEffects()
end

function player:resetPosition()
  if player.entered == true and player.left == false then
    x = player.startingPositionX
    y = player.startingPositionY
  elseif player.entered == false and player.left == true then
    x = player.leavingPositionX
    y = player.leavingPositionY
  end
  print(player.entered)
  print(player.left)
  player.x = x
  player.y = y
  player.collider.x = x + player.collider.colliderOffsetX
  player.collider.y = y + player.collider.colliderOffsetY
  player.physics.body:setX(player.x)
  player.physics.body:setY(player.y)

  
end

function player:setDirection()
  if player.xVelocity < 0 then
    player.direction = "left"
  else if player.xVelocity > 0 then
    player.direction = "right"
  end
end
end

function player:wallJump(key)
  if player.direction == "right" and key == "w" and player.onGround == false and player.wallJumpReady == true and player.yVelocity >= 0 then
    print("wall jump1")
  player.direction = "left"
  player.xVelocity = -600
  player.yVelocity = -600
  playerJumpNoise:play()
 else
  if player.direction == "left" and key == "w" and player.onGround == false and player.wallJumpReady == true and player.yVelocity >= 0 then
    print("wall jump2")
  player.direction = "right"
  player.xVelocity = 600
  player.yVelocity = -600
  playerJumpNoise:play()
end
end
  end
function player:loadAssets()
  player.animation = {timer = 0, rate = 0.1}
  player.animation.run = {total = 19, current = 0, image = {}}
  for i = 0, player.animation.run.total do
      player.animation.run.image[i] = love.graphics.newImage("Assets/Character/BlueWizard/2BlueWizardWalk/Chara_BlueWalk0000"..i..".png")
    end
    player.animation.idle = {total = 19, current = 0, image = {}}
  for i = 0, player.animation.idle.total do
      player.animation.idle.image[i] = love.graphics.newImage("Assets/Character/BlueWizard/2BlueWizardIdle/Chara - BlueIdle0000"..i..".png")
   end
  
    player.animation.jump = {total = 7, current = 0, image = {}}
  for i = 0, player.animation.jump.total do
      player.animation.jump.image[i] = love.graphics.newImage("Assets/Character/BlueWizard/2BlueWizardJump/CharaWizardJump_0000"..i..".png")
  end 
  
 --[[     player.animation.dash1 = {total = 15, current = 0, image = {}}
  for i = 0, player.animation.jump.total do
      player.animation.dash1.image[i] = love.graphics.newImage("Assets/Character/BlueWizard/2BlueWizardJump/Dash2/DashBlue_0000"..i..".png")
  end 
  ]]--
  player.animation.draw = player.animation.idle.image[1]
  player.animation.width = player.animation.draw:getWidth()
  player.animation.height = player.animation.draw:getHeight()
  
end

function player:animate(dt)
  player.animation.timer = player.animation.timer + dt
  if player.animation.timer > player.animation.rate then
    player.animation.timer = 0
    player:setNewFrame()
    end
  
end
--[[
function player:loadEffects()
  player.animationEffects = {timer = 0, rate = 0.1}
  player.animationEffects.tpFX = {total = 5, current = 1, imageEffects = {}}
  for i = 1, player.animationEffects.tpFX.total do
    player.animationEffects.tpFX.imageEffects[i] = love.graphics.newImage("Assets/Character/BlueWizard/fireFX/png/blue/start/burning_start_"..i..".png")
  end
  
  player.animationEffects.draw = player.animationEffects.tpFX.imageEffects[1]
  player.animationEffects.width = player.animationEffects.draw:getWidth()
  player.animationEffects.height = player.animationEffects.draw:getHeight()
  end
function player:animateEffects(dt)
    player.animationEffects.timer = player.animationEffects.timer + dt
  if player.animationEffects.timer > player.animationEffects.rate then
    player.animationEffects.timer = 0
    end
end
]]--

function player:setNewFrame()
  local anim = player.animation[player.state]
  if anim.current < anim.total then
     anim.current = anim.current + 1
  else
    anim.current = 0
  end
  player.animation.draw = anim.image[anim.current]
  end

function player:update(dt)
  if gameStart == false then
    else
    player:setState()
    player:setDirection()
    player:animate(dt)
 -- player:animateEffects(dt)
    player:syncPhysics()
    player:movement(dt)
    player:applyGravity(dt)
    end
end

function player:applyGravity(dt)
  if not player.onGround then
    player.yVelocity = player.yVelocity + player.gravity * dt
  end
end

function player:beginContact(a, b, collision)
  print("collision")
  if player.onGround == true then return end
  if not player.onGround then player.wallJumpReady = true
  else 
    player.wallJumpReady = false
end
    local X, Y = collision:getNormal()
      if a == player.physics.fixture then
        if Y > 0 then
          player:land(collision)
        elseif Y < 0 then
          player.yVelocity = 0
        end
      elseif b == player.physics.fixture then
         if Y < 0 then
        player:land(collision)
      elseif Y > 0 then
        player.yVelocity = 0
    end
  end
end


function player:land(collision)
  player.groundCollision = collision
  player.yVelocity = 0
  player.onGround = true

end

function player:endContact(a, b, collision)
  player.wallJumpReady = false
    if a == player.physics.fixture or b == player.physics.fixture then
    if player.groundCollision == collision then
        player.onGround = false
      end
  end
end


function drawColliderPlayer(player)
  
  love.graphics.rectangle("line", player.collider.x, player.collider.y, player.collider.w, player.collider.h)
  
end


function player:syncPhysics()
  player.x = player.physics.body:getX()
  player.y = player.physics.body:getY()
  player.physics.body:setLinearVelocity(player.xVelocity, player.yVelocity)
  
  player.collider.x = player.x + player.collider.colliderOffsetX
  player.collider.y = player.y + player.collider.colliderOffsetY
  
  
  

  
end

function player:jump(key)
  if (key == "w" or key == "up") and player.onGround == true then
      playerJumpNoise:play()
    player.yVelocity = player.jumpAmount
  player.onGround = false
  end
end
function player:movement(dt)
  if love.keyboard.isDown("a", "left") then
    if player.xVelocity > -player.maxSpeed then
      if player.xVelocity - player.acceleration * dt > -player.maxSpeed then
      player.xVelocity = player.xVelocity - player.acceleration * dt
    else
      player.xVelocity = -player.maxSpeed
      end
     end
  elseif love.keyboard.isDown("d", "right") then
          if player.xVelocity < player.maxSpeed then
            if player.xVelocity + player.acceleration * dt < player.maxSpeed then
          player.xVelocity = player.xVelocity + player.acceleration * dt
        else
      player.xVelocity = player.maxSpeed
     end
    end
  else
    player:applyFriction(dt)
 end
end

--[[
function player:dash(key)
  saveXvel = player.xVelocity
    if key == "lshift" and player.direction == "right" and player.state == "jump" then
      print(particleX, particleY)
      player.physics.body:setPosition(player.x+200, player.y)
  print("tp right")
  elseif key == "lshift" and player.direction == "left" and player.state == "jump" then
      player.physics.body:setPosition(player.x-200, player.y)
      print("tp left")
end
end
]]--

function player:setState()
  
  
  if not player.onGround then
    player.state = "jump"
  elseif player.xVelocity == 0 then
    player.state = "idle"
  else
    player.state = "run"
  end
end




function player:applyFriction(dt)
  if player.xVelocity > 0 then
    if player.xVelocity == player.xVelocity - player.friction * dt then
      player.xVelocity = player.xVelocity - player.friction * dt
    else
      player.xVelocity = 0
    end
  elseif player.xVelocity < 0 then
    if player.xVelocity + player.friction * dt < 0 then
      player.xVelocity = player.xVelocity + player.friction * dt
    else
      player.xVelocity = 0
    end
  end
end

function player:draw()
  local scaleX = 1
  local inverse = 1
  if player.direction == "left" then
    inverse = player.animation.width
    scaleX = -1
  end
  love.graphics.draw(player.animation.draw, player.x+130, player.y+115, 0, player.scale * scaleX, player.scale, player.animation.width/inverse, player.animation.height)
--  love.graphics.draw(player.animationEffects.draw, player.particleX+130, player.particleY+115, 0, player.scale * scaleX, player.scale, player.animationEffects.width,    player.animationEffects.height)
    
    
end
