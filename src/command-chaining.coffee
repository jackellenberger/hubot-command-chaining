# Description:
#   chain hubot commands together, run multiple in sequence, use outputs as later command inputs.
# Commands:
#   <hubot command 1> && <hubot command 2> - run hubot command 2 if hubot command 1 succeeds
#   <hubot command 1> |xargs <hubot command 2> - run hubot command 2 with $1 interpolated as the output of the previous command
#
# Author:
#   Jack Ellenberger <jellenberger@uchicago.edu>

util = require 'util'
try
  {Robot,Adapter,TextMessage,User,Response} = require 'hubot'
catch
  prequire = require('parent-require')
  {Robot,Adapter,TextMessage,User,Response} = prequire 'hubot'

module.exports = (robot) ->
  robot.respond /(.*) && (.*)/i, (request) ->
    robotRegex = new RegExp robot.name, "g"
    commands = request.match[0].replace(robotRegex, '').split(" && ").map (c) ->
      return "#{robot.name} #{c.trim()}"

    for command in commands
      success = await executeCommand robot, request, command

executeCommand = (robot, request, command) ->
  sendPromise = null
  robot.listeners.forEach (listener) ->
    if match = command.match(listener.regex)
      textMessage = new TextMessage request.envelope.user, command
      newContext = new Response robot, textMessage, match
      sendPromise = new Promise (resolve) ->
        newContext.originalSend = newContext.send
        newContext.send = (str) ->
          await this.originalSend str
          resolve(true)
      listener.callback newContext
  return sendPromise
