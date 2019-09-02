# Description:
#   Commands that may be useful in composing chained commands
# Commands:
#   sleep t <message> - sleep for t milliseconds then print a message
#
# Author:
#   Jack Ellenberger <jellenberger@uchicago.edu>

module.exports = (robot) ->
  robot.respond /(?:sleep|wait) (\d* ?)(.*)?/i, (request) ->
    message = request.match[2] || "done"
    length = parseInt request.match[1], 10
    sleep length
    request.send message

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms
