require 'devise_kerberos_authenticatable/strategy'

module Devise
  module Models
    module KerberosAuthenticatable
      def self.included(base)
        base.class_eval do
          extend ClassMethods

          attr_accessor :password
        end
      end

      def clean_up_passwords
        self.password = nil
      end

      def valid_kerberos_authentication?(password)
        Devise::KerberosAdapter.valid_credentials?(self.username, password)
      end

      module ClassMethods
        def authenticate_with_kerberos(attributes = {})
          return nil unless attributes[:username].present?

          resource = all.where(:username => attributes['username']).first

          if resource.blank?
            resource = new
            resource[:username] = attributes['username']
          end

          if resource.try(:valid_kerberos_authentication?, attributes[:password])
            resource.save if resource.new_record?
            return resource
          else
            return nil
          end
        end
      end
    end
  end
end
