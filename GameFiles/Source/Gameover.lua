function Gameover_Load()
  require "Source/CollisionHandler"
  require "Source/MainGame"
  
  gameoverScreen = love.graphics.newImage("sprites/gameover.png")
  buttonPressSound = love.audio.newSource("Sounds/ButtonPress.wav")
  
  highscores.add("0", score)
  highscores.save()
end

function Gameover_Update(dt)

end

function Gameover_Draw()
  love.graphics.draw(gameoverScreen, 0, 0)
end

function Gameover_mousepressed(x, y, button)
    if mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) then

      if (mute == false) then
      buttonPressSound:play()
      end

      Menu_Load()

      gamestate = "startScreen"
    end
end