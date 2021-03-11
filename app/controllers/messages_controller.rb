class MessagesController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  # def new
  #   @message = Message.new
  # end

  # def create
  #   @message = Message.create(message_params)
  #   if @message.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private
  # def message_params
  #   params.require(:message).permit(:content).merge(user_id: current_user.id, experience_id: params[:experience_id], room_id:)
  # end
  
end

