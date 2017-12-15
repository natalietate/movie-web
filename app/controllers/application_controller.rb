class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :check_group_member

  def check_group_member
    group = Group.find_by(id: params[:id])
    unless group.in?(current_user.groups)
      redirect_to root_path, notice: 'You\'re not in that group!'
    end
  end

end
