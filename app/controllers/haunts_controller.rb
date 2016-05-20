class HauntsController < ApplicationController
  def show
    @haunt = Haunt.find(params[:id])
    if Conversation.between(@haunt.id, current_haunt.id).present?
      @conversation = Conversation.between(@haunt.id,current_haunt.id).first
    else
      @conversation = Conversation.create!(sender_id: current_haunt.id, recipient_id: @haunt.id)
    end
    @appearances_ids = current_haunt.list.collect(&:id)

    @messages = @conversation.messages
  end
end
