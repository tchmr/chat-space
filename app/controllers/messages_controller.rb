class MessagesController < ApplicationController
  before_action :get_current_user_groups, only: :index

  def index
    @groups = current_user.groups
  end

  def create
  end
end
