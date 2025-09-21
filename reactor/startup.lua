local max_energy = 9000000

local reactor = peripheral.wrap("left")

local function control()
    local energy = reactor.getEnergyStored()
    local per = energy / max_energy
    return per * 100
end

while(reactor.getActive())
do
    local c = control()
    print(c)
    reactor.setAllControlRodLevels(c)
    sleep(1)
end
