class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    get_group
    @members = @group.users
  end

  def new
    get_user
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @join_group = @group.user_groups.build(:user_id => current_user.id)
      if @group.save
        redirect_to group_path(@group)
      else
        render 'new', notice: 'Oops!'
      end
  end

  def join
    @group = Group.find(params[:id])
    @join_group = @group.user_groups.build(:user_id => current_user.id)
      if @join_group.save
        redirect_to(@group, :notice => 'You have joined this group.')
      else
        redirect_to(@group, :notice => 'Join error.')
      end
  end

  private

    def get_user
      @user = User.find_by_id(params[:id])
    end

    def get_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:title, :description)
    end

end
