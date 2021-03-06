DebugHelper = Class{}

function DebugHelper:init()
	self:resetValues()
end

function DebugHelper:update()
	self:resetValues()
end

function DebugHelper:resetValues()
	self.x = 5
	self.y = 5
	self.spaceBetweenY = 10
end

function DebugHelper:drawText(text)
	love.graphics.print(text, self.x, self.y)
	self.y = self.y + self.spaceBetweenY
end

function DebugHelper:draw()
	if GAME_STATE == GAME_STATES.game then
		self:drawPlayerMouseLine()
	end
end

function DebugHelper:drawPlayerMouseLine()
	love.graphics.setColor(1, 0, 0, 1)
	local playerPos = player:getScreenPosition()
	local mousePos = mouse:getMiddlePosition()
	love.graphics.line(playerPos.x, playerPos.y, mousePos.x, mousePos.y)

	love.graphics.setColor(0, 1, 0, 1)
	love.graphics.rectangle('fill', (playerPos.x + mousePos.x) / 2, (playerPos.y + mousePos.y) / 2, 1, 1)
end

function DebugHelper:printTable(table)
	for index, data in ipairs(table) do
		print(index)

		for key, value in pairs(data) do
			print('\t', key, value)
		end
	end
end