return{
name = "thread",
args = true, 
run = function(msg, args)
payload = "/channels/"..msg.channel.id.."/messages/"..msg.id.."/threads" 
msg.client._api:request("POST", payload, {
name = table.concat(args, " ")
})

end
}