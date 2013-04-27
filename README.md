#devise-kerberos-authenticatable

##Description

devise-kerberos-authenticatable is a Devise exenstion that can be used to authenticate against Kerberos as setup in your local krb5.conf file.  

##Installation

###Dependencies
[timfel-krb5-auth](https://github.com/timfel/krb5-auth) depends on the headers and development libraries for MIT Kerberos.

```sudo apt-get install libkrb5-dev```
###Server Setup
Modify your /etc/krb5.conf file as necessary to authenticate against your Kerberos server.

###Rails Setup
* Update your gemfile

```gem 'devise-kerberos-authenticatable', :git => 'git://github.com/atomaka/devise-kerberos-authenticatable.git'```
* Edit config/initializers/devise.rb to use a username instead of email for login.

```config.authentication_keys = [ :username ]```
* Update your Devise model app/models/user.rb

```
devise :kerberos_authenticatable
attr_accessible :username
```

* Update your User table in your database to include the username field and remove the index from the email field.
* Rebuild your Devise views automatically or by hand.

```
rake generate devise:views
```

##Other
* Currently only supports authentication and does not include password modification functionality.
* Initial code based largely on [devise_pam_authenticatable](https://github.com/jwilson511/devise_pam_authenticatable)
