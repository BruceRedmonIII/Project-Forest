require("projectiles")
require("enemies")
require("player")
require("titlescreen")
require("health")
require ("gameover")
require ("levels")

function love.load()
  
  --drawDebug = true
  gameStart = false
  table.remove(Enemies, newEnemy)
  table.remove(Enemies, newEnemy)
  table.remove(Enemies, newEnemy)
  remainingTime = 60
  backgroundMusic = love.audio.newSource('Assets/Audio/Searching For Time - Telecasted.mp3', 'stream')
  backgroundMusic:setVolume(.003)
  
  playerJumpNoise = love.audio.newSource('Assets/Audio/Jump8.wav', 'static')
  playerJumpNoise:setVolume(.3)
  
  projectileNoise = love.audio.newSource('Assets/Audio/laser_Shoot6.wav', 'static')
  projectileNoise:setVolume(.3)
  
  damageNoise = love.audio.newSource('Assets/Audio/Hit_Hurt2.wav', 'static')
  damageNoise:setVolume(.5)

    
love.physics.setMeter(64) 
world = love.physics.newWorld(0, 9.81*64, true)
world:setCallbacks(beginContact, endContact)

player:load()
projectiles:load()
Enemies:load()
titlescreen:load()
health:load()
gameover:load()
levels:load()
 
 
 
 map.rightWallCollider = {
  x = 1024,
  y = 0,
  w = 10,
  h = 768,
 }
 
 
 
 map.leftWallCollider = {
  x = -10,
  y = 0,
  w = 10,
  h = 768,
}
 
 map.groundCollider = {}
 map.groundCollider.x = -1000
 map.groundCollider.y = 1000
 map.groundCollider.w = 5025
 map.groundCollider.h = 100
 
 map.backgroundImage = love.graphics.newImage('Assets/ForestBackground.jpg')
 
 map.backgroundImage = love.graphics.newImage('Assets/ForestBackground.jpg')
 
 map.tilesImage = love.graphics.newImage('Assets/MossyTileset/Tiles.png')
 
 map.floatingTilesImage = love.graphics.newImage('Assets/MossyTileset/FloatingPlatforms.png')
 
 floatingTileWidth, floatingTileHeight = map.floatingTilesImage:getDimensions()
 tileWidth, tileHeight = map.tilesImage:getDimensions()
 
 grassGround = {}
 grassGroundOffsetX = -225
 grassGroundOffsetY = -230
 grassGround.grassGroundQuad = love.graphics.newQuad(10, 10, 1500, 1470, tileWidth, tileHeight)
 grassX = love.graphics.getWidth() / 2
 grassY = love.graphics.getHeight() / 2 
 
 
 
 grassTallTile = {}
   grassTall1X = 3000
   grassTall1Y = 3000
   grassTallOffsetX = -70
   grassTallOffsetY = -220
  grassTallTile.grassTallQuad = love.graphics.newQuad(1568, 10, 450, 1490, tileWidth, tileHeight)
   
   grassTallTile.physics1 = {}
   
   grassTallTile.physics1.body = love.physics.newBody(world, grassTall1X, grassTall1Y, "static")
   grassTallTile.physics1.shape = love.physics.newRectangleShape(90, 370)
   grassTallTile.physics1.fixture = love.physics.newFixture(grassTallTile.physics1.body, grassTallTile.physics1.shape, 1)
   
 
 
 
 grassGround.physics1= {}
 
 grassGround1X = 300
 grassGround1Y = 300
 grassGround.physics1.body = love.physics.newBody(world, grassGround1X, grassGround1Y, "static")
 grassGround.physics1.shape = love.physics.newRectangleShape(400, 400)
 grassGround.physics1.fixture = love.physics.newFixture(grassGround.physics1.body, grassGround.physics1.shape, 1)
 
 
 grassGround.physics2 = {}
 grassGround2X = 300
 grassGround2Y = 300
 grassGround.physics2.body = love.physics.newBody(world, grassGround2X, grassGround2Y, "static")
 grassGround.physics2.shape = love.physics.newRectangleShape(400, 400)
 grassGround.physics2.fixture = love.physics.newFixture(grassGround.physics2.body, grassGround.physics2.shape, 1)
 
 
 
 floatingGrassSquare = {}

