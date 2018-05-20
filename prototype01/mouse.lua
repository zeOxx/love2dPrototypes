Mouse = Class{}

function Mouse:init(x, y)
	self.position = { x = x, y = y }

	self.crosshairSprite = love.graphics.newImage('assets/sprites/crosshair.png')
end

function Mouse:getMiddlePosition()
	return {
		x = self.position.x + camera.position.x + (self.crosshairSprite:getWidth() / 2),
		y = self.position.y + camera.position.y + (self.crosshairSprite:getHeight() / 2)
	}
end

function Mouse:updatePosition(dx, dy)
	self.position.x = self.position.x + (dx / RATIO)
	self.position.y = self.position.y + (dy / RATIO)
end

function Mouse:updatePositionFromPlayerMovement(dx, dy)
	self.position.x = self.position.x + dx
	self.position.y = self.position.y + dy
end

function Mouse:draw()
	if GAME_STATE == 'GAME' then
		love.graphics.draw(self.crosshairSprite, self.position.x, self.position.y)
	end
end

function Mouse:drawDebug()
	debugHelper:drawText('mouseX: ' .. self.position.x)
	debugHelper:drawText('mouseY: ' .. self.position.y)
end