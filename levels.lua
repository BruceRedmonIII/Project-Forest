levels = {}



function levels:gameTimer(dt)
  remainingTime = remainingTime - dt
  if remainingTime <= 0 then
    player.lives = 0
    end
  
  
end

function levels:gameTimerDraw()
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print(string.format(math.floor(remainingTime)), 900, 10)
end

function levels:load()
  
   map = {}
 
   
 map.tilesImage = love.graphics.newImage('Assets/MossyTileset/Tiles.png')
 
 map.floatingTilesImage = love.graphics.newImage('Assets/MossyTileset/FloatingPlatforms.png')
  
  levels.levelNumber = 1
  spawnedEnemies = false
  
  levels.highestLevel = 1
  
  
end


function levels:updateStartingPosition()
  
  if levels.levelNumber == 1 then
    player.startingPositionX = 80
    player.startingPositionY = 570
end
  if levels.levelNumber == 2 then
    player.startingPositionX = 96
    player.startingPositionY = 540
    
    player.leavingPositionX = 859
    player.leavingPositionY = 564
end
  if levels.levelNumber == 3 then
    player.startingPositionX = 89
    player.startingPositionY = 438
    
    player.leavingPositionX = 963
    player.leavingPositionY = 330
  end
    if levels.levelNumber == 4 then
    player.startingPositionX = 65
    player.startingPositionY = 650
    
    player.leavingPositionX = 840
    player.leavingPositionY = 620
  end
      if levels.levelNumber == 5 then
    player.startingPositionX = 65
    player.startingPositionY = 650
    
    player.leavingPositionX = 850
    player.leavingPositionY = 520
  end
        if levels.levelNumber == 6 then
    player.startingPositionX = 65
    player.startingPositionY = 650
    
    player.leavingPositionX = 920
    player.leavingPositionY = 620
  end
        if levels.levelNumber == 7 then
    player.startingPositionX = 65
    player.startingPositionY = 650
    
    player.leavingPositionX = 920
    player.leavingPositionY = 620
  end
end
function gameWon()
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFont)
  love.graphics.print('Congratulations!', 100, 100)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontBack)
  love.graphics.print('Congratulations!', 100, 100)
  
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFontFront)
  love.graphics.print('Congratulations!', 100, 100)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontShine)
  love.graphics.print('Congratulations!', 100, 100)
  love.graphics.reset()
    
    
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFont)
  love.graphics.print('Press escape to restart', 0, 300)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontBack)
  love.graphics.print('Press escape to restart', 0, 300)
  
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFontFront)
  love.graphics.print('Press escape to restart', 0, 300)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontShine)
  love.graphics.print('Press escape to restart', 0, 300)
  love.graphics.reset()
  
    love.graphics.setFont(tunnelsFontThin)
    love.graphics.print("You have won in " ..math.floor(60 - remainingTime).." seconds!",230, 500)
  
  player.lives = 3
  
  
  
  end
function createLevelSix()
  
love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)

grassGround1X = 0
grassGround1Y = 800

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 1100
grassGround2Y = 900

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


floatingGrassSquareX = 300
floatingGrassSquareY = 500

grassTall1X = 600
grassTall1Y = 500

love.graphics.draw(map.tilesImage, grassTallTile.grassTallQuad, grassTall1X + grassTallOffsetX, grassTall1Y + grassTallOffsetY, 0, .3, .3)

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)

floatingGrassSquareX2 = 850
floatingGrassSquareY2 = 500

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX2 + floatingGrassSquareXOffset, floatingGrassSquareY2 + floatingGrassSquareYOffset, 0, .3, .3)

if spawnedEnemies == false  and levels.highestLevel == 6 then
  spawnSingleEnemy(975, 540)
  spawnSingleEnemy(440, 540)
  spawnedEnemies = true
end


end
function createLevelSeven()
  
love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)

grassGround1X = 200
grassGround1Y = 850

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 800
grassGround2Y = 850
love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


grassTall1X = 6000
grassTall1Y = 5000

