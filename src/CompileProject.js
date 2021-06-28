const glob = require("glob")
const {promisify}=require("util")
const childprocess=require("child_process")
const nexec=promisify(childprocess.exec)
glob("./**/*.coffee",async (error,things) => {
    if(error) throw new Error("Error")
    for(const file of things){
        await nexec(`coffee -c ${file}`).catch((error) => console.log((error)))
    }
    console.log("完成！")
})