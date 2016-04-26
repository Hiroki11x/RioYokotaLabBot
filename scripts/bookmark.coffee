module.exports = (robot) ->
  links = []

  robot.router.get '/hubot-bookmark/', (req, res) ->
    li = links.map (i) ->
      """
        <li><a href="#{i.url}" target="_blank">#{i.text}</a></li>
      """
    .join '\n'
    html = """
      <html>
      <head><title>Links</title></head>
      <body>
        <h1>Links</h1>
        <ul>
        #{li}
        </ul>
      </body>
      </html>
    """
    res.type 'html'
    res.send html

  robot.respond /bookmark li?st?/, (msg) ->
    msg.send links.map((i, index) -> "[#{index}] #{i.text} #{i.url}").join('\n')

  robot.respond /bookmark add (.+) (https?:\/\/.+)/, (msg) ->
    text = msg.match[1]
    url = msg.match[2]
    item = { text, url }
    links.push item
    msg.send "added #{item.text} #{item.url}"

  robot.respond /bookmark re?m(?:ove)? (\d+)/, (msg) ->
    index = msg.match[1]
    item = links.splice(index, 1)[0]
    msg.send "removed #{item.text} #{item.url}" if item?