love.graphics.draw(map.tilesImage, grassTallTile.grassTallQuad, grassTall1X + grassTallOffsetX, grassTall1Y + grassTallOffsetY, 0, .3, .3)

floatingGrassSquareX = 300
floatingGrassSquareY = 400

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)

floatingGrassSquareX2 = 700
floatingGrassSquareY2 = 400

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX2 + floatingGrassSquareXOffset, floatingGrassSquareY2 + floatingGrassSquareYOffset, 0, .3, .3)


end

function createLevelFour()
  
love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)

grassGround1X = 650
grassGround1Y = 850

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 900
grassGround2Y = 180
love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


floatingGrassSquareX = 80
floatingGrassSquareY = 780

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)

floatingGrassSquareX2 = 300
floatingGrassSquareY2 = 780

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX2 + floatingGrassSquareXOffset, floatingGrassSquareY2 + floatingGrassSquareYOffset, 0, .3, .3)


end

function createLevelFive()
  
love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)

grassGround1X = -150
grassGround1Y = -40

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 1100
grassGround2Y = 900

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


floatingGrassSquareX = 80
floatingGrassSquareY = 780

grassTall1X = 300
grassTall1Y = 500

love.graphics.draw(map.tilesImage, grassTallTile.grassTallQuad, grassTall1X + grassTallOffsetX, grassTall1Y + grassTallOffsetY, 0, .3, .3)

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)

floatingGrassSquareX2 = 80
floatingGrassSquareY2 = 350

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX2 + floatingGrassSquareXOffset, floatingGrassSquareY2 + floatingGrassSquareYOffset, 0, .3, .3)


if spawnedEnemies == false and levels.highestLevel == 5 then
  spawnSingleEnemy(445, 380)
  spawnedEnemies = true
  end



end



function createLevelOne()

love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)



grassGround1X = 100
grassGround1Y = 800

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 900
grassGround2Y = 825

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


floatingGrassSquareX = 500
floatingGrassSquareY = 500

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)



if spawnedEnemies == false and levels.highestLevel == 1 then
  spawnSingleEnemy(1000, 700)
  spawnedEnemies = true
  end

end

function createLevelThree()
  
love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)

grassGround1X = 200
grassGround1Y = 700

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 900
grassGround2Y = 100

love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)


floatingGrassSquareX = 480
floatingGrassSquareY = 540

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)

floatingGrassSquareX2 = 800
floatingGrassSquareY2 = 800

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX2 + floatingGrassSquareXOffset, floatingGrassSquareY2 + floatingGrassSquareYOffset, 0, .3, .3)




end
function createLevelTwo()

love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)
--love.graphics.draw(map.backgroundImage, 0, 0, 0, .75, .75)


grassGround1X = 200
grassGround1Y = 800
love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround1X + grassGroundOffsetX, grassGround1Y + grassGroundOffsetY, 0, .3, .3)

grassGround2X = 900
grassGround2Y = 600
love.graphics.draw(map.tilesImage, grassGround.grassGroundQuad, grassGround2X + grassGroundOffsetX, grassGround2Y + grassGroundOffsetY, 0, .3, .3)

floatingGrassSquareX = 5000
floatingGrassSquareY = 5000

love.graphics.draw(map.floatingTilesImage, floatingGrassSquare.floatingGrassSquareQuad, floatingGrassSquareX + floatingGrassSquareXOffset, floatingGrassSquareY + floatingGrassSquareYOffset, 0, .3, .3)
end

function levels:draw()
if levels.levelNumber == 1 then
  createLevelOne()
elseif levels.levelNumber == 2 then
  createLevelTwo()
  elseif levels.levelNumber == 3 then
  createLevelThree()
    elseif levels.levelNumber == 4 then
  createLevelFour()
      elseif levels.levelNumber == 5 then
  createLevelFive()
        elseif levels.levelNumber == 6 then
  createLevelSix()
          elseif levels.levelNumber == 7 then
  createLevelSeven()
  gameWon()

end
levels:gameTimerDraw()
end