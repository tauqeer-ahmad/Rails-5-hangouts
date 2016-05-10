class HauntsController < ApplicationController
  def conversation
    @haunt = Haunt.find(params[:id])
    if Conversation.between(@haunt.id, current_haunt.id).present?
      @conversation = Conversation.between(@haunt.id,current_haunt.id).first
    else
      @conversation = Conversation.create!(sender_id: current_haunt.id, recipient_id: @haunt.id)
    end

    redirect_to @conversation
  end
end
