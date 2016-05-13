# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class HangerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "hanger_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create! content: data['message'], haunt_id: current_haunt.id, conversation_id: data['conversation_id']
  end
end
