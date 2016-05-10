class Haunt < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :messages
  has_many :conversations, class_name: 'Conversation', foreign_key: :sender_id

  scope :online, -> {where("id IN(?) AND updated_at > ?", $redis_onlines.keys, 5.minutes.ago)}

  def display_name
    [first_name, surname].join(' ')
  end

  def online?
    $redis_onlines.exists( self.id )
  end

  def self.online_haunts
    online
  end
end
