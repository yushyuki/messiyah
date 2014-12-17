class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    if current_user
      @messages = Message.where(user_id: current_user.id).uniq_by(&:customer_id)
    elsif current_customer
      @messages = Message.where(customer_id: current_customer.id).uniq_by(&:user_id)
    end
  end

  def show
    if current_user
      @messages = current_user.messages.where(customer_id: @message.customer_id)
    elsif current_customer
      @messages = current_customer.messages.where(user_id: @message.user_id)
    end
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = current_customer.messages.build(message_params)
    if @message.save
      flash[:success] = "message created!"
      @posts=Post.all
      redirect_to root_path
    else
      redirect_to new_message_path
    end
  end

  def reply
    if current_user
      @message = current_user.messages.build(reply_params)
      if @message.save
        flash[:success] = "message created!"
        redirect_to messages_path
      else
        redirect_to @message
      end
    elsif current_customer
      @message = current_customer.messages.build(reply_params)
      if @message.save
        flash[:success] = "message created!"
        redirect_to messages_path
      else
        redirect_to @message
      end
    end
  end

  def update
    @message.update(message_params)
  end

  def destroy
    @message.destroy
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :customer_id)
    end

    def reply_params
      params.require(:message).permit(:content, :user_id, :customer_id)
    end
end
