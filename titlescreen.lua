titlescreen = {}
function titlescreen:load()
  menuSelection = 1
  backGround = love.graphics.newImage('Assets/ForestBackground.jpg')
  titleFont = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid.ttf', 100)
  titleFontFront = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid front.ttf', 100)
  titleFontBack = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid back.ttf', 100)
  titleFontShine = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid shine.ttf', 100)
  
  tunnelsFontRegular = love.graphics.newFont('Assets/fonts/TunnelsRegular.otf', 100)
  tunnelsFontThin = love.graphics.newFont('Assets/fonts/TunnelsRegular.otf', 70)
  
end


function titlescreen:draw()
if gameStart == false and menuSelection == 1 then
showTitle(150, 100)
elseif gameStart == false and menuSelection == 2 then
showInstructions()
elseif gameStart == false and menuSelection == 3 then
showChallenges()
end
end

function GameStart(key)
  print(key)
  print(menuSelection)
  
  if gameStart == false and key == "m" then
    menuSelection = 1
  else
    
    if gameStart == false and key == "i" then
    menuSelection = 2
    else
      
      if gameStart == false and key == "c" then
    menuSelection = 3
      else
    
        if gameStart == false and key == "r" then
  player:resetPosition()
  gameStart = true
        end
      end
    end
  end
end
function showTitle(x, y)
    
    --210
    --100
  love.graphics.draw(backGround, 0, 0, 0, .75, .75)
    
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFont)
  love.graphics.print('Project: Forest!', x, y)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontBack)
  love.graphics.print('Project: Forest!', x, y)
  
  love.graphics.setColor(.2, 1, .2)
  love.graphics.setFont(titleFontFront)
  love.graphics.print('Project: Forest!', x, y)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontShine)
  love.graphics.print('Project: Forest!', x, y)
  love.graphics.reset()
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('For Challenges press c', 200, 300)
  love.graphics.reset()
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('For instructions press i', 200, 400)
  love.graphics.reset()
  
      love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('To return to this menu, press m', 100, 500)
  love.graphics.reset()
  
    love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('When you are ready, press r', 150, 600)
  love.graphics.reset()
  
  
  
end

  

function showChallenges()
  love.graphics.draw(backGround, 0, 0, 0, .75, .75)
  love.graphics.setColor(0, 1, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('Easy Challenges:', 0, 0)
  love.graphics.reset()
  
  love.graphics.setColor(0, 1, 0)
  love.graphics.setFont(tunnelsFontThin)
  love.graphics.print('Beat the game', 550, 0)
  love.graphics.print('beat within 40 seconds', 550, 100)
  love.graphics.reset()
  
  
  love.graphics.setColor(0, 0, 1)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('Medium Challenges:', 0, 250)
    love.graphics.setFont(tunnelsFontThin)
  love.graphics.print('Take no damage', 550, 250)
  love.graphics.print('beat within 30 seconds', 550, 350)
  love.graphics.reset()
  
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('Hard Challenges:', 0, 550)
    love.graphics.setFont(tunnelsFontThin)
  love.graphics.print('Kill no enemies', 550, 550)
  love.graphics.print('beat within 25 seconds', 550, 650)
  love.graphics.reset()
  
end

function showInstructions()
  love.graphics.draw(backGround, 0, 0, 0, .75, .75)
  
    love.graphics.draw(backGround, 0, 0, 0, .75, .75)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(tunnelsFontRegular)
  love.graphics.print('Instructions:', 0, 0)
  love.graphics.reset()
  
  love.graphics.setColor(0, 0, 1)
  love.graphics.setFont(tunnelsFontThin)
  love.graphics.print('press W to jump, press W on walls to do a wall jump', 0, 100)
  love.graphics.print('A to go left, D to go right, spacebar to shoot', 0, 200)
  love.graphics.print('Objective: Get to the end without losing all your lives', 0, 300)
  love.graphics.print('You have 60 seconds.', 0, 400)
  love.graphics.print('TIP: You move faster after you wall jump', 0, 500)
  love.graphics.reset()
  
  
  
end