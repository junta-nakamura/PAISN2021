class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
      if user_signed_in?
        @currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
        unless @user.id == current_user.id
          @currentUserEntry.each do |cu|
          @userEntry.each do |u|
          if cu.room_id == u.room_id
                @haveRoom = true
                @roomId = cu.room_id
              end
            end
          end
          unless @haveRoom
            @room = Room.new
            @entry = Entry.new
          end
        end
      end
  end
end 