require 'rake'

Gem::Specification.new do |s|
  s.name            = 'devise-kerberos-authenticatable'
  s.version         = '0.1.3'
  s.date            = '2015-06-23'
  s.summary         = 'Devise authentication strategy for Kerberos'
  s.description     = 'Devise extension providing the ability to authenticate
                      against Kerberos as defined in your local krb5.conf file
                      using timfel-krb5-auth.'
  s.authors         = ['Andrew Tomaka', 'Paul Rowe-White', 'Simon Stueckemann']
  s.email           = 'atomaka@gmail.com'
  s.files           = FileList['lib/**/*.rb'].to_a
  s.homepage        = 'https://gitlab.doc.ic.ac.uk/dcw/devise-kerberos-authenticatable'

  s.add_dependency  'timfel-krb5-auth', '~> 0.8'
  s.add_dependency  'devise', '~> 3.5.1'
end
