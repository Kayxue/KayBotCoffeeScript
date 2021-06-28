glob = require "glob"
exports.default=class ListenersManager
  constructor:(client) ->
    this.client=client
    console.log(client)
    this.loadListener()

  loadListener:() ->
    return new Promise (resolve,reject) =>
      glob "./Listener/Listeners/**/*.js", (errors,listeners) =>
        if errors
          return reject(errors)
        for listener in listeners
          listenerClass=require(listener).default
          listenerInstance=new listenerClass(this.client)
          info=listenerInstance.getInfo()
          console.log("----------------")
          console.log(this)
          if info.type == "once"
            this.client.once(info.event,(args...) => listenerInstance.handle(args...))
          else
            this.client.on(info.event,(args...) => listenerInstance.handle(args...))
        resolve()
