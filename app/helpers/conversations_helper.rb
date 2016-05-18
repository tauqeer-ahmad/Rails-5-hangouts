module ConversationsHelper
  def set_availability_class(haunt_id, active_ids)
    return "on" if haunt_id.in? active_ids
    return "off"
  end

  def set_availability_class_img(haunt_id, active_ids)
    return "on-avatar" if haunt_id.in? active_ids
    return "off-avatar"
  end

  def set_availability_text(haunt_id, active_ids)
    return "online" if haunt_id.in? active_ids
    return "offline"
  end

  def self_or_other(message, haunt = nil)
    return if haunt == nil
    message.haunt == haunt ? "i" : "friend-with-a-SVAGina"
  end

  def message_interlocutor(message)
    message.haunt == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
