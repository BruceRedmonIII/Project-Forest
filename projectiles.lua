require("player")


    projectiles = {}

function projectiles:load()
  
  projectiles.blueFire = love.graphics.newImage('Assets/Animatedfireball/blue/keyframes/1.png')
  blueFireWidth = love.graphics.getWidth() / 2
  blueFireHeight = love.graphics.getHeight() / 2
  projectiles.blueFireQuad = love.graphics.newQuad(0, 196, 400, 45, blueFireWidth, blueFireHeight)
  projectiles.direction = "right"
  projectiles.state = "flying"
  projectiles.damage = 50
  
  projectiles:loadAssets()
  end

function projectiles:update(dt)
  projectiles:setDirection()
  projectiles:setState()
  projectiles:animate(dt)
  
  for index, proj in ipairs(projectiles) do
  updateProjectile(proj, dt)
  end
end

function updateProjectile(proj, dt)
  -- Remember, multiplying by dt here means that the speed is in pixels
  -- per second (150)
    proj.x = proj.x + proj.speed * dt
    proj.collider.x = proj.collider.x + proj.speed * dt
    proj.timeAlive = proj.timeAlive + dt
    if projectiles.state == "flying" and proj.timeAlive > proj.maxTimeAlive then
      deleteProjectiles()
        projectiles.state = "flying"
        print("despawned")
      end
end

function projectiles:loadAssets()
  projectiles.animation = {timer = 0, rate = 0.1}
  projectiles.animation.flying = {total = 6, current = 1, image = {}}
  for i = 1, projectiles.animation.flying.total do
      projectiles.animation.flying.image[i] = love.graphics.newImage("Assets/Animatedfireball/blue/keyframes/"..i..".png")
end
  projectiles.animation.hit = {total = 10, current = 1, image = {}}
  for i = 1, projectiles.animation.hit.total do
      projectiles.animation.hit.image[i] = love.graphics.newImage("Assets/Animatedfireball/blue/blueExplosionOne/1BlueExplosion_"..i..".png")

end
    
  projectiles.animation.draw = projectiles.animation.flying.image[1]
  projectiles.animation.width = projectiles.animation.draw:getWidth()
  projectiles.animation.height = projectiles.animation.draw:getHeight()
  
end


function projectiles:animate(dt)
  projectiles.animation.timer = projectiles.animation.timer + dt
  if projectiles.animation.timer > projectiles.animation.rate then
    projectiles.animation.timer = 0
    projectiles:setNewFrame()
    end
  
end

function projectiles:setNewFrame()
  local projAnim = projectiles.animation[projectiles.state]
  if projAnim.current < projAnim.total then
     projAnim.current = projAnim.current + 1
           if projectiles.animation.hit.current == 10 then
        deleteProjectiles()
        projectiles.state = "flying"
        print("dead")
        projAnim.current = 1
        end
  else
    projAnim.current = 1
  end
  projectiles.animation.draw = projAnim.image[projAnim.current]
end

function projectiles:setDirection()
  if player.xVelocity < 0 then
    projectiles.direction = "left"
  else if player.xVelocity > 0 then
    projectiles.direction = "right"
  end
end
end

function projectiles:setState()
  

end


function createProjectile()
  
          if projectiles.direction == "right" then
          speed = 700
          direction = -.2
          iY = 15
          iX = 100
          inverseWidth = projectiles.animation.width
          inverseHeight = projectiles.animation.height
          print("right")
        elseif projectiles.direction == "left" then
          speed = -700
          direction = .2
          iY = 0
          iX = 0
          inverseWidth = 1
          inverseHeight = 1
          print("left")
        end
        
        
     local newProj = {
          x = player.x,
          y = player.y,
          speed = speed,
          direction = direction,
          state = "flying",
          maxTimeAlive = 1,
          timeAlive = 0
          
           }
          if projectiles.direction == "right" then
            colliderDirection = 1
          else
            colliderDirection = -1.45
            end
           newProj.collider = {
          x = newProj.x + 71 * colliderDirection,
          y = newProj.y - 23,
          w = 30,
          h = 25,
           }
           
           newProj.explosion = {
             explosionOffsetX = 100,
             explosionOffsetY = 100,
             
             
             }


     return newProj
end

function drawColliderProjectile(proj)
    love.graphics.rectangle("line", proj.collider.x, proj.collider.y, proj.collider.w, proj.collider.h)

end

function drawProjectile(proj)
if proj.state == "flying" then
  love.graphics.draw(projectiles.animation.draw, proj.x+iX, proj.y+iY, 0, direction, direction, projectiles.animation.width/inverseWidth, projectiles.animation.height/inverseHeight)
  elseif proj.state == "hit" then
  love.graphics.draw(projectiles.animation.draw, proj.x+newProj.explosion.explosionOffsetX, proj.y+newProj.explosion.explosionOffsetX, 0, direction, direction, projectiles.animation.width/inverseWidth, projectiles.animation.height/inverseHeight)
  end
     --Scaling the projectile up by 2x
     --love.graphics.draw(projectiles.blueFire, proj.x+50, proj.y+10, 0, direction, direction)
end

--[[function keypressedGame(key)
     -- ...
     if key == 'space' then
       if player.projectileAmount > 1 then
         player.projectileAmount = 0
          testProj = createProjectile()
        else
          print("no ammo")
          end
     end
end
]]--
