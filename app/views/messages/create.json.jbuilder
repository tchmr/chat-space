json.id @message.id
json.name @message.user.name
json.body @message.body
json.image @message.image
json.user_id @message.user_id
json.group_id @message.group_id
json.time @message.created_at.strftime("%Y/%m/%d(%a) %H:%M:%S")