# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
  end

  def unsubscribed
    current_user.away
  end

  def away
    current_user.away
  end

  def appear
    current_user.appear
  end
end
