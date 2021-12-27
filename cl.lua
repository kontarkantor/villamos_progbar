local running = false

local baseX = 0.5
local baseY = 0.8

local baseWidth = 0.27
local baseHeight = 0.03

function StartProgBar(label, time)
    if not running then
        local startTime = GetGameTimer()
        running = true
        local remaring = time
        while remaring > 0 do
            Wait(0)
            remaring = time - (GetGameTimer() - startTime)
            DrawRect(baseX, baseY, baseWidth + 0.006, baseHeight + 0.006, 0, 0, 0, 100)
            DrawRect(baseX, baseY, baseWidth * ( remaring / time ), baseHeight, 0, 129, 186, 255)
            SetTextFont(4)
            SetTextScale(0.5, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextCentre(1)
            SetTextEntry("STRING")
            AddTextComponentString(label)
            DrawText( baseX, baseY - 0.015 )
        end
        running = false
    end
end

RegisterCommand('progtest', function()
    StartProgBar('Test..', 5000) --time in ms
end)
