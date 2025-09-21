local request = http.get("https://raw.githubusercontent.com/JoonasKajava/ftb_cc/refs/heads/master/reactor/startup.lua")
local code = request.readAll()

local file = fs.open("reactor.lua", "w") 
file.write(code)

request.close()
file.close()

shell.run("reactor.lua")

