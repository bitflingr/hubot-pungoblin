# Description:
#   Pun Goblin.  Puns are the lowest form of humor.  Perfect for goblins!
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_PUN_GOBLIN_TRIGGERS comma-separated list of additional "tiggers"
#
# Commands:
#   mentioning puns - summons pun goblin
#
# Notes:
#   See triggers array for list of trigger phrases
#
# Author:
#   Jarrett Irons <jarrett.irons@gmail.com> (https://github.com/bitflingr)
#   Morgan Wigmanich <okize123@gmail.com> (https://github.com/okize)

images = require './data/images.json'
jargon = require './data/triggers.json'

removeTerm = (term, arrayToDeleteFrom) ->
  index = arrayToDeleteFrom.indexOf term
  if index > -1
    arrayToDeleteFrom.splice index, 1
    return arrayToDeleteFrom

if process.env.HUBOT_PUN_GOBLIN_TRIGGERS?
  additionalTriggers = (process.env.HUBOT_PUN_GOBLIN_TRIGGERS).split(',')
  triggers = triggers.concat(additionalTriggers)

regex = new RegExp triggers.join('|'), 'gi'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.send msg.random images
