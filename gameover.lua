
gameover = {}
function gameover:load()
  
  
  gameOver = love.graphics.newImage('Assets/gameOverScreen.jpg')
  titleFont = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid.ttf', 100)
  titleFontFront = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid front.ttf', 100)
  titleFontBack = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid back.ttf', 100)
  titleFontShine = love.graphics.newFont('Assets/fonts/iomanoid/iomanoid shine.ttf', 100)
  
  end






function gameover:draw()
  local x = 0
  local y = 100
  love.graphics.draw(gameOver, 0, 0, 0, .72, .72)
  
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.setFont(titleFont)
  love.graphics.print('Game Over! Press escape', x, y)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontBack)
  love.graphics.print('Game Over! Press escape', x, y)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.setFont(titleFontFront)
  love.graphics.print('Game Over! Press escape', x, y)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(titleFontShine)
  love.graphics.print('Game Over! Press escape', x, y)
    love.graphics.reset()
  
end

function gameover:update()
  
  
end