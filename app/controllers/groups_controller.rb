class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :get_current_user_groups, only: :index

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save(group_params)
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    @group.name = group_params[:name]
    @group.user_ids = group_params[:user_ids]
    if @group.save
      redirect_to root_path, notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
