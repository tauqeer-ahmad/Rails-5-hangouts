module ConversationsHelper
  def set_availability_class(haunt_id, active_ids)
    return "online" if haunt_id.in? active_ids
    return "offline"
  end

  def self_or_other(message, haunt)
    message.haunt == haunt ? "self" : "other"
  end

  def message_interlocutor(message)
    message.haunt == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
