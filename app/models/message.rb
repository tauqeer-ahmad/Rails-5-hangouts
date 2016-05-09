class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :haunt

  def display_haunt_name
    haunt.display_name
  end
end
