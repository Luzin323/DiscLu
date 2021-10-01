Class = require("discordia").class
BClient = require("discordia").Client
require"lfs"
local flatdb = require 'flatdb'
  
Client, get, set = Class("LuClient", BClient)


local discordia = require('discordia')
discordia.extensions()

function reload(name, path)
if package.loaded[name] then
package.loaded[name] = nil
end 
return require(path) 
end

function Client:__init(token)
BClient.__init(self)
self:run("Bot " .. token)
require("site")
self._commands = require("Array")({})
self._db = flatdb('./assets/db')

self:on("messageCreate", function(msg)
if not msg.author.bot then require("execute")(msg, self) end 
end)

for file in lfs.dir("commands") do
if file:endswith(".lua") then
name = file:gsub(".lua", "")

self._commands:push(reload(name, lfs.currentdir().."/commands/"..name))
end

    end

end

function get.db(self)
 self._db:save()
 return self._db
end

function get.commands(self)
 return self._commands
end

return Client