floatingGrassSquareXOffset = -70
floatingGrassSquareYOffset = -60

 floatingGrassSquare.floatingGrassSquareQuad = love.graphics.newQuad(10, 520, 420 , 450, floatingTileWidth, floatingTileHeight)
 floatingGrassX = love.graphics.getWidth() / 2
 floatingGrassY = love.graphics.getHeight() / 2
 
 
 floatingGrassSquare.physics1 = {}
 
 
 
 floatingGrassSquareX = 300
 floatingGrassSquareY = 300
 
 floatingGrassSquare.physics1.body = love.physics.newBody(world, floatingGrassSquareX,  floatingGrassSquareY, "static")
 floatingGrassSquare.physics1.shape = love.physics.newRectangleShape(77, 77)
 floatingGrassSquare.physics1.fixture = love.physics.newFixture(floatingGrassSquare.physics1.body, floatingGrassSquare.physics1.shape, 1)
 
  floatingGrassSquare.physics2 = {}
 
 
 floatingGrassSquareX2 = 3000
 floatingGrassSquareY2 = 3000
 
 floatingGrassSquare.physics2.body = love.physics.newBody(world, floatingGrassSquareX2,  floatingGrassSquareY2, "static")
 floatingGrassSquare.physics2.shape = love.physics.newRectangleShape(77, 77)
 floatingGrassSquare.physics2.fixture = love.physics.newFixture(floatingGrassSquare.physics2.body, floatingGrassSquare.physics2.shape, 1)
 
end


function syncMapPhysics()

  floatingGrassSquare.physics1.body:setX(floatingGrassSquareX)
  floatingGrassSquare.physics1.body:setY(floatingGrassSquareY)
  
  floatingGrassSquare.physics2.body:setX(floatingGrassSquareX2)
  floatingGrassSquare.physics2.body:setY(floatingGrassSquareY2)
  
  grassGround.physics2.body:setX(grassGround2X)
  grassGround.physics2.body:setY(grassGround2Y)
  
  grassGround.physics1.body:setX(grassGround1X)
  grassGround.physics1.body:setY(grassGround1Y)
  
  grassTallTile.physics1.body:setX(grassTall1X)
  grassTallTile.physics1.body:setY(grassTall1Y)
  
end


function drawGroundCollider()
  love.graphics.rectangle("line", map.groundCollider.x, map.groundCollider.y, map.groundCollider.w, map.groundCollider.h)
  
end

function drawRightWallCollider()
  love.graphics.rectangle("line", map.rightWallCollider.x, map.rightWallCollider.y, map.rightWallCollider.w, map.rightWallCollider.h)
  
end

function drawLeftWallCollider()
  love.graphics.rectangle("line", map.leftWallCollider.x, map.leftWallCollider.y, map.leftWallCollider.w, map.leftWallCollider.h)
  
  end


function spawnSingleEnemy(x, y)
  
  local newEnemy = createEnemy()
  newEnemy.x = x
  newEnemy.y = y
  
  table.insert(Enemies, newEnemy)
  
  end


function love.update(dt)
  if gameStart == false then
  else
  backgroundMusic:play()
  if player.lives == 0 then
      backgroundMusic:stop()
  else

player:update(dt)
world:update(dt)
projectiles:update(dt)
Enemies:update(dt)
health:update(dt)
syncMapPhysics()
if levels.levelNumber < 7 then
levels:gameTimer(dt)
end

if overlaps(player.collider, map.leftWallCollider) then
  if levels.levelNumber > 1 and levels.levelNumber < 7 then
  print("level is ", levels.levelNumber)
  player.left = true
  player.entered = false
  levels.levelNumber = levels.levelNumber - 1
  table.remove(Enemies, newEnemy)
  table.remove(Enemies, newEnemy)
  player:resetPosition()
  levels:updateStartingPosition()
  spawnedEnemies = false
else
  if player.xVelocity < 0 then 
    player.xVelocity = 0
  end
end
end


