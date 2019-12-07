class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャストする
   post = Post.new(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
   post.save
   ActionCable.server.broadcast 'room_channel', message: message['message'][0] # フロントへ返します
  end
end
