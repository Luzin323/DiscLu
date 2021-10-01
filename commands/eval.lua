return{
name = "eval",
args = true,
run = function(msg, args, r)

run = load([[
local s = {}
function s.run(msg, args, r)
]]..table.concat(args, " ")..[[
end
return s
]])
run = run()
exe, run = pcall(run.run, msg, args, require)
p(msg.author.name)
p(table.concat(args, " "))
if not exe then
return msg:reply("```txt\n"..run.." ```")
end
return 
end
	}