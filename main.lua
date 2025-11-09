Class = require 'libraries.classic.classic'
Test = require 'objects.Test'

function love.load()
  image = love.graphics.newImage('resources/cat.jpg')
  love.window.setMode(800, 600, {resizable=true, vsync=0})
  local object_files = {}
  recursiveEnumerate('objects', object_files)
  requireFiles(object_files)
end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(image, love.math.random(0,800), love.math.random(0,600), 0, 0.5, 0.5)
end

-- Recursively enumerate all files in given folder
-- Then adds them as strings to a table
function recursiveEnumerate(folder, file_list)
  local items = love.filesystem.getDirectoryItems(folder)
  for _, item in ipairs(items) do
    local file = folder .. '/' .. item
    if love.filesystem.isFile(file) then
      table.insert(file_list, file)
    elseif love.filesystem.isDirectory(file) then
      recursiveEnumerate(file, file_list)
    end
  end
end

function requireFiles(files)
  for _, file in ipairs(files) do
    local file = file:sub(1,-5)
    require(file)
  end
end


