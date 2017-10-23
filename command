db.users.save({name:'coco',age:27,process:'root'})   # "users" 下的条款 ，也可以是其它自定义的条款
db.users.insert({name:'mingliang',process:'root',age:18})
db.users.insert({'chunchun':'root',process:'root',age:30})
db.users.update({name:'mingliang',process:'root',age:18},{name:'mingliang',process:'guest',age:18}) #change users authority

db.users.find()      #print all items under "users"
db.users.find({},{name:1,age:1,_id:0})    #指定键名且值为1或者true则是查询结果中显示的键；若值为0或者false，则为不显示键。文档中的键若在参数中没有指定，查询结果中将不会显示（_id例外）  
db.users.find({process:'root'})

#比较操作符"$gt" 、"$gte"、 "$lt"、 "$lte" 、 "$ne"(分别对应">"、 ">=" 、"<" 、"<="、"!=")，
db.users.find({age:{$gt:20}})      #年龄大于20的user
db.users.find({age:{$lt:20}})      #年龄大于20的user
db.users.find({ age: {$gt:15 ,$lt:21} })
db.user.find( { age: {$ne:18} } 

db.users.remove({})  

show collections #可以访问到 db 下的条款

start = new Date("1990/01/01")
db.users.insert({"name":"xiaoming","age":20,"sex":"male",date:start})
db.users.insert({"name":"xiaohong","age":22,"sex":"female"})
db.users.insert({"name":"lilei","age":24,"sex":null})

#$in"判断键值是否为null,"$exists"判定集合中文档是否包含该键。
db.users.find({sex:{$in:[null],$exists:true }})
db.users.find({sex:null})                      #注意但是当不存在时会返回所有文档信息

#日期
start = new Date("1990/01/01")
db.users.find({"birthday" ： {"$lt" ： start}})

