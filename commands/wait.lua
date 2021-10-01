return{
		name = "wait",
		args = true, 
run = function(msg, args) 
require"timer".setTimeout(tonumber(args[1]), function()

msg.client:emit("timer", msg.author, msg)
end)
		end
}