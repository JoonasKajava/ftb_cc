local max_energy = 9000000

local reactor = peripheral.wrap("left")

local function clamp(num, min, max)
    if num < min then
        return min
    elseif num > max then
        return max
    else
        return num
    end
end

local function control()
    local energy = reactor.getEnergyStored()
    local per = energy / max_energy
    return clamp(per * 100, 0, 100)
end


while(reactor.getActive())
do
    local c = control()
    print(string.format("Power output at: %d", 100 - c))
    reactor.setAllControlRodLevels(c)
    sleep(1)
end
