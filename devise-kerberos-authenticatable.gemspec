require 'rake'

Gem::Specification.new do |s|
  s.name            = 'devise-kerberos-authenticatable'
  s.version         = '0.1.0'
  s.date            = '2013-04-21'
  s.summary         = 'Devise authentication strategy for Kerberos'
  s.description     = 'Devise extension providing the ability to authenticate
                      against Kerberos as defined in your local krb5.conf file
                      using timfel-krb5-auth.'
  s.authors         = ['Andrew Tomaka']
  s.email           = 'atomaka@gmail.com'
  s.files           = FileList['lib/**/*.rb'].to_a
  s.homepage        = 'http://www.github.com/atomaka/devise-kerberos-authenticatable'

  s.add_dependency  'timfel-krb5-auth', '~> 0.8'
  s.add_dependency  'devise', '~> 3.1.1'
end
