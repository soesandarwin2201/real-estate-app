class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams 
    stream_from "chat_#{params[:user_id]}#{params[:recipient_id]}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
