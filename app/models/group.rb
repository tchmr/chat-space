class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  has_many :messages

  def show_latest_message
    if (latest_message = messages.last).present?
      latest_message.body? ? latest_message.body : '画像が投稿されています'
    else
      'まだメッセージはありません'
    end
  end

end
