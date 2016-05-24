cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('00 00 10 * * *', () ->
    robot.send {room: "#random"}, "おはようございます！"
  ).start()
