class Haunt < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :messages
  has_many :conversations, class_name: 'Conversation', foreign_key: :sender_id

  def display_name
    email
  end
end
