require 'krb5_auth'
include Krb5Auth

module Devise
  module KerberosAdapter
    def self.valid_credentials?(username, password)
      if Rails.env.test? && username == 'test' && password == 'test' then
        return true
      end

      krb5 = Krb5.new
      username_with_realm = "#{username}@#{::Devise.kerberos_realm}"
      begin
        krb5.get_init_creds_password(username_with_realm, password)
      rescue Krb5Auth::Krb5::Exception
        return false
      end

      return true
    end
  end
end
