function love.load ()
  SCALE = 1
  OFFSET_X = 0
  OFFSET_Y = 0
  IMASK = 75
  ISLANDS = false
  ICAP = 1
  
  map = {}
  
  gen = require("generator")
  
  for i = 0, 100, 1
  do
    map[i] = {}
    
    for j = 0, 100, 1
    do
      map[i][j] = 0
    end
  end
  
  gen.noise(map, SCALE, OFFSET_X, OFFSET_Y, ISLANDS, IMASK, ICAP)
end

function love.keypressed (key)
  if key == "t" then
    ISLANDS = not ISLANDS
  end
end

function love.update (dt)
  if love.keyboard.isDown("up") then
    OFFSET_Y = OFFSET_Y - 60 * dt
  end
  
  if love.keyboard.isDown("down") then
    OFFSET_Y = OFFSET_Y + 60 * dt
  end
  
  if love.keyboard.isDown("left") then
    OFFSET_X = OFFSET_X - 60 * dt
  end
  
  if love.keyboard.isDown("right") then
    OFFSET_X = OFFSET_X + 60 * dt
  end
  
  if love.keyboard.isDown("[") then
    SCALE = SCALE - 0.01 * dt * 60
  end
  
  if love.keyboard.isDown("]") then
    SCALE = SCALE + 0.01 * dt * 60
  end
  
  if love.keyboard.isDown("o") then
    IMASK = IMASK - 1 * dt * 60
  end
  
  if love.keyboard.isDown("p") then
    IMASK = IMASK + 1 * dt * 60
  end
  
  if love.keyboard.isDown("i") then
    ICAP = ICAP - 0.01 * dt * 60
  end
  
  if love.keyboard.isDown("k") then
    ICAP = ICAP + 0.01 * dt * 60
  end
  
  gen.noise(map, SCALE, OFFSET_X, OFFSET_Y, ISLANDS, IMASK, ICAP)
end

function love.draw ()
  for i = 0, 100, 1
  do    
    for j = 0, 100, 1
    do
      if map[i][j] < 1 then
        love.graphics.setColor(map[i][j], map[i][j], map[i][j])
      end
      
      if map[i][j] < .75 then
        love.graphics.setColor(.75, .5, map[i][j] / 2.)
      end
      
      if map[i][j] < .5 then
        love.graphics.setColor(map[i][j], 1, 0)
      end
      
      if map[i][j] < .32 then
        love.graphics.setColor(1, 1, 0)
      end
      
      if map[i][j] < .27 then
        love.graphics.setColor(0, 1, 1)
      end
      
      if map[i][j] < .23 then
        love.graphics.setColor(0, map[i][j] * 2, 1)
      end
      
      
      --love.graphics.setColor(map[i][j], map[i][j], map[i][j])
      
      love.graphics.rectangle("fill", j * 5, i * 5, 5, 5)
    end
  end
end