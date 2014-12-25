class UsersController < ApplicationController
  def user_profile
    @user = User.find_by_id(params[:id])
  end
end
