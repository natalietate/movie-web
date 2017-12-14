class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    get_group
  end

  def new
    get_user
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
      if @group.save
        redirect_to group_path(@group)
      else
        render 'new', notice: 'Oops!'
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
