Client=require("./Client").default
{token}=require("./Config.json")
MyClient = new Client(token)
MyClient.start()