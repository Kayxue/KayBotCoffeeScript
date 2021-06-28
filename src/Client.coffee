{ Client,Collection } = require "discord.js"
ListenerManagers = require("./ListenersManager").default

exports.default = class MyClient extends Client
  constructor:(token) ->
    super({})
    this.token=token
    this.listenerManager=new ListenerManagers(this)

  start:() ->
    this.login(this.token)