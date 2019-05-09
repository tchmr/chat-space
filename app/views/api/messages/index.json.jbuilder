json.array! @new_messages do |message|
  json.body message.body
  json.image message.image
  json.time format_posted_time(message.created_at)
  json.user_name message.user.name
  json.id message.id
end