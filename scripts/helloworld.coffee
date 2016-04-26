module.exports = (robot) ->
  robot.respond /hello/i, (msg) ->
    msg.send 'World!'

module.exports = (robot) ->
  robot.respond /おでん/, (msg) ->
    msg.send '─□○△'