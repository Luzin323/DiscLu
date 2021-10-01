  return {
    name = "say",
run = function(msg, args)
      if msg.client.owner ~= msg.author then return end
text = table.concat(args, " ")
data = {
        content = text
      }
if msg.attachments then
data.files = {} 
for name, file in pairs(msg.attachments) do

result, body = require("coro-http"). request("GET", file.url)
table.insert(data.files, {file.filename, body})
end
end
msg:reply(data)
msg:delete()
    end
  }