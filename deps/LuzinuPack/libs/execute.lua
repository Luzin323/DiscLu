
local discordia = require('discordia')
discordia.extensions()

return function(msg, client)
if not msg.content:startswith("lu!") then return end
args = msg.content:split(" ")
command = table.remove(args, 1)
command = command:gsub("lu!", "")
cmd = client.commands:find(function(data) 
if data.name == command then
return data 
end 
end)
  
if cmd then 
if cmd.args then if #args == 0 then return msg:reply("Legal mas e os argumentos?") end end
return cmd.run(msg, args)
end


return msg:reply("Ta mas, que comando é esse?")
end