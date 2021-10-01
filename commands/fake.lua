return {
    name = "fake",
run = function(msg, args) 
if msg.channel:getWebhooks():__len() == 0 then 
msg.channel:createWebhook("base")
end

web = msg.channel:getWebhooks():find(function(web) if web.token then return web end end)
table.remove(args, 1)
target = msg.mentionedUsers.first
web:setName(target.name)

result, body = require("coro-http"). request("GET", target:getAvatarURL())
body = "data:image/png;base64," .. require("base64").encode(body)
print (body)
web:setAvatar(body)

local id = web.id
local token = web.token
p(id, token, web.name)
local method = "POST"
local endpoint = "/webhooks/"..id.."/"..token
local payload = {
  content = table.concat(args, " ")
}
local files = {
}
if msg.attachments then

for name, file in pairs(msg.attachments) do

result, body = require("coro-http"). request("GET", file.url)
table.insert(files, {file.filename, body})
end
end
msg.client._api:request(method, endpoint, payload, nil, files) 
msg:delete()
    end
}