class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast  'hanger_channel',
                                   message: render_message(message),
                                   conversation_id: message.conversation_id,
                                   recipient_id: message.recipient_id,
                                   sender_id: message.sender_id,
                                   creator_id: message.haunt_id,
                                   ntitle: generate_ntitle(message),
                                   nbody:  generate_nbody(message),
                                   message_id: message.id
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message, haunt: nil })
    end

    def generate_ntitle(message)
      ["New message from", message.display_haunt_name].join(' ')
    end

    def generate_nbody(message)
      return [message.content[0..40], "..."].join() if message.content.length > 40
      return message.content
    end
end

