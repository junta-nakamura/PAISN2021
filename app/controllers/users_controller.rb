class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
  end
end
