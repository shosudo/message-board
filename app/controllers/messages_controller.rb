class MessagesController < ApplicationController
  def index
    #@--- = インスタンス変数
    @message = Message.new
    #Get all messages
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path, notice:'saved a message'
  end
  
  private
  def message_params
    params.require(:message).permit(:name,:body)
  end
end
