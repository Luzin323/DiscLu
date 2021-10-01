local weblit = require('weblit')
weblit.app
.bind({host = "0.0.0.0", port = 3000})
.use(weblit.logger)
.use(weblit.autoHeaders)
.route({ path = "/:name"}, function (req, res)
res.body = req.method .. " - " .. req.params.name .. "\n"
res.code = 200
res.headers["Content-Type"] = "text/html"
end)
.start()

return