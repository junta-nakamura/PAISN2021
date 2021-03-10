class MessagesController < ApplicationController
  
  def new
    @message = Message.new
  end

  def create
    # @experience =   Experience.find(params[:id])
    @message = Message.create(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, experience_id: params[:experience_id])
  end
end


# experienceのidの取得方法がわからない