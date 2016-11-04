function love.load()
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  require "Source/PlayerController"
  require "Source/Gameover"
    
  mainGameMusic = love.audio.newSource("Sounds/GameMusic2.mp3")
  menuMusic = love.audio.newSource("Sounds/GameMusic1.mp3")
  gameOverSound = love.audio.newSource("Sounds/GameOver.wav")
 
  
  gamestate = "startScreen"
  
  Menu_Load()
  MainGame_Load()
  Map_Load()
  MainGame_Load()
  Gameover_Load()
end

function love.draw()
love.graphics.setColor(255, 255,255)
  if(gamestate == "startScreen") then
    mainGameMusic:pause()
    menuMusic:play()
    menuMusic:setLooping(true)
    
    Menu_Draw()
    
  elseif(gamestate == "game") then
    menuMusic:pause()
    mainGameMusic:play()
    mainGameMusic:setLooping(true)
    
    Map_Draw()
    MainGame_Draw()
    
  elseif(gamestate == "death") then
    mainGameMusic:pause()
    gameOverSound:play()
    
    Gameover_Draw()
    
  elseif(gamestate == "scores") then
    
  end
  
end

function love.update(dt)
  if(gamestate == "startScreen") then
    
    Menu_Update()
    
  elseif(gamestate == "game") then
    
    MainGame_Update(dt)
    Map_Update(dt)
    
  elseif(gamestate == "death") then
    
    Gameover_Update()
    
  elseif(gamestate == "scores") then
    
  end

end

function love.mousepressed(x, y, button)
  if gamestate == "startScreen" then
    Menu_mousepressed(x,y,button)
  elseif gamestate == "game" then
    Player_mousepressed(x, y, button)
  elseif gamestate == "death" then
    Gameover_mousepressed(x, y, button) 
  end
end

function love.mousereleased(x, y, button)
  if gamestate == "starscreen" then
  
  elseif gamestate == "game" then
    Player_mousereleased(x, y, button)
  end
end

function love.keypressed(key)
  if key == "escape" then
    gamestate = "startScreen"
  end
end


