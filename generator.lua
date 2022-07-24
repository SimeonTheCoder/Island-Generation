generator = {}

function generator.noise (map, scale, offset_x, offset_y, islands, imask, icap)
  for i = 0, #map, 1
  do
    for j = 0, #map[i], 1
    do
      local layer1 = love.math.noise((j+offset_x) / 20. * scale, (i+offset_y) / 20. * scale)
      local layer2 = love.math.noise((j+offset_x) / 40. * scale, (i+offset_y) / 40. * scale) * .5
      
      local layer3 = love.math.noise((j+offset_x) / 60. * scale, (i+offset_y) / 60. * scale)
      
      local dx = j - 50
      local dy = i - 50
      
      local layer4 = math.sqrt(dx * dx + dy * dy)
      
      layer4 = math.max(0, math.min(icap, 1 - layer4 / imask))
      
      if not islands then
        layer4 = 1
      end
      
      map[i][j] = (layer1 + layer2) / 1.5 * layer3 * layer4
      
      --map[i][j] = 1 - layer4 / 50.
    end
  end
end

return generator