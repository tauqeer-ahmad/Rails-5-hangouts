# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_haunt

    def connect
      self.current_haunt = find_verified_user
      logger.add_tags 'ActionCable', current_haunt.email
    end

    protected
      def find_verified_user
        verified_user = Haunt.find_by(id: cookies.signed['haunt.id'])
        if verified_user && cookies.signed['haunt.expires_at'] > Time.now
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
