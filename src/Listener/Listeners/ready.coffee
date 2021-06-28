listener=require("../ListenerBase").default

exports.default = class ready extends listener
  constructor:(client) ->
    super()
    this.client=client

  getInfo:() ->
    return {
      type:"once",
      event:"ready"
    }

  handle:() ->
    console.log("#{this.client.user.tag} 已經上線！")