local discordia = require('discordia')
discordia.extensions()

client = require("LuzinuPack").client(os.getenv("TOKEN"))
require("dtime")(client)

client:once("ready", function()
client.users:forEach(function(user)
if not client.db[user.id] then
client.db[user.id] = {}
end
end)
end)
