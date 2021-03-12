class ChatroomsController < ApplicationController
    before_action :authenticate_user!
  
    def index
        @chatrooms = current_user.rooms.includes(:messages).order("messages.created_at desc")
    end
  
    def create
        @chatroom = Room.create
        @joinCurrentUser = Entry.create(user_id: current_user.id, room_id: @room.id)
        @joinUser = Entry.create(join_room_params)
        @first_message = @chatroom.messages.create(user_id: current_user.id, message: "初めまして！")
        redirect_to chatroom_path(@room.id)
    end
  
    def show
        @room = Room.find(params[:id])
        if Entry.where(user_id: current_user.id, chatroom_id: @chatroom.id).present?
            @messages = @room.messages.includes(:user).order("created_at asc")
            @message = Message.new
            @entries = @room.entries
        else
            redirect_back(fallback_location: root_path)
        end
    end
  
    private
    def join_room_params
        params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
    end
  
  end
