------------------------------------------------------------------------------
Enemies= {}
function Enemies:load()
        Enemies:loadAssets()

  
      jumpingPlant = {}
      
    jumpingPlant.health = 100
    jumpingPlant.speed = 100
    jumpingPlant.name = "jumpingPlant"
    jumpingPlant.state = "jump"
    
    jumpingPlant.colliderOffsetX = -173
    jumpingPlant.colliderOffsetY = -185
    jumpingPlant.colliderWidth = 90
    jumpingPlant.colliderHeight = 110
    jumpingPlant.scale = .5
    
    jumpingPlant.jumpAmount = -500
      
    jumpingPlant.x = 1
    jumpingPlant.y = 1
   
   --jumpingPlant.draw = love.graphics.draw(Enemies.animation.draw, 1, 1, 0, .5, .5, Enemies.animation.width, Enemies.animation.height)
  
  
  
  enemyTypes = {
    

    jumpingPlant
  }
  
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function createEnemy()
  
  enemyToCopy = enemyTypes[1]
  local newEnemy = {
      print("speed = ", enemyToCopy.speed),
      print("name = ", enemyToCopy.name),
      print("y = ", enemyToCopy.y),
      print("x = ", enemyToCopy.x),
      
      gravity = 5,
    --onGround = false,
    --xVelocity = 0,
    --yVelocity = 0,
      hp = enemyToCopy.health,
      name = enemyToCopy.name,
      speed = enemyToCopy.speed,
      x = enemyToCopy.x,
      y = enemyToCopy.y,
  }
     newEnemy.collider = {
      colliderOffsetX = enemyToCopy.colliderOffsetX,
      colliderOffsetY = enemyToCopy.colliderOffsetY,
        x = enemyToCopy.x + enemyToCopy.colliderOffsetX,
        y = enemyToCopy.y + enemyToCopy.colliderOffsetY,
        w = enemyToCopy.colliderWidth,
        h = enemyToCopy.colliderHeight
        }

  return newEnemy
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function Enemies:update(dt)
  Enemies:animate(dt)
  Enemies:setState()

  
  for index, enemy in ipairs(Enemies) do
  updateEnemy(enemy, dt)
  end

  
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function updateEnemy(enemy, dt)
enemy.collider.x = enemy.x + enemy.collider.colliderOffsetX
enemy.collider.y = enemy.y + enemy.collider.colliderOffsetY

end



------------------------------------------------------------------------------
------------------------------------------------------------------------------
function Enemies:loadAssets()
  Enemies.animation = {timer = 0, rate = 0.1}
  Enemies.animation.jump = {total = 19, current = 0, image = {}}
  for i = 0, Enemies.animation.jump.total do
      Enemies.animation.jump.image[i] = love.graphics.newImage("Assets/PlantAnimations/PlantJump/JumpPlant_000"..i..".png")
end

  Enemies.animation.draw = Enemies.animation.jump.image[1]
  Enemies.animation.width = Enemies.animation.draw:getWidth()
  Enemies.animation.height = Enemies.animation.draw:getHeight()
  
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function Enemies:animate(dt)
     Enemies.animation.timer = Enemies.animation.timer + dt
  if Enemies.animation.timer > Enemies.animation.rate then
    Enemies.animation.timer = 0
    Enemies:setNewFrame()
    end
  
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function jumpingPlantMovement()
  
  end


------------------------------------------------------------------------------
------------------------------------------------------------------------------
function Enemies:setNewFrame()
  local enemAnim = Enemies.animation[jumpingPlant.state]
  if enemAnim.current < enemAnim.total then
     enemAnim.current = enemAnim.current + 1
     
  else
    enemAnim.current = 1
  end
  Enemies.animation.draw = enemAnim.image[enemAnim.current]
end


------------------------------------------------------------------------------
------------------------------------------------------------------------------
 function Enemies:setState()

  jumpingPlant.state = "jump"

 end
 
------------------------------------------------------------------------------
------------------------------------------------------------------------------

 function drawEnemy(enemy)

  love.graphics.draw(Enemies.animation.draw, enemy.x, enemy.y, 0, .5, .5, Enemies.animation.width, Enemies.animation.height)
  

end
------------------------------------------------------------------------------
------------------------------------------------------------------------------

function drawColliderEnemy(enemy)
  
  love.graphics.rectangle("line", enemy.collider.x, enemy.collider.y, enemy.collider.w, enemy.collider.h)
  
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------

function takeDamage(enemy)
  if enemy == nil then
    print("no enemy hit")
    else
  enemy.hp = enemy.hp - projectiles.damage
  print(enemy.hp)
  if enemy.hp <= 0 then
    table.remove(Enemies, newEnemy)
    end
  end
  end