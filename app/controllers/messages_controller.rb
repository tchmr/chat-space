class MessagesController < ApplicationController
  before_action :get_current_user_groups, only: [:index, :create]
  before_action :get_group

  def index
    @message = Message.new
    @messages = get_messages
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = get_messages
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
  params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def get_group
    @group = Group.find(params[:group_id])
  end

  def get_messages
    @group.messages.includes(:user)
  end
end
