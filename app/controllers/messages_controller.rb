class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def index
    @message = Message.order('RANDOM()').first
    render json: { message: @message.text }
    puts
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
