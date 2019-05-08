json.name @message.user.name
json.body @message.body
json.image @message.image
json.time @message.created_at.strftime("%Y/%m/%d(%a) %H:%M:%S")