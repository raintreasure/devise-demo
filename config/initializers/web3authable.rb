require 'devise'

require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class Web3authable < Authenticatable
      def authenticate!
        puts('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ENTER MY FUNCTION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
        if params[:user]        
          if email == 'bob@gmail.com'
            user = User.find_or_create_by(email: email)
            success!(user)
          else
            return fail(:invalid_login)
          end
        end
      end
      
      def email
        params[:user][:email]
      end

      def password
        params[:user][:password]
      end

    end
  end
end

Warden::Strategies.add(:web3authable, Devise::Strategies::Web3authable)