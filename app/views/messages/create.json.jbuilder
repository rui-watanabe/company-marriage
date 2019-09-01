json.content @message.content
json.avatar url_for(@message.user.avatar)
json.date @message.created_at.strftime("%Y/%m/%d %H:%M")