return function(client)
client:on("timer", function(user, msg)
msg:reply("Oi " .. user.name)
			end)
end