require 'krb5_auth'
include Krb5Auth

module Devise
  module KerberosAdapter
    def self.valid_credentials?(username, password)
      if test_environment? && username == 'test' && password == 'test' then
        return true
      end

      krb5 = Krb5.new
      begin
        krb5.get_init_creds_password(username_with_realm(username), password)
      rescue Krb5Auth::Krb5::Exception
        return false
      end

      return true
    end

    def username_with_realm(username)
      "#{username}@#{::Devise.kerberos_realm}"
    end

    def self.test_environment?
      Rails.env.test? || Rails.env.development?
    end
  end
end
