module ConversationsHelper
  def set_availability_class(haunt_id, active_ids)
    return "online" if haunt_id.in? active_ids
    return "offline"
  end
end
