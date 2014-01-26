require 'devise/strategies/base'

module Devise
  module Strategies
    class KerberosAuthenticatable < Base
      def valid?
        valid_controller? && valid_params? && mapping.to.respond_to?(:authenticate_with_kerberos)
      end

      def authenticate!
        if resource = mapping.to.authenticate_with_kerberos(params[scope])
          success!(resource)
        else
          fail(:invalid)
        end
      end

      protected
        def valid_controller?
          params[:controller].include?('sessions')
        end

        def valid_params?
          params[scope] && params[scope][:password].present?
        end
    end
  end
end

Warden::Strategies.add(
  :kerberos_authenticatable, 
  Devise::Strategies::KerberosAuthenticatable
)
