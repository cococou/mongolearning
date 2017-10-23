db.users.save({name:'coco',age:27,process:'root'})   # "users" 下的条款 ，也可以是其它自定义的条款
db.users.insert({name:'mingliang',process:'root',age:18})
db.users.insert({'chunchun':'root',process:'root',age:30})
db.users.update({name:'mingliang',process:'root',age:18},{name:'mingliang',process:'guest',age:18}) #change users authority

######操作符#######
##$gte $lte $ne $in $noin $and $nor $or $ne $size $push $exists $mod $all

db.users.find()      #print all items under "users"
db.users.find({},{name:1,age:1,_id:0})    #指定键名且值为1或者true则是查询结果中显示的键；若值为0或者false，则为不显示键。文档中的键若在参数中没有指定，查询结果中将不会显示（_id例外）  
db.users.find({process:'root'})

#比较操作符"$gt" 、"$gte"、 "$lt"、 "$lte" 、 "$ne"(分别对应">"、 ">=" 、"<" 、"<="、"!=")，
db.users.find({age:{$gt:20}})      #年龄大于20的user
db.users.find({age:{$lt:20}})      #年龄大于20的user
db.users.find({ age: {$gt:15 ,$lt:21} })
db.user.find( { age: {$ne:18} } )

db.users.remove({})  

show collections #可以访问到 db 下的条款

start = new Date("1990/01/01")
db.users.insert({"name":"xiaoming","age":20,"sex":"male",date:start})
db.users.insert({"name":"xiaohong","age":22,"sex":"female"})
db.users.insert({"name":"lilei","age":24,"sex":null})

#$in"判断键值是否为null,"$exists"判定集合中文档是否包含该键。
db.users.find({sex:{$in:[null],$exists:true }})
db.users.find({sex:null})                      #注意但是当不存在时会返回所有文档信息

db.users.insert({"name":"t3","amount":58,"tags":[ "bag", "school", "book" ]})
db.users.find({"tags.1":"school"})               #第二个元素为“school”的字段
db.users.find({tags:{$all:["book"]}})            #"tags" 中含有"book"的字段
db.users.find( { age: {$all:[18]}} )             #等价于下面一条
db.users.find( { age: 18} )

db.users.find( { age: { $in: [ 18, 22 ] } } )  #age为18和22
db.users.find( { age: { $nin: [ 18, 22 ] } } ) #age不为18和22

db.users.find({age:{$lt:50},sex:"male"})       #多个筛选条件,和下面的等价
db.users.find({ $and : [{ age:{ $lt :50 },sex:"male" }] }) #值可以True or False 为又和没有
db.users.find({ $nor : [{ age:{ $lt :50 },sex:"male" }] })  #选择出都不满足该数组中所有表达式的文档
db.users.find( { age: { $not: { $gt: 50 } } } ) #若无匹配项则返回所有的

db.users.find({$or :[{sex:"female"},{age:{$gt:50}}]}) #满足其中一个
db.users.find({sex:{$exists:false}})                  #返回键值不存在的列表
db.users.find( { amount: { $exists: false } } )       #但是若整个库中不存在amount这个键时，返回全部的结果

db.users.find({age:})

#按长度查询
db.users.find({tags:{$size:3}})                 #没有[] 不适用，必须制定一个定值，不能接受一个范围值，
 
#计数
db.users.update({ $push : {field: value}, $inc ：{count ： 1}})
 
#日期
start = new Date("1990/01/01")
db.users.find({"birthday" ： {"$lt" ： start}})

