Class = require 'libraries.classic.classic'

function love.load()
  local object_files = {}
  recursiveEnumerate('objects', object_files)
  requireFiles(object_files)
  hyperCircle = HyperCircle(400, 300, 50, 10, 120)
end

function love.update(dt)

end

function love.draw()
  hyperCircle:draw()
end

-- Recursively enumerate all files in given folder
-- Then adds them as strings to a table
function recursiveEnumerate(folder, file_list)
  local items = love.filesystem.getDirectoryItems(folder)
  for _, item in ipairs(items) do
    local file = folder .. '/' .. item
    if love.filesystem.getInfo(file).type == "file" then
      print("Found: " .. file)
      table.insert(file_list, file)
    elseif love.filesystem.getInfo(file).type == "directory" then
      recursiveEnumerate(file, file_list)
    end
  end
end

function requireFiles(files)
  for _, file in ipairs(files) do
    local module_name = file:sub(1,-5)
    local parts = {}
    for part in string.gmatch(module_name, "[^/]+") do
      table.insert(parts, part)
    end
    local short_name = parts[#parts]
    _G[short_name] = require(module_name)
  end
end