if overlaps(player.collider, map.rightWallCollider) then
  if levels.levelNumber < 7 then
  if levels.highestLevel <= levels.levelNumber then
    levels.highestLevel = levels.highestLevel + 1
  end
  table.remove(Enemies, newEnemy)
  table.remove(Enemies, newEnemy)
  player.entered = true
  player.left = false

  levels.levelNumber = levels.levelNumber + 1
  print("level is ", levels.levelNumber)
  print("highest level is = ", levels.highestLevel)
  levels:updateStartingPosition()
  player:resetPosition()
  spawnedEnemies = false
  else
    if player.xVelocity > 0 then 
    player.xVelocity = 0
  end
end
end
if overlaps(player.collider, map.groundCollider) then
  player:resetPosition()
  player.lives = player.lives - 1
    damageNoise:play()
  print("fell")
  end
for _, enemy in ipairs(Enemies) do
    if overlaps(enemy.collider, player.collider) then
      print(player.lives)
      player.lives = player.lives - 1
        damageNoise:play()
      print(player.lives)
      player:resetPosition()
      end
    
    for _, proj in ipairs(projectiles) do
        -- Check overlap
        if overlaps(proj.collider, enemy.collider) then
           if projectiles.state == "flying" then
             print("collided")
            projectiles.state = "hit"
            takeDamage(enemy)
            proj.speed = 0
           -- table.remove(projectiles, newProj)
        end
        end
        end
    end
end
end
end

function love.draw()
  
if gameStart == false then
  titlescreen:draw()
else
  
  if player.lives == 0 then
gameover:draw()
backgroundMusic:stop()
else

levels:draw()

player:draw()

health:draw()

    for index, enemy in ipairs(Enemies) do
      drawEnemy(enemy)
    end
    
     for index, proj in ipairs(projectiles) do
          drawProjectile(proj)
     end

     if drawDebug == true then
          for index, proj in ipairs(projectiles) do
               drawColliderProjectile(proj)
          end

         for index, enemy in ipairs(Enemies) do
             drawColliderEnemy(enemy)
         end
         
           drawRightWallCollider()
          drawLeftWallCollider()
         drawGroundCollider()
    drawColliderPlayer(player)
   end
--[[
for _, body in pairs(world:getBodies()) do
    for _, fixture in pairs(body:getFixtures()) do
        local shape = fixture:getShape()

        if shape:typeOf("CircleShape") then
            local cx, cy = body:getWorldPoints(shape:getPoint())
            love.graphics.circle("fill", cx, cy, shape:getRadius())
        elseif shape:typeOf("PolygonShape") then
            love.graphics.polygon("line", body:getWorldPoints(shape:getPoints()))
        else
            love.graphics.line(body:getWorldPoints(shape:getPoints()))
        end
        
    end
end
]]--
end
end
end
function beginContact(a, b, collision)
  player:beginContact(a, b, collision)
end


function endContact(a, b, collision)
  player:endContact(a, b, collision)
  
end

function love.keypressed(key, dt)
  if (key == "escape" and levels.levelNumber == 7) then
      backgroundMusic:stop()
      love.load()
      end
  
  if key == "p" then
    print("X = ", player.x)
    print("Y = ", player.y)
    print("startingX is = ", player.startingPositionX)
    print("startingY is = ", player.startingPositionY)
    print("leavingX is = ", player.leavingPositionX)
    print("leavingY is = ", player.leavingPositionY)
    end
    if (key == "escape" and player.lives == 0) then
      backgroundMusic:stop()
      love.load()
      player.lives = 3
    end
  player:jump(key)
  GameStart(key)
  player:wallJump(key)
  --player:dash(key)
     if key == 'space' then
       if player.projectileAmount >= 1 then
          projectileNoise:play()
          local newProj = createProjectile()
          player.projectileAmount = 0
          table.insert(projectiles, newProj)
        else
          print("no ammo")
          
     end
     end
  end
  
function deleteProjectiles()
    player.projectileAmount = 1
  table.remove(projectiles, newProj)
end

function overlaps(colliderA, colliderB)
     local tooFarLeft = (colliderB.x + colliderB.w < colliderA.x)
     local tooFarRight = (colliderB.x > colliderA.x + colliderA.w)
     local tooFarUp = (colliderB.y + colliderB.h < colliderA.y)
     local tooFarDown = (colliderB.y > colliderA.y + colliderA.h)

     local overlapping = not (tooFarLeft or tooFarRight or tooFarUp or tooFarDown)

   return overlapping
end