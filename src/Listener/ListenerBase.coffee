exports.default = class Listener
  getInfo:() ->
    throw new Error("No Command Info Provide!")

  handle:() ->
    throw new Error("No Handle Method Provide!